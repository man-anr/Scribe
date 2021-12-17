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
    public partial class CreateViewQTF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupQuizTF();
            }
        }

        public void SetupQuizTF()
        {

            dgQuizTF.ShowFooter = true;
            QuizTFClass quiz_tf = new QuizTFClass();
            DataSet ds = quiz_tf.GetQuizTFList(int.Parse(Session["workload_id"].ToString()));
            dgQuizTF.DataSource = ds;
            dgQuizTF.DataBind();
        }

        protected void dgQuizTF_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgQuizTF.CurrentPageIndex = e.NewPageIndex;
            SetupQuizTF();
        }

        protected void dgQuizTF_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteQuestion") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteQuestion")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }

        }

        protected void dgQuizTF_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            QuizTFClass quiz_tf = new QuizTFClass();

            if (e.CommandName == "AddQuestion")
            {
                TextBox txtTempQuestion = (TextBox)e.Item.Cells[0].FindControl("txt_QuizTF_Question_New");
                CheckBox cbox = (CheckBox)e.Item.Cells[0].FindControl("checkbox_true_new");
                int Temptrue;
                if (cbox.Checked)
                {
                    Temptrue = 1;
                }
                else
                {
                    Temptrue = 0;
                }
                if (txtTempQuestion.Text.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else
                {
                    int result = quiz_tf.AddQuestion(txtTempQuestion.Text, Temptrue, Session["lect_id"].ToString() ,int.Parse(Session["workload_id"].ToString()));
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "quiztf");
                    }
                    else
                    {
                        Server.Transfer("CreateViewQTF.aspx");
                    }
                }
            }

            else if (e.CommandName == "DeleteQuestion")
            {
                // to do check subject or can rely MSSQL to do the checking
                Label quizid = (Label)e.Item.Cells[0].FindControl("lbl_ID_QuizTF");
                int result = quiz_tf.DeleteQuestion(quizid.Text , int.Parse(Session["workload_id"].ToString()));
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "quiztf");
                }
                else
                {
                    Server.Transfer("CreateViewQTF.aspx");
                }
            }
        }
        protected void dgEdit_QuizTF(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgQuizTF.EditItemIndex = e.Item.ItemIndex;
            SetupQuizTF();
        }

        protected void dgCancel_QuizTF(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgQuizTF.EditItemIndex = -1;
            SetupQuizTF();
        }

        protected void dgUpdate_QuizTF(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            Label quizid = (Label)e.Item.Cells[0].FindControl("lbl_ID_QuizTF");
            TextBox txtmodifiedQuestion = (TextBox)e.Item.Cells[0].FindControl("txt_QuizTF_Question");
            CheckBox cbox = (CheckBox)e.Item.Cells[0].FindControl("checkbox_true");
            int Temptrue;
            if (cbox.Checked)
            {
                Temptrue = 1;
            }
            else
            {
                Temptrue = 0;
            }
            QuizTFClass quiz_tf = new QuizTFClass();
            if (txtmodifiedQuestion.Text.Trim() == "")
            {
                lblAttention.Text = "Please insert all data and do not leave the fields blank.";
            }
            else
            {
                int result = quiz_tf.UpdateQuestion(quizid.Text, txtmodifiedQuestion.Text, Temptrue, Session["lect_id"].ToString());
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "quiztf");
                }
                else
                {
                    Server.Transfer("CreateViewQTF.aspx");
                }
            }
        }

        protected void dgQuizTF_SelectedIndexChanged(object sender, EventArgs e)
        {

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