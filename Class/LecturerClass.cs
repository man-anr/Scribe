using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scribe
{
    public class LecturerClass
    {
        private SqlCommand cmd = null;
        public DataSet GetLecturerList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT lecturer.lect_id , lecturer.lect_name ,
            admin.admin_name as lect_modified_by, lecturer.lect_modified_date_time 
            FROM Lecturer left join admin on lecturer.lect_modified_by = admin.admin_id");
            DataSet ds = db.GetDataSet(cmd, "Lecturer");
            return ds;
        }

        public int UpdateLecturer(string original_id, string modified_id, string lecturerName, string admin_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Lecturer " +
            "SET lect_name='" + lecturerName + "' , lect_id='" + modified_id + "', " +
            "lect_modified_by='" + admin_id + "', lect_modified_date_time='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' " +
            "WHERE " + "lect_id ='" + original_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int AddLecturer(string id, string lecturerName, string admin_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Lecturer (lect_id , lect_name , lect_pw , " +
                "lect_created_by, lect_modified_by, lect_modified_date_time) VALUES" +
             "(@P1 , @P2, @P3 , @P5 , @P6 , @P7)");
            cmd.Parameters.AddWithValue("@P1", id);
            cmd.Parameters.AddWithValue("@P2", lecturerName);
            cmd.Parameters.AddWithValue("@P3", id);
            cmd.Parameters.AddWithValue("@P5", admin_id);
            cmd.Parameters.AddWithValue("@P6", admin_id);
            cmd.Parameters.AddWithValue("@P7", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteLecturer(string id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM lecturer WHERE lect_id='" + id + "'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}
