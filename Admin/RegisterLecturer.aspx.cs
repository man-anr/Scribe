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
    public partial class RegisterLecturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupLecturer();
            }

        }
        public void SetupLecturer()
        {
            dgLecturer.ShowFooter = true;

            LecturerClass lecturer = new LecturerClass();
            DataSet ds = lecturer.GetLecturerList();
            dgLecturer.DataSource = ds;
            dgLecturer.DataBind();
        }


        protected void dgLecturer_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgLecturer.CurrentPageIndex = e.NewPageIndex;
            SetupLecturer();
        }



        protected void dgLecturer_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteLecturer") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteLecturer")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }


        }

        protected void dgEdit_Lecturer(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgLecturer.EditItemIndex = e.Item.ItemIndex;
            SetupLecturer();
        }

        protected void dgCancel_Lecturer(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgLecturer.EditItemIndex = -1;
            SetupLecturer();
        }


        protected void dgLecturer_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            LecturerClass lecturer = new LecturerClass();

            if (e.CommandName == "AddLecturer")
            {

                TextBox txtTempIdLecturer = (TextBox)e.Item.Cells[0].FindControl("txt_Lecturer_ID_New");
                TextBox txtTempNameLecturer = (TextBox)e.Item.Cells[0].FindControl("txt_Lecturer_Name_New");
                if (txtTempNameLecturer.Text.Trim() == "" || txtTempNameLecturer.Text.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else
                {
                    int result = lecturer.AddLecturer(txtTempIdLecturer.Text, txtTempNameLecturer.Text, Session["admin_id"].ToString());
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "lecturer");
                    }
                    else
                    {
                        Server.Transfer("RegisterLecturer.aspx");
                    }
                }
            }

            else if (e.CommandName == "DeleteLecturer")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("IDLecturer");
                int result = lecturer.DeleteLecturer(_id.Text);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "lecturer");
                }
                else
                {
                    Server.Transfer("RegisterLecturer.aspx");
                }
            }
        }

        protected void dgUpdate_Lecturer(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            TextBox original_id = (TextBox)e.Item.Cells[0].FindControl("txt_IDLecturer");
            TextBox modified_id = (TextBox)e.Item.Cells[0].FindControl("txt_Lecturer_ID");
            TextBox lecturer_name = (TextBox)e.Item.Cells[0].FindControl("txt_Lecturer_Name");
            LecturerClass lecturer = new LecturerClass();
            if (lecturer_name.Text.Trim() == "" || modified_id.Text.Trim() == "")
            {
                lblAttention.Text = "Please insert full details!";
            }
            else
            {
                
                int result = lecturer.UpdateLecturer(original_id.Text, modified_id.Text, lecturer_name.Text, Session["admin_id"].ToString());
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "lecturer");
                }
                else
                {
                    Server.Transfer("RegisterLecturer.aspx");
                }
            }
        }
    }
}