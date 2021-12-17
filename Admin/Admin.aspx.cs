using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_id"] != null)
            {
                lblid.Text = Session["admin_id"].ToString();
            }
        }

        protected void RegisterAdmin_Click1(object sender, EventArgs e)
        {
            Response.Redirect("RegisterAdmin.aspx");
        }

        protected void RegisterStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterStudent.aspx");
        }

        protected void RegisterLecturer_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterLecturer.aspx");
        }

        protected void RegisterSubject_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterSubject.aspx");
        }

        protected void RegisterWorkloadLecturer_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterWorkloadLecturer.aspx");
        }
    }
}