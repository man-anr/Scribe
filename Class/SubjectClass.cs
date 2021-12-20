using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scribe
{
    public class SubjectClass
    {
        private SqlCommand cmd = null;
        public DataSet GetSubjectList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT subject.subj_id , subject.subj_name ,
            admin.admin_name as subj_modified_by, subject.subj_modified_date_time 
            FROM Subject left join admin on subject.subj_modified_by = admin.admin_id");
            DataSet ds = db.GetDataSet(cmd, "Subject");
            return ds;

        }

        public int UpdateSubject(string original_id, string modified_id, string SubjectName, string admin_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Subject " +
            "SET subj_name='" + SubjectName + "' , subj_id='" + modified_id + "', " +
            "subj_modified_by='" + admin_id + "', subj_modified_date_time='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' " +
            "WHERE " + "subj_id ='" + original_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int AddSubject(string id, string SubjectName, string admin_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Subject (subj_id , subj_name , " +
                "subj_created_by, subj_modified_by, subj_modified_date_time) VALUES" +
             "(@P1 , @P2 , @P5 , @P6 , @P7)");
            cmd.Parameters.AddWithValue("@P1", id);
            cmd.Parameters.AddWithValue("@P2", SubjectName);
            cmd.Parameters.AddWithValue("@P5", admin_id);
            cmd.Parameters.AddWithValue("@P6", admin_id);
            cmd.Parameters.AddWithValue("@P7", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteSubject(string id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM Subject WHERE subj_id='" + id + "'");
            return db.ExecuteNonQuery(cmd);
        }

    }
}