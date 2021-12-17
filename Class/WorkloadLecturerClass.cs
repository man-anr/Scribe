using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;

namespace DatabaseProject
{
    public class WorkloadLecturerClass
    {
        private SqlCommand cmd = null;
        public DataSet GetWorkloadLecturerList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT workloadlecturer.* , lecturer.lect_name , subject.subj_name from workloadlecturer 
            left join lecturer on lecturer.lect_id = workloadlecturer.lect_id 
            left join subject on subject.subj_id = workloadlecturer.subj_id");
            DataSet ds = db.GetDataSet(cmd, "WorkloadLecturer");
            return ds;
        }
        public int UpdateWorkloadLecturer(string id, string lect_id, string subj_id)
        {
            DatabaseManager db = new DatabaseManager();
            SqlCommand cmd = new SqlCommand("UPDATE WorkloadLecturer " +
            "SET lect_id='" + lect_id + "', subj_id ='" + subj_id + "'" + "WHERE " + "id ='" + id + "'");
            return db.ExecuteNonQuery(cmd);
        }
        public int AddWorkloadLecturer(string lect_id, string subj_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into WorkloadLecturer (lect_id, subj_id) VALUES" +
             "(@P2, @P3)");
            cmd.Parameters.AddWithValue("@P2", lect_id);
            cmd.Parameters.AddWithValue("@P3", subj_id);
            return db.ExecuteNonQuery(cmd);
        }
        public int DeleteWorkloadLecturer(string id)
        {
            DatabaseManager db = new DatabaseManager();
            SqlCommand cmd = new SqlCommand("DELETE FROM WorkloadLecturer WHERE id='" + id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public ArrayList SelecLecturer(string strKey, string strValue)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("SELECT lect_id, lect_name FROM Lecturer");
            ArrayList drContainer = db.GetArrayList(cmd);
            ArrayList arResult = db.GetConcatCode(drContainer, strKey, strValue);
            return arResult;
        }

        public ArrayList SelecSubject(string strKey, string strValue)
        {
            DatabaseManager db = new DatabaseManager();
             cmd = new SqlCommand("SELECT subj_id, subj_name FROM Subject");
            ArrayList drContainer = db.GetArrayList(cmd);
            ArrayList arResult = db.GetConcatCode(drContainer, strKey, strValue);
            return arResult;
        }
    }
}