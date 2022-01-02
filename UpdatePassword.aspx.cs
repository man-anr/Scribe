using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Scribe
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        private SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            ButtonHere.Visible = false;
            String id = Request.QueryString["id"];
            System.Diagnostics.Debug.WriteLine("-----------------" + id);
            
        }
        protected void confirm_password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

            String id = Request.QueryString["id"];
            var items = id.Split('-');
            string people = items[0];
            String confirmpw = confirm_password.Text;

            System.Diagnostics.Debug.WriteLine(""+people + confirmpw + id);

            DatabaseManager db = new DatabaseManager();
            SqlConnection con = db.OpenConnection();
            //try
            //{
            if (people == "st")
            {

                //SqlCommand cmmd = new SqlCommand("UPDATE Student SET stud_pw='" + id + "' WHERE stud_id='" + confirmpw + "'", con);
                //con.Open();
                //db.ExecuteNonQuery(cmmd);
                //con.Close();
                //SqlDataReader reader = cmmd.ExecuteReader();

                cmd = new SqlCommand("UPDATE Student SET stud_pw=@newpw WHERE stud_id=@studid");
                cmd.Parameters.Add("@newpw", sqlDbType: SqlDbType.VarChar).Value = confirmpw;
                cmd.Parameters.Add("@studid", sqlDbType: SqlDbType.VarChar).Value = id;
                db.ExecuteNonQuery(cmd);
                System.Diagnostics.Debug.WriteLine("----- " + "UPDATE Student SET stud_pw='" + confirmpw + "' WHERE stud_id='" + id + "'");

            }
            else if (people == "lt")
            {
                cmd = new SqlCommand("UPDATE Lecturer SET lect_pw=@newpw WHERE lect_id=@lectid");
                cmd.Parameters.Add("@newpw", sqlDbType: SqlDbType.VarChar).Value = confirmpw;
                cmd.Parameters.Add("@lectid", sqlDbType: SqlDbType.VarChar).Value = id;
                db.ExecuteNonQuery(cmd);
                System.Diagnostics.Debug.WriteLine("lt " + cmd);

            }
            else if (people == "aa")
            {
                cmd = new SqlCommand("UPDATE Admin SET admin_pw=@newpw WHERE admin_id=@adminid");
                cmd.Parameters.Add("@newspw", sqlDbType: SqlDbType.VarChar).Value = confirmpw;
                cmd.Parameters.Add("@adminid", sqlDbType: SqlDbType.VarChar).Value = id;
                db.ExecuteNonQuery(cmd);
                System.Diagnostics.Debug.WriteLine("aa " + cmd);

            }
            else if (confirmpw == "root")
            {
                System.Diagnostics.Debug.WriteLine("password cant be old");
            }
            rfvPword.Enabled = false;
            RequiredFieldValidator1.Enabled = false;
            ButtonHere.Visible = true;
            lbl_success.Text = "Password updated successfully. Click ";
            Response.Redirect("Login.aspx", false);
            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.ToString());
            //}
            //finally
            //{
            //    db.CloseConnection();
            //}
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            confirm_password.Text = "";
        }

        protected void ButtonHere_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}