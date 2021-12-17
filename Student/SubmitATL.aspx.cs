using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class SubmitATL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubjectListRegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentSubject.aspx");
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }

        protected void btnUploadDocument(object sender, EventArgs e)
        {
            ATLClass lectclass = new ATLClass();
            if (fileupload.PostedFile.FileName == "")
            {
                lblAttention.Text = "Please select a file before upload.";
            }
            else
            {
                int result = lectclass.SubmitATL(fileupload, Session["stud_id"].ToString(), int.Parse(Session["ATL_ID"].ToString()));
                if (result > 0)
                {
                    lblAttention.Text = "failed to upload";
                }
                else
                {
                    lblAttention.Text = "Successful";
                }
            }
        }
    }
}