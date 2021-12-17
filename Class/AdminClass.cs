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
    public class AdminClass
    {
        private SqlCommand cmd = null;

        public DataSet GetAdminList()
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand();
            cmd.CommandText = "SELECT admin_id , admin_name FROM Admin";
            DataSet ds = db.GetDataSet(cmd, "Admin");
            return ds;
        }

        public int UpdateAdmin(string original_id, string modified_id, string adminName)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("UPDATE Admin " + "SET admin_name='" + adminName + "' , admin_id='" + modified_id + "'" + "WHERE " + "admin_id ='" + original_id + "'");
            return db.ExecuteNonQuery(cmd);
        }

        public int AddAdmin(string id, string adminName)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand(@"Insert Into Admin (admin_id , admin_name , admin_pw) VALUES" +
             "(@P1 , @P2, @P3)");
            cmd.Parameters.AddWithValue("@P1", id);
            cmd.Parameters.AddWithValue("@P2", adminName);
            cmd.Parameters.AddWithValue("@P3", id);
            return db.ExecuteNonQuery(cmd);
        }

        public int DeleteAdmin(string id)
        {
            DatabaseManager db = new DatabaseManager();
            cmd = new SqlCommand("DELETE FROM admin WHERE admin_id='" + id + "'");
            return db.ExecuteNonQuery(cmd);
        }
    }
}