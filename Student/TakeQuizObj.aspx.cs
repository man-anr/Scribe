using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scribe
{
    public partial class TakeQuizObj : System.Web.UI.Page
    {
        string[] answer = { "A", "B", "C", "D" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupQuizObj();
            }
        }
        public void SetupQuizObj()
        {
            dgTakeQuizObj.ShowFooter = true;

            QuizObjectiveClass quiz_obj = new QuizObjectiveClass();
            DataSet ds = quiz_obj.GetQuizObjList(int.Parse(Session["workload_id"].ToString()));
            dgTakeQuizObj.DataSource = ds;
            dgTakeQuizObj.DataBind();
        }


        protected void dgTakeQuizObj_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgTakeQuizObj.CurrentPageIndex = e.NewPageIndex;
            SetupQuizObj();
        }



        protected void dgTakeQuizObj_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnFinishAnswer") != null)
            {
                ((Button)e.Item.FindControl("btnFinishAnswer")).Attributes.Add("onClick", "return confirm('Are you sure to finish this quiz?');");
            }

            if (e.Item.FindControl("btnConfirmAnswer") != null)
            {
                ((Button)e.Item.FindControl("btnConfirmAnswer")).Attributes.Add("onClick", "return confirm('Are you sure to confirm the answer?');");
            }
        }

        protected void dgTakeQuizObj_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            QuizObjectiveClass quiz_obj = new QuizObjectiveClass();
            bool question_confirmed = true;
            int mark = 0;
            int questioncount = dgTakeQuizObj.Items.Count;
            if (e.CommandName == "ConfirmAnswer")
            {
                TextBox stud_answer = (TextBox)e.Item.Cells[0].FindControl("txt_Your_Ans");
                Label confirm = (Label)e.Item.Cells[0].FindControl("lbl_Confirm");
                if (stud_answer.Text == "")
                {
                    lblAttention.Text = "You need to answer the questions.";
                }
                else
                {
                    if (!answer.Contains(stud_answer.Text.Trim().ToUpper()))
                    {
                        lblAttention.Text = "Answer only allow A B C D";
                    }
                    else 
                    {
                        confirm.Text = "true";
                        stud_answer.Enabled = false;
                    }
                            
                }

            }

            else if (e.CommandName == "FinishAnswer")
            {
                foreach (DataGridItem dgi in dgTakeQuizObj.Items)
                {
                    Label confirm = (Label)dgi.Cells[0].FindControl("lbl_Confirm");
                    if (confirm.Text != "true")
                    {
                        lblAttention.Text = "Answer(s) are not confirmed.";
                        question_confirmed = false;
                        break;
                    }
                }

                if (question_confirmed != false)
                {
                    foreach (DataGridItem dgi in dgTakeQuizObj.Items)
                    {
                        TextBox stud_answer = (TextBox)dgi.Cells[0].FindControl("txt_Your_Ans");
                        Label correctans = (Label)dgi.Cells[0].FindControl("lbl_Correct_Ans");
                        if (stud_answer.Text.ToUpper() == correctans.Text)
                            mark += 2;
                        else
                            mark -= 2;
                    }

                    if (mark < 0)
                        mark = 0;

                    quiz_obj.UpdateQuizObjMark(mark , int.Parse(Session["workload_id"].ToString()) , Session["stud_id"].ToString());
                    lblAttention.Text = "Thank you! Your marks are " + mark + "/" + questioncount * 2 + ".";
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