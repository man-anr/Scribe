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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string id = txtbox_ID.Text;
            string pword = txtbox_password.Text;
            string people = id;
            System.Diagnostics.Debug.WriteLine("id: "+id);
            System.Diagnostics.Debug.WriteLine("popele: "+people);

            DatabaseManager db = new DatabaseManager();

            try
            {
                SqlConnection con = db.OpenConnection();
                if (people == "student")
                {
                    SqlCommand cmmd = new SqlCommand("SELECT * FROM Student WHERE stud_id='" + id + "' AND stud_pw='" + pword + "'", con);
                    SqlDataReader reader = cmmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["stud_id"] = id;
                        if (pword == id)
                        {
                            reader.Close();
                            Response.Redirect("UpdatePassword.aspx?id=" + id + "&people=" + people);
                        }
                        else
                        {
                            reader.Close();
                            Response.Redirect("Student/StudentSubject.aspx?id=" + id + "&people=" + people);
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Incorrect Student ID or Password. Try again!";
                    }
                    reader.Close();
                }

                else if (people == "lecturer")
                {
                    SqlCommand cmmd = new SqlCommand("SELECT * FROM Lecturer WHERE lect_id='" + id + "' AND lect_pw='" + pword + "'", con);
                    SqlDataReader reader = cmmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["lect_id"] = id;
                        if (pword == id)
                        {
                            reader.Close();
                            Response.Redirect("UpdatePassword.aspx?id=" + id + "&people=" + people);
                        }
                        else
                        {
                            reader.Close();
                            Response.Redirect("Lecturer/LecturerSubject.aspx?id=" + id + "&people=" + people);
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Incorrect Lecturer ID or Password. Try again!";
                    }
                }

                else if (people == "admin")
                {
                    SqlCommand cmmd = new SqlCommand("SELECT * FROM Admin WHERE admin_id='" + id + "' AND admin_pw='" + pword + "'", con);
                    SqlDataReader reader = cmmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["admin_id"] = id;
                        if (pword == id)
                        {
                            reader.Close();
                            Response.Redirect("UpdatePassword.aspx?id=" + id + "&people=" + people);
                        }
                        else
                        {
                            reader.Close();
                            Response.Redirect("Admin/Admin.aspx?id=" + id + "&people=" + people);
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Incorrect Admin ID or Password. Try again!";
                    }
                }
                else if (people == "")
                {
                    lblStatus.Text = "Choose either Student Login or Lecturer Login or Admin Login. Try again!";
                }

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
            txtbox_ID.Text = "";
        }

        protected void txtbox_password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}