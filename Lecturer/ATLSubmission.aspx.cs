using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class ATLSubmission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupATLSubmission();
            }
        }

        public void SetupATLSubmission()
        {
            dgATLSubmission.ShowFooter = true;
            ATLClass atl = new ATLClass();
            DataSet ds = atl.GetStudentAssignmentList(int.Parse(Session["ATL_ID"].ToString()));
            dgATLSubmission.DataSource = ds;
            dgATLSubmission.DataBind();
        }

        protected void dgATLSubmission_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgATLSubmission.CurrentPageIndex = e.NewPageIndex;
            SetupATLSubmission();
        }

        protected void dgATLSubmission_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

        }

        protected void dgATLSubmission_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            ATLClass atl = new ATLClass();

            if (e.CommandName == "ViewATLSubmission")
            {
                Label atl_id = (Label)e.Item.Cells[0].FindControl("lbl_ID_ATLSubmission");
                int ID = int.Parse(atl_id.Text);
                byte[] bytes;
                string fileName, contentType;
                Dictionary<string, object> data = atl.DownloadStudentATL(ID);
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