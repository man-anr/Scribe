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
    public partial class RegisterStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupStudent();
            }

        }
        public void SetupStudent()
        {
            dgStudent.ShowFooter = true;

            StudentClass std = new StudentClass();
            DataSet ds = std.GetStudentList();
            dgStudent.DataSource = ds;
            dgStudent.DataBind();
        }


        protected void dgStudent_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgStudent.CurrentPageIndex = e.NewPageIndex;
            SetupStudent();
        }



        protected void dgStudent_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteStudent") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteStudent")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }


        }

        protected void dgEdit_Student(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgStudent.EditItemIndex = e.Item.ItemIndex;
            SetupStudent();
        }

        protected void dgCancel_Student(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgStudent.EditItemIndex = -1;
            SetupStudent();
        }


        protected void dgStudent_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            StudentClass std = new StudentClass();

            if (e.CommandName == "AddStudent")
            {

                TextBox txtTempIdStudent = (TextBox)e.Item.Cells[0].FindControl("txt_Student_ID_New");
                TextBox txtTempNameStudent = (TextBox)e.Item.Cells[0].FindControl("txt_Student_Name_New");
                if (txtTempNameStudent.Text.Trim() == "" || txtTempNameStudent.Text.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else
                {
                    int result = std.AddStudent(txtTempIdStudent.Text, txtTempNameStudent.Text, Session["admin_id"].ToString());
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                    }
                    else
                    {
                        Server.Transfer("RegisterStudent.aspx");
                    }
                }
            }

            else if (e.CommandName == "DeleteStudent")
            {
                // to do check subject or can rely MSSQL to do the checking
                Label _id = (Label)e.Item.Cells[0].FindControl("IDStudent");
                int result = std.DeleteStudent(_id.Text);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("RegisterStudent.aspx");
                }
            }
        }

        protected void dgUpdate_Student(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            TextBox original_id = (TextBox)e.Item.Cells[0].FindControl("txt_IDStudent");
            TextBox modified_id = (TextBox)e.Item.Cells[0].FindControl("txt_Student_ID");
            TextBox student_name = (TextBox)e.Item.Cells[0].FindControl("txt_Student_Name");
            StudentClass std = new StudentClass();
            if (student_name.Text.Trim() == "" || modified_id.Text.Trim() == "")
            {
                lblAttention.Text = "Please insert full details!";
            }
            else
            {
                int result = std.UpdateStudent(original_id.Text, modified_id.Text, student_name.Text, Session["admin_id"].ToString());
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "student");
                }
                else
                {
                    Server.Transfer("RegisterStudent.aspx");
                }
            }
        }
    }
}