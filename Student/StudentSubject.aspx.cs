using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scribe
{
    public partial class StudentSubject : System.Web.UI.Page
    {
        public static string workloadid;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                SetupStudentSubject();
            }
        }

        public void SetupStudentSubject()
        {
            dgStudentSubject.ShowFooter = true;

            StudentSubjectClass stud_subj = new StudentSubjectClass();
            System.Data.DataSet ds = stud_subj.GetStudentSubjectList(Session["stud_id"].ToString());
            dgStudentSubject.DataSource = ds;
            dgStudentSubject.DataBind();
        }

        protected void dgStudentSubject_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgStudentSubject.CurrentPageIndex = e.NewPageIndex;
            SetupStudentSubject();
        }

        protected void dgStudentSubject_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            
        }

        protected void dgStudentSubject_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            Label id = (Label)e.Item.Cells[0].FindControl("lbl_ID");
            Label subjectName = (Label)e.Item.Cells[0].FindControl("lbl_SubjectName");
            Label subjectId = (Label)e.Item.Cells[0].FindControl("lbl_SubjectID");
            Session["workload_id"] = id.Text;
            Session["SubjectName"] = subjectName.Text;
            Session["SubjectID"] = subjectId.Text;

            if (e.CommandName == "ViewATL")
            {
                Server.Transfer("ViewATL.aspx");
            }
            else if (e.CommandName == "ViewQuizTF")
            {
                Label quiz_mark = (Label)e.Item.Cells[0].FindControl("lbl_QuizTFMark");
                if (quiz_mark.Text == "")
                {
                    Server.Transfer("TakeQuizTF.aspx");
                }
                else 
                {
                    if (int.Parse(quiz_mark.Text) > 0)
                    {
                        lblAttention.Text = "*You took the Quiz!";
                    }
                    else
                    {
                        Server.Transfer("TakeQuizTF.aspx");
                    }
                }
                
            }
            else if (e.CommandName == "ViewQuizObj")
            {
                Label quiz_mark = (Label)e.Item.Cells[0].FindControl("lbl_QuizObjMark");
                if (quiz_mark.Text == "")
                {
                    Server.Transfer("TakeQuizObj.aspx");
                }
                else
                {
                    if (int.Parse(quiz_mark.Text) > 0)
                    {
                        lblAttention.Text = "*You took the Quiz!";
                    }
                    else
                    {
                        Server.Transfer("TakeQuizObj.aspx");
                    }
                }
                
            }
        }

        protected void RegisterSubjectButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentRegisterSubject.aspx");
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }
    }
}