using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class RegisterAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupAdmin();
            }

        }
        public void SetupAdmin()
        {
            dgAdmin.ShowFooter = true;

            AdminClass admin = new AdminClass();
            DataSet ds = admin.GetAdminList();
            dgAdmin.DataSource = ds;
            dgAdmin.DataBind();
        }

        protected void dgAdmin_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgAdmin.CurrentPageIndex = e.NewPageIndex;
            SetupAdmin();
        }

        protected void dgAdmin_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteAdmin") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteAdmin")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }


        }

        protected void dgEdit_Admin(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgAdmin.EditItemIndex = e.Item.ItemIndex;
            SetupAdmin();
        }

        protected void dgCancel_Admin(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgAdmin.EditItemIndex = -1;
            SetupAdmin();
        }


        protected void dgAdmin_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            AdminClass admin = new AdminClass();

            if (e.CommandName == "AddAdmin")
            {
                TextBox txtTempIdAdmin = (TextBox)e.Item.Cells[0].FindControl("txt_Admin_ID_New");
                TextBox txtTempNameAdmin = (TextBox)e.Item.Cells[0].FindControl("txt_Admin_Name_New");
                if (txtTempNameAdmin.Text.Trim() == "" || txtTempNameAdmin.Text.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else
                {
                    int result = admin.AddAdmin(txtTempIdAdmin.Text, txtTempNameAdmin.Text);
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "admin");
                    }
                    else
                    {
                        Server.Transfer("RegisterAdmin.aspx");
                    }
                }
            }

            else if (e.CommandName == "DeleteAdmin")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("IDAdmin");
                if (_id.Text == Session["admin_id"].ToString())
                {
                    lblAttention.Text = "Unable to delete current logged in admin.";
                }
                else
                {
                    int result = admin.DeleteAdmin(_id.Text);
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result , "admin");
                    }
                    else
                    {
                        Server.Transfer("RegisterAdmin.aspx");
                    }
                }
            }
        }

        protected void dgUpdate_Admin(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            TextBox original_id = (TextBox)e.Item.Cells[0].FindControl("txt_IDAdmin");
            TextBox modified_id = (TextBox)e.Item.Cells[0].FindControl("txt_Admin_ID");
            TextBox admin_name = (TextBox)e.Item.Cells[0].FindControl("txt_Admin_Name");
            AdminClass admin = new AdminClass();

            if (admin_name.Text.Trim() == "" || modified_id.Text.Trim() == "")
            {
                lblAttention.Text = "Please insert full details!";
            }
            else
            {
                int result = admin.UpdateAdmin(original_id.Text, modified_id.Text, admin_name.Text);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "admin");
                }
                else
                {
                    Server.Transfer("RegisterAdmin.aspx");
                }
            }
        }
    }
}