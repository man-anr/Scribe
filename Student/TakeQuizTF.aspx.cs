using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scribe
{
    public partial class TakeQuizTF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupQuizObj();
            }
        }
        public void SetupQuizObj()
        {
            dgTakeQuizTF.ShowFooter = true;

            QuizTFClass quiz_tf = new QuizTFClass();
            DataSet ds = quiz_tf.GetQuizTFList(int.Parse(Session["workload_id"].ToString()));
            dgTakeQuizTF.DataSource = ds;
            dgTakeQuizTF.DataBind();
        }


        protected void dgTakeQuizTF_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgTakeQuizTF.CurrentPageIndex = e.NewPageIndex;
            SetupQuizObj();
        }



        protected void dgTakeQuizTF_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
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

        protected void dgTakeQuizTF_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            QuizTFClass quiz_tf = new QuizTFClass();
            bool question_confirmed = true;
            int mark = 0;
            int questioncount = dgTakeQuizTF.Items.Count;
            if (e.CommandName == "ConfirmAnswer")
            {
                RadioButtonList answer = (RadioButtonList)e.Item.Cells[0].FindControl("radio_ans");
                Label confirm = (Label)e.Item.Cells[0].FindControl("lbl_Confirm");
                if (answer.SelectedValue == "")
                {
                    lblAttention.Text = "You need to choose an answers.";
                    lblAttention.Text = questioncount.ToString();
                }
                else
                {
                    confirm.Text = "true";
                    answer.Enabled = false;
                }
            }

            else if (e.CommandName == "FinishAnswer")
            {
                foreach (DataGridItem dgi in dgTakeQuizTF.Items)
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
                    foreach (DataGridItem dgi in dgTakeQuizTF.Items)
                    {
                        RadioButtonList answer = (RadioButtonList)dgi.Cells[0].FindControl("radio_ans");
                        Label correctans = (Label)dgi.Cells[0].FindControl("lbl_Correct_Ans");
                        if (answer.SelectedValue == correctans.Text)
                            mark += 2;
                        else
                            mark -= 2;
                    }

                    if (mark < 0)
                        mark = 0;

                    quiz_tf.UpdateQuizTFMark(mark, int.Parse(Session["workload_id"].ToString()), Session["stud_id"].ToString());
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