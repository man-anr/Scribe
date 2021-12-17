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

namespace DatabaseProject
{

    public partial class CreateViewQObj : System.Web.UI.Page
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

            dgQuizObj.ShowFooter = true;
            QuizObjectiveClass quiz_obj = new QuizObjectiveClass();
            DataSet ds = quiz_obj.GetQuizObjList(int.Parse(Session["workload_id"].ToString()));
            dgQuizObj.DataSource = ds;
            dgQuizObj.DataBind();
        }

        protected void dgQuizObj_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgQuizObj.CurrentPageIndex = e.NewPageIndex;
            SetupQuizObj();
        }

        protected void dgQuizObj_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteQuestion") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteQuestion")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }

        }

        protected void dgQuizObj_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            QuizObjectiveClass quiz_obj = new QuizObjectiveClass();
            
            if (e.CommandName == "AddQuestion")
            {             
                TextBox txtTempQuestion = (TextBox)e.Item.Cells[0].FindControl("txt_QuizObj_Question_New");
                TextBox txtTempAnsA = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_A_New");
                TextBox txtTempAnsB = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_B_New");
                TextBox txtTempAnsC = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_C_New");
                TextBox txtTempAnsD = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_D_New");
                TextBox txtTempCorrectAns = (TextBox)e.Item.Cells[0].FindControl("txt_Correct_Ans_New");
                if (txtTempQuestion.Text.Trim() == "" || txtTempAnsA.Text.Trim() == "" || 
                    txtTempAnsB.Text.Trim() == "" || txtTempAnsC.Text.Trim() == "" ||
                    txtTempAnsD.Text.Trim() == "" || txtTempCorrectAns.Text.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else if(!answer.Contains(txtTempCorrectAns.Text.Trim().ToUpper()))
                {
                    lblAttention.Text = "Answer only allow A B C D";
                }
                else
                {
                    int result = quiz_obj.AddQuestion(txtTempQuestion.Text, txtTempAnsA.Text, txtTempAnsB.Text, txtTempAnsC.Text, txtTempAnsD.Text, txtTempCorrectAns.Text.ToUpper(),Session["lect_id"].ToString() , int.Parse(Session["workload_id"].ToString()));
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "quizobj");
                    }
                    else
                    {
                        Server.Transfer("CreateViewQObj.aspx");
                    }
                }
            }

            else if (e.CommandName == "DeleteQuestion")
            {
                // to do check subject or can rely MSSQL to do the checking
                Label quizid = (Label)e.Item.Cells[0].FindControl("lbl_ID_QuizObj");
                int result = quiz_obj.DeleteQuestion(quizid.Text);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "quizobj");
                }
                else
                {
                    Server.Transfer("CreateViewQObj.aspx");
                }
            }
        }
        protected void dgEdit_QuizObj(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgQuizObj.EditItemIndex = e.Item.ItemIndex;
            SetupQuizObj();
        }

        protected void dgCancel_QuizObj(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgQuizObj.EditItemIndex = -1;
            SetupQuizObj();
        }

        protected void dgUpdate_QuizObj(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            Label quizid = (Label)e.Item.Cells[0].FindControl("lbl_ID_QuizObj");
            TextBox txtmodifiedQuestion = (TextBox)e.Item.Cells[0].FindControl("txt_QuizObj_Question");
            TextBox txtmodifiedAnsA = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_A");
            TextBox txtmodifiedAnsB = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_B");
            TextBox txtmodifiedAnsC = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_C");
            TextBox txtmodifiedAnsD = (TextBox)e.Item.Cells[0].FindControl("txt_Answer_D");
            TextBox txtmodifiedCorrectAns = (TextBox)e.Item.Cells[0].FindControl("txt_Correct_Ans");
            QuizObjectiveClass quiz_obj = new QuizObjectiveClass();
            if (txtmodifiedQuestion.Text.Trim() == "" || txtmodifiedAnsA.Text.Trim() == "" ||
                txtmodifiedAnsB.Text.Trim() == "" || txtmodifiedAnsC.Text.Trim() == "" ||
                txtmodifiedAnsD.Text.Trim() == "" || txtmodifiedCorrectAns.Text.Trim() == "")
            {
                lblAttention.Text = "Please insert all data and do not leave the fields blank.";
            }
            else if (!answer.Contains(txtmodifiedCorrectAns.Text.Trim().ToUpper()))
            {
                lblAttention.Text = "Answer only allow A B C D";
            }
            else
            {
                int result = quiz_obj.UpdateQuestion(quizid.Text, txtmodifiedQuestion.Text, txtmodifiedAnsA.Text, txtmodifiedAnsB.Text, txtmodifiedAnsC.Text, txtmodifiedAnsD.Text, txtmodifiedCorrectAns.Text.ToUpper(), Session["lect_id"].ToString());
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "quizobj");
                }
                else
                {
                    Server.Transfer("CreateViewQObj.aspx");
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