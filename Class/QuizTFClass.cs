using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DatabaseProject
{
    public class QuizTFClass
    {
        private SqlCommand cmd = null;
        public DataSet GetQuizTFList(int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT quiz_tf.quiz_tf_id,quiz_tf.quiz_tf_question,quiz_tf.true, lecturer.lect_name as 
            quiz_tf_modified_by,quiz_tf.quiz_tf_modified_date_time
            FROM Quiz_TF 
            LEFT JOIN lecturer on quiz_tf.quiz_tf_modified_by=lecturer.lect_id
            WHERE workload_id=" + workload_id);
            DataSet ds = db.GetDataSet(cmd, "Quiz_TF");
            return ds;
        }

        public DataSet GetQTFResult(int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"select Subj_Registration.stud_id , Subj_Registration.quiz_tf_mark , Student.stud_name from Subj_Registration
                    left join Student on Subj_Registration.stud_id = Student.stud_id where workload_id =" + workload_id);
            DataSet ds = db.GetDataSet(cmd, "QTFResut");
            return ds;
        }

        public int UpdateQuestion(string quizid, string txtmodifiedQuestion, int Temptrue, string lect_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Quiz_TF " +
            "SET quiz_tf_question='" + txtmodifiedQuestion + "' , true='" + Temptrue + 
            "' , quiz_tf_modified_by='" + lect_id + 
            "', quiz_tf_modified_date_time='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' " +
            "WHERE " + "quiz_tf_id ='" + quizid + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int AddQuestion(string txtTempQuestion, int Temptrue, string lect_id, int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Quiz_TF (quiz_tf_question,true,quiz_tf_modified_by,quiz_tf_modified_date_time,workload_id) VALUES" +
             "(@P2, @P3 , @P8, @P9,@P10)");
            cmd.Parameters.AddWithValue("@P2", txtTempQuestion);
            cmd.Parameters.AddWithValue("@P3", Temptrue);
            cmd.Parameters.AddWithValue("@P8", lect_id);
            cmd.Parameters.AddWithValue("@P9", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
            cmd.Parameters.AddWithValue("@P10", workload_id);
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteQuestion(string quizid, int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM quiz_tf WHERE quiz_tf_id='" + quizid + "' AND workload_id=" + workload_id);
            return db.ExecuteNonQuery(cmd);
        }

        public int GetAverageMark(int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            SqlConnection con = db.OpenConnection();
            /****** Script for SelectTopNRows command from SSMS  ******/
            SqlCommand cmd = new SqlCommand("select Count(*) as mark from Quiz_TF where workload_id =@ID", con);
            cmd.Parameters.AddWithValue("@ID", workload_id);
            SqlDataReader sdr = cmd.ExecuteReader();
            int average_mark = 0;
            if (sdr.Read())
            {
                average_mark = int.Parse(sdr["mark"].ToString());
            }
            sdr.Close();
            db.CloseConnection();
            return average_mark;
        }

        public int UpdateQuizTFMark(int mark, int workload_id, string stud_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Subj_Registration SET quiz_tf_mark =" + mark + " WHERE workload_id =" + workload_id + " and stud_id ='" + stud_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

    }
}