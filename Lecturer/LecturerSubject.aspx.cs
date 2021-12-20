using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scribe
{
    public partial class LecturerSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupLecturerSubject();
            }
        }

        public void SetupLecturerSubject()
        {
            dgLecturerSubject.ShowFooter = true;

            LecturerSubjectClass lect_subj = new LecturerSubjectClass();
            System.Data.DataSet ds = lect_subj.GetLecturerSubjectList(Session["lect_id"].ToString());
            dgLecturerSubject.DataSource = ds;
            dgLecturerSubject.DataBind();
        }

        protected void dgLecturerSubject_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgLecturerSubject.CurrentPageIndex = e.NewPageIndex;
            SetupLecturerSubject();
        }

        protected void dgLecturerSubject_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            
        }

        protected void dgLecturerSubject_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            Label id = (Label)e.Item.Cells[0].FindControl("lbl_ID");
            Label subjectName = (Label)e.Item.Cells[0].FindControl("lbl_SubjectName");
            Label subjectId = (Label)e.Item.Cells[0].FindControl("lbl_SubjectID");
            Session["workload_id"] = id.Text;
            Session["SubjectName"] = subjectName.Text;
            Session["SubjectID"] = subjectId.Text;
            if (e.CommandName == "CreateTutorial")
            {
                Server.Transfer("LecturerATL.aspx");
            }
            else if (e.CommandName == "ResultTF")
            {
                Server.Transfer("QTFResult.aspx");
            }
            else if (e.CommandName == "CreateViewQuizTF")
            {
                Server.Transfer("CreateViewQTF.aspx");
            }
            else if (e.CommandName == "ResultObj")
            {
                Server.Transfer("QObjResult.aspx");
            }
            else if (e.CommandName == "CreateViewQuizObj")
            {
                Server.Transfer("CreateViewQObj.aspx");
            }
        }

    }
}