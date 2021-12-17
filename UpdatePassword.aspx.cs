using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DatabaseProject
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        private SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            ButtonHere.Visible = false;
            String id = Request.QueryString["id"];
            if (id != null)
            {
                lblid.Text = id.ToString();
            }
        }
        protected void confirm_password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

            String people = Request.QueryString["people"];
            String id = Request.QueryString["id"];
            String confirmpw = confirm_password.Text;

            DatabaseManager db = new DatabaseManager();
            SqlConnection con = db.OpenConnection();
            try
            {
                if (people == "Student")
                {
                    cmd = new SqlCommand("UPDATE Student SET stud_pw=@newpw WHERE stud_id=@studid");
                    cmd.Parameters.Add("@newpw", sqlDbType: SqlDbType.VarChar).Value = confirmpw;
                    cmd.Parameters.Add("@studid", sqlDbType: SqlDbType.VarChar).Value = id;
                    db.ExecuteNonQuery(cmd);

                }
                else if (people == "Lecturer")
                {
                    cmd = new SqlCommand("UPDATE Lecturer SET lect_pw=@newpw WHERE lect_id=@lectid");
                    cmd.Parameters.Add("@newpw", sqlDbType: SqlDbType.VarChar).Value = confirmpw;
                    cmd.Parameters.Add("@lectid", sqlDbType: SqlDbType.VarChar).Value = id;
                    db.ExecuteNonQuery(cmd);

                }
                else
                {
                    cmd = new SqlCommand("UPDATE Admin SET admin_pw=@newpw WHERE admin_id=@adminid");
                    cmd.Parameters.Add("@newpw", sqlDbType: SqlDbType.VarChar).Value = confirmpw;
                    cmd.Parameters.Add("@adminid", sqlDbType: SqlDbType.VarChar).Value = id;
                    db.ExecuteNonQuery(cmd);

                }
                rfvPword.Enabled = false;
                RequiredFieldValidator1.Enabled = false;
                ButtonHere.Visible = true;
                lbl_success.Text = "Password updated successfully. Click ";
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                db.CloseConnection();
            }
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