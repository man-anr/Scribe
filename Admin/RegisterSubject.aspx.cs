using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class RegisterSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupSubject();
            }
        }
        public void SetupSubject()
        {
            dgSubject.ShowFooter = true;

            SubjectClass subj = new SubjectClass();
            DataSet ds = subj.GetSubjectList();
            dgSubject.DataSource = ds;
            dgSubject.DataBind();
        }


        protected void dgSubject_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgSubject.CurrentPageIndex = e.NewPageIndex;
            SetupSubject();
        }



        protected void dgSubject_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteSubject") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteSubject")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }


        }

        protected void dgEdit_Subject(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgSubject.EditItemIndex = e.Item.ItemIndex;
            SetupSubject();
        }

        protected void dgCancel_Subject(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgSubject.EditItemIndex = -1;
            SetupSubject();
        }


        protected void dgSubject_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            SubjectClass subj = new SubjectClass();

            if (e.CommandName == "AddSubject")
            {

                TextBox txtTempIdSubject = (TextBox)e.Item.Cells[0].FindControl("txt_Subject_ID_New");
                TextBox txtTempNameSubject = (TextBox)e.Item.Cells[0].FindControl("txt_Subject_Name_New");
                if (txtTempNameSubject.Text.Trim() == "" || txtTempNameSubject.Text.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else
                {
                    int result = subj.AddSubject(txtTempIdSubject.Text, txtTempNameSubject.Text, Session["admin_id"].ToString());
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "subject");
                    }
                    else
                    {
                        Server.Transfer("RegisterSubject.aspx");
                    }
                }
            }

            else if (e.CommandName == "DeleteSubject")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("IDSubject");
                int result = subj.DeleteSubject(_id.Text);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "subject");
                }
                else
                {
                    Server.Transfer("RegisterSubject.aspx");
                }
            }
        }

        protected void dgUpdate_Subject(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            TextBox original_id = (TextBox)e.Item.Cells[0].FindControl("txt_IDSubject");
            TextBox modified_id = (TextBox)e.Item.Cells[0].FindControl("txt_Subject_ID");
            TextBox Subject_name = (TextBox)e.Item.Cells[0].FindControl("txt_Subject_Name");
            SubjectClass subj = new SubjectClass();
            if (Subject_name.Text.Trim() == "" || modified_id.Text.Trim() == "")
            {
                lblAttention.Text = "Please insert full details!";
            }
            else
            {
                int result = subj.UpdateSubject(original_id.Text, modified_id.Text, Subject_name.Text, Session["admin_id"].ToString());
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "subject");
                }
                else
                {
                    Server.Transfer("RegisterSubject.aspx");
                }
            }
        }
    }
}