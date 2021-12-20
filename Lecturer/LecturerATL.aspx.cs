using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Scribe
{
    public partial class LecturerATL : System.Web.UI.Page
    {
        public static int atl_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupLecturerATL();
            }
        }

        public void SetupLecturerATL()
        {
            dgLectATL.ShowFooter = true;
            ATLClass atl = new ATLClass();
            DataSet ds = atl.GetAssignmentList(int.Parse(Session["workload_id"].ToString()));
            dgLectATL.DataSource = ds;
            dgLectATL.DataBind();
        }

        protected void dgLectATL_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgLectATL.CurrentPageIndex = e.NewPageIndex;
            SetupLecturerATL();
        }

        protected void dgLectATL_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteATL") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteATL")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }

        }

        protected void dgLectATL_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            ATLClass atl = new ATLClass();

            if (e.CommandName == "ViewATL")
            {
                Label atl_id = (Label)e.Item.Cells[0].FindControl("lbl_ID_LectATL");
                int ID = int.Parse(atl_id.Text);
                byte[] bytes;
                string fileName, contentType;
                Dictionary<string, object> data = atl.DownloadATL(ID);
                fileName = (string)data["Document"];
                bytes = (byte[])data["Data"];
                contentType = (string)data["ContentType"];
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = contentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();
            }

            else if (e.CommandName == "SubmissionATL")
            {
                Label atl_name = (Label)e.Item.Cells[0].FindControl("lbl_LectATL_Name");
                Label atl_id = (Label)e.Item.Cells[0].FindControl("lbl_ID_LectATL");
                Session["ATL_Name"] = atl_name.Text;
                Session["ATL_ID"] = atl_id.Text;
                Server.Transfer("ATLSubmission.aspx");
            }

            else if (e.CommandName == "DeleteATL")
            {
                Label atl_id = (Label)e.Item.Cells[0].FindControl("lbl_ID_LectATL");
                int result = atl.DeleteATL(atl_id.Text);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "atl");
                }
                else
                {
                    Server.Transfer("LecturerATL.aspx");
                }
            }
        }

        protected void btnUploadDocument(object sender, EventArgs e)
        {
            ATLClass lectclass = new ATLClass();
            string name = LectATL_Name.Text;
            if (name == "" || fileupload.PostedFile.FileName == "")
            {
                lblAttention.Text = "Please put in name and file before upload.";
            }
            else
            {
                int result = lectclass.UploadATL(fileupload, name, Session["lect_id"].ToString(), int.Parse(Session["workload_id"].ToString()));
                if (result > 0)
                {
                    lblAttention.Text = "failed to upload";
                }
                else
                {
                    Server.Transfer("LecturerATL.aspx");
                }
            }
            
        }

        protected void ListSubjectButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerSubject.aspx");
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }
    }
}