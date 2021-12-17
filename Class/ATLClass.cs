using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public class ATLClass
    {
        private SqlCommand cmd = null;
        public int UploadATL(FileUpload fileupload, string atl_name, string lect_id, int workloadlecturer_id)
        {
            string FN = "";
            FN = Path.GetFileName(fileupload.PostedFile.FileName);
            string contentType = fileupload.PostedFile.ContentType;
            Stream fs = fileupload.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            byte[] bytes = br.ReadBytes((Int32)fs.Length);

            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"insert into ATL(atl_name, atl_file_name,
            atl_content_type, atl_data, atl_created_by, 
            atl_modified_by,atl_modified_date_time,atl_workloadlecturer_id ) 
            values(@ATLName, @FileName, @ContentType, @Data, @CreatedBy, @ModifiedBy, @ModifiedDatetime, @WorkloadLecturerID)");

            if (FN != "")
            {
                cmd.Parameters.AddWithValue("@ATLName", atl_name);
                cmd.Parameters.AddWithValue("@FileName", FN);
                cmd.Parameters.AddWithValue("@ContentType", contentType);
                cmd.Parameters.AddWithValue("@Data", bytes);
                cmd.Parameters.AddWithValue("@CreatedBy", lect_id);
                cmd.Parameters.AddWithValue("@ModifiedBy", lect_id);
                cmd.Parameters.AddWithValue("@ModifiedDatetime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                cmd.Parameters.AddWithValue("@WorkloadLecturerID", workloadlecturer_id);

            }
            return db.ExecuteNonQuery(cmd);
        }

        public int SubmitATL(FileUpload fileupload, string stud_id, int atl_id)
        {
            string FN = "";
            FN = Path.GetFileName(fileupload.PostedFile.FileName);
            string contentType = fileupload.PostedFile.ContentType;
            Stream fs = fileupload.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            byte[] bytes = br.ReadBytes((Int32)fs.Length);

            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"insert into ATLSubmission(atlsubmission_file_name, 
            atlsubmission_content_type, atlsubmission_data, atlsubmission_stud_id, 
            atlsubmission_atl_id, atlsubmission_uploaded_date_time) 
            values(@FileName, @ContentType, @Data, @StudentID, @ATL_ID, @UploadedDateTime)");

            if (FN != "")
            {
                cmd.Parameters.AddWithValue("@FileName", FN);
                cmd.Parameters.AddWithValue("@ContentType", contentType);
                cmd.Parameters.AddWithValue("@Data", bytes);
                cmd.Parameters.AddWithValue("@StudentID", stud_id);
                cmd.Parameters.AddWithValue("@ATL_ID", atl_id);
                cmd.Parameters.AddWithValue("@UploadedDateTime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));

            }
            return db.ExecuteNonQuery(cmd);
        }

        public Dictionary<string, object> DownloadStudentATL(int atlsubmission_id)
        {
            DatabaseManager db = new DatabaseManager();
            SqlConnection con = db.OpenConnection();
            /****** Script for SelectTopNRows command from SSMS  ******/
            SqlCommand cmd = new SqlCommand("select atlsubmission_file_name, atlsubmission_data, atlsubmission_content_type from ATLSubmission where atlsubmission_id=@ID", con);
            cmd.Parameters.AddWithValue("@ID", atlsubmission_id);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            Dictionary<string, object> downloadfile = new Dictionary<string, object>();
            downloadfile.Add("Document", sdr["atlsubmission_file_name"].ToString()); //adding key/value using the Add() method
            downloadfile.Add("Data", (byte[])sdr["atlsubmission_data"]);
            downloadfile.Add("ContentType", sdr["atlsubmission_content_type"].ToString());
            sdr.Close();
            db.CloseConnection();
            return downloadfile;
        }

        public Dictionary<string, object> DownloadATL(int atl_id)
        {
            DatabaseManager db = new DatabaseManager();
            SqlConnection con = db.OpenConnection();
            /****** Script for SelectTopNRows command from SSMS  ******/
            SqlCommand cmd = new SqlCommand(@"select atl_file_name, atl_data, " +
                "atl_content_type from ATL where atl_id=@ID", con);
            cmd.Parameters.AddWithValue("@ID", atl_id);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            Dictionary<string, object> downloadfile = new Dictionary<string, object>();
            downloadfile.Add("Document", sdr["atl_file_name"].ToString()); //adding key/value using the Add() method
            downloadfile.Add("Data", (byte[])sdr["atl_data"]);
            downloadfile.Add("ContentType", sdr["atl_content_type"].ToString());
            db.CloseConnection();
            return downloadfile;
        }

        public DataSet GetStudentAssignmentList(int atl_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"  select atlsubmission_id , atlsubmission_file_name , atlsubmission_stud_id , Student.stud_name from [ATLSubmission]
             left join Student on ATLSubmission.atlsubmission_stud_id = Student.stud_id where atlsubmission_atl_id = " + atl_id);
            DataSet ds = db.GetDataSet(cmd, "atlsubmission");
            return ds;
        }

        public DataSet GetAssignmentList(int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT ATL.* , Lecturer.lect_name from ATL left join Lecturer on 
                lecturer.lect_id = ATL.atl_modified_by
                where atl_workloadlecturer_id =" + workload_id);
            DataSet ds = db.GetDataSet(cmd, "ATL");
            return ds;
        }

        public DataSet GetAssignmentListWithStudentSubmission(int workload_id , string stud_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"select ATL.atl_id, ATL.atl_name , ATLSubmission.atlsubmission_id, ATLSubmission.atlsubmission_file_name from ATL left join  ATLSubmission 
            on ATL.atl_id = ATLSubmission.atlsubmission_atl_id and atlsubmission_stud_id = '" + stud_id +"' where ATL.atl_workloadlecturer_id= " + workload_id);
            DataSet ds = db.GetDataSet(cmd, "ATLwithSubmission");
            return ds;
        }

        public int DeleteATL(string atl_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM ATL WHERE atl_id='" + atl_id + "'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}