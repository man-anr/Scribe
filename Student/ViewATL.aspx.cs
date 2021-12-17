using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class ViewATL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupStudentViewATL();
            }
        }

        public void SetupStudentViewATL()
        {
            dgViewATL.ShowFooter = true;
            ATLClass atl = new ATLClass();
            DataSet ds = atl.GetAssignmentListWithStudentSubmission(int.Parse(Session["workload_id"].ToString()) , Session["stud_id"].ToString());
            dgViewATL.DataSource = ds;
            dgViewATL.DataBind();
        }

        protected void dgViewATL_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgViewATL.CurrentPageIndex = e.NewPageIndex;
            SetupStudentViewATL();
        }

        protected void dgViewATL_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

        }

        protected void dgViewATL_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            ATLClass atl = new ATLClass();

            if (e.CommandName == "DownloadATL")
            {
                Label atl_id = (Label)e.Item.Cells[0].FindControl("lbl_ID_ATL");
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
            else if (e.CommandName == "SubmitATL")
            {
                Label atlsubmission_id = (Label)e.Item.Cells[0].FindControl("lbl_SubmittedATL_ID");
                Label atl_name = (Label)e.Item.Cells[0].FindControl("lbl_ATL_Name");
                Label atl_id = (Label)e.Item.Cells[0].FindControl("lbl_ID_ATL");
                Session["ATL_Name"] = atl_name.Text;
                Session["ATL_ID"] = atl_id.Text;
                if (atlsubmission_id.Text == "")
                {
                    Server.Transfer("SubmitATL.aspx");
                }
                else
                {
                    lblAttention.Text = "Document uploaded.";
                }
                
            }
        }

        protected void SubjectListRegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentSubject.aspx");
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }
    }
}