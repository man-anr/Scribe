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
    public class StudentClass
    {
        private SqlCommand cmd = null;
        public DataSet GetStudentList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"SELECT student.stud_id , student.stud_name , student.stud_email, 
            admin.admin_name as modified_by, student.modified_date_time 
            FROM Student left join admin on student.modified_by = admin.admin_id");
            DataSet ds = db.GetDataSet(cmd, "Student");
            return ds;
        }

        public int UpdateStudent(string original_id, string modified_id, string studentName, string admin_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Student " +
            "SET stud_name='" + studentName + "' , stud_id='" + modified_id +"', stud_email='" + modified_id +"@siswa.uthm.edu.my', " +
            "modified_by='" + admin_id + "', modified_date_time='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' "+
            "WHERE " + "stud_id ='" + original_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int AddStudent(string id, string studentName, string admin_id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Student (stud_id , stud_name , stud_pw , " +
                "stud_email , created_by, modified_by, modified_date_time) VALUES" +
             "(@P1 , @P2, @P3 , @P4 , @P5 , @P6 , @P7)");
            cmd.Parameters.AddWithValue("@P1", id);
            cmd.Parameters.AddWithValue("@P2", studentName);
            cmd.Parameters.AddWithValue("@P3", id);
            cmd.Parameters.AddWithValue("@P4", id + "@siswa.uthm.edu.my");
            cmd.Parameters.AddWithValue("@P5", admin_id);
            cmd.Parameters.AddWithValue("@P6", admin_id);
            cmd.Parameters.AddWithValue("@P7", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteStudent(string id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM student WHERE stud_id='" + id +"'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}