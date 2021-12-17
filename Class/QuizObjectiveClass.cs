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
    public class QuizObjectiveClass
    {
        private SqlCommand cmd = null;
        public DataSet GetQuizObjList(int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT quiz_obj.quiz_obj_id,quiz_obj.quiz_obj_question,quiz_obj.ans_a, quiz_obj.ans_b, quiz_obj.ans_c, 
            quiz_obj.ans_d, quiz_obj.correct_ans, lecturer.lect_name as quiz_obj_modified_by,quiz_obj.quiz_obj_modified_date_time
            FROM Quiz_Obj 
            LEFT JOIN lecturer on quiz_obj.quiz_obj_modified_by=lecturer.lect_id
            WHERE workload_id=" + workload_id);
            DataSet ds = db.GetDataSet(cmd, "Quiz_Obj");
            return ds;
        }

        public DataSet GetQObjResult(int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"select Subj_Registration.stud_id , Subj_Registration.quiz_obj_mark , Student.stud_name from Subj_Registration
                    left join Student on Subj_Registration.stud_id = Student.stud_id where workload_id =" + workload_id);
            DataSet ds = db.GetDataSet(cmd, "QTFResut");
            return ds;
        }

        public int UpdateQuestion(string quizid, string txtmodifiedQuestion, string txtmodifiedAnsA, string txtmodifiedAnsB,
            string txtmodifiedAnsC, string txtmodifiedAnsD, string txtmodifiedCorrectAns , string lect_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Quiz_Obj " +
            "SET quiz_obj_question='" + txtmodifiedQuestion + "' , ans_a='" + txtmodifiedAnsA + "' , ans_b='" + txtmodifiedAnsB +
            "' , ans_c='" + txtmodifiedAnsC + "' , ans_d='" + txtmodifiedAnsD + "' , correct_ans='" + txtmodifiedCorrectAns +
            "', quiz_obj_modified_by='" + lect_id + "', quiz_obj_modified_date_time='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' " +
            "WHERE " + "quiz_obj_id ='" + quizid + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int AddQuestion(string txtTempQuestion, string txtTempAnsA, string txtTempAnsB, string txtTempAnsC, string txtTempAnsD, string txtTempCorrectAns, string lect_id, int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Quiz_Obj (quiz_obj_question , ans_a , ans_b ,ans_c,ans_d,correct_ans,quiz_obj_modified_by,quiz_obj_modified_date_time,workload_id) VALUES" +
             "(@P2, @P3 , @P4 , @P5 , @P6 , @P7, @P8, @P9,@P10)");
            cmd.Parameters.AddWithValue("@P2", txtTempQuestion);
            cmd.Parameters.AddWithValue("@P3", txtTempAnsA);
            cmd.Parameters.AddWithValue("@P4", txtTempAnsB);
            cmd.Parameters.AddWithValue("@P5", txtTempAnsC);
            cmd.Parameters.AddWithValue("@P6", txtTempAnsD);
            cmd.Parameters.AddWithValue("@P7", txtTempCorrectAns);
            cmd.Parameters.AddWithValue("@P8", lect_id);
            cmd.Parameters.AddWithValue("@P9", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
            cmd.Parameters.AddWithValue("@P10", workload_id);
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteQuestion(string quizid)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM quiz_obj WHERE quiz_obj_id='" + quizid + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int GetAverageMark(int workload_id)
        {
            DatabaseManager db = new DatabaseManager();
            SqlConnection con = db.OpenConnection();
            /****** Script for SelectTopNRows command from SSMS  ******/
            SqlCommand cmd = new SqlCommand("select Count(*) as mark from Quiz_Obj where workload_id =@ID", con);
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

        public int UpdateQuizObjMark(int mark, int workload_id, string stud_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Subj_Registration SET quiz_obj_mark =" + mark + " WHERE workload_id =" + workload_id + " and stud_id ='" + stud_id+"'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}