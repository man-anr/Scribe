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
    public class StudentSubjectClass

    {
        private SqlCommand cmd = null;
        public DataSet GetStudentSubjectList(string stud_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT Subj_Registration.* , Workloadlecturer.subj_id, Subject.subj_name , Lecturer.lect_name FROM Subj_Registration
            left join WorkloadLecturer on Subj_Registration.workload_id=WorkloadLecturer.id
            left join Subject on Subject.subj_id = WorkloadLecturer.subj_id
            left join Lecturer on Lecturer.lect_id = WorkloadLecturer.lect_id           
            WHERE Subj_Registration.stud_id = '" + stud_id + "'");
            DataSet ds = db.GetDataSet(cmd, "StudentSubject");
            return ds;
        }

        public bool CheckSubjRegistered(string subj_id, string stud_id)
        {
            string subj = "";
            DatabaseManager db = new DatabaseManager();
            SqlConnection con = db.OpenConnection();
            SqlCommand cmd = new SqlCommand(@"SELECT subj_id FROM Subj_Registration 
            left join workloadlecturer on subj_registration.workload_id=workloadlecturer.id
            WHERE stud_id='" + stud_id + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            bool exist = false; 
            while (reader.Read())
            {
                subj = reader["subj_id"].ToString();
                if (subj == subj_id)
                {
                    exist = exist || true; 
                }
            }
            reader.Close();
            db.CloseConnection();
            return exist;

        }
        public int RegisterSubject(string workloadid, string stud_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Subj_Registration (workload_id , stud_id) VALUES" +
             "(@P1 , @P2)");
            cmd.Parameters.AddWithValue("@P1", workloadid);
            cmd.Parameters.AddWithValue("@P2", stud_id);
            return db.ExecuteNonQuery(cmd);
        }
    }
}