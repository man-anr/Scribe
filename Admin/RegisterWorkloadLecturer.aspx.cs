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
    public partial class RegisterWorkloadLecturer : System.Web.UI.Page
    {
        string lecturerddl, subjectddl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupWorkloadLecturer();
            }
        }

        public void SetupWorkloadLecturer()
        { 
            dgWorkloadLecturer.ShowFooter = true;

            WorkloadLecturerClass workload = new WorkloadLecturerClass();
            DataSet ds = workload.GetWorkloadLecturerList();
            dgWorkloadLecturer.DataSource = ds;
            dgWorkloadLecturer.DataBind();
        }

        protected void dgWorkloadLecturer_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgWorkloadLecturer.CurrentPageIndex = e.NewPageIndex;
            SetupWorkloadLecturer();
        }

        protected void dgWorkloadLecturer_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnDeleteWorkload") != null)
            {
                ((Button)e.Item.FindControl("btnDeleteWorkload")).Attributes.Add("onClick", "return confirm('Are you sure wish to delete the data?');");
            }

            WorkloadLecturerClass workload = new WorkloadLecturerClass();

            if (e.Item.ItemType == ListItemType.EditItem)
            {
                DropDownList ddledit_LecuturerName = e.Item.FindControl("ddledit_LecturerName") as DropDownList;
                ArrayList arAnswerEyeList = workload.SelecLecturer("", "");
                ddledit_LecuturerName.DataSource = arAnswerEyeList;
                ddledit_LecuturerName.DataTextField = "Value";
                ddledit_LecuturerName.DataValueField = "Key";
                ddledit_LecuturerName.DataBind();

                DropDownList ddledit_SubjectName = e.Item.FindControl("ddledit_SubjectName") as DropDownList;
                ArrayList arAnswerEyeList2 = workload.SelecSubject("", "");
                ddledit_SubjectName.DataSource = arAnswerEyeList2;
                ddledit_SubjectName.DataTextField = "Value";
                ddledit_SubjectName.DataValueField = "Key";
                ddledit_SubjectName.DataBind();
            }

            if (e.Item.ItemType == ListItemType.Footer)
            {
                DropDownList ddlnew_LecturerName = e.Item.FindControl("ddlnew_LecturerName") as DropDownList;
                ArrayList arAnswerEyeList = workload.SelecLecturer("", "");
                ddlnew_LecturerName.DataSource = arAnswerEyeList;
                ddlnew_LecturerName.DataTextField = "Value";
                ddlnew_LecturerName.DataValueField = "Key";
                ddlnew_LecturerName.DataBind();

                DropDownList ddlnew_SubjectName = e.Item.FindControl("ddlnew_SubjectName") as DropDownList;
                ArrayList arAnswerEyeList2 = workload.SelecSubject("", "");
                ddlnew_SubjectName.DataSource = arAnswerEyeList2;
                ddlnew_SubjectName.DataTextField = "Value";
                ddlnew_SubjectName.DataValueField = "Key";
                ddlnew_SubjectName.DataBind();

            }

        }

        protected void dgWorkloadLecturer_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            WorkloadLecturerClass workload = new WorkloadLecturerClass();

            if (e.CommandName == "AddWorkload")
            {
                DropDownList txtTempNameLecturer = (DropDownList)e.Item.Cells[0].FindControl("ddlnew_lecturername");
                DropDownList txtTempNameSubject = (DropDownList)e.Item.Cells[0].FindControl("ddlnew_subjectname");
                if (txtTempNameLecturer.SelectedValue.Trim() == "" || txtTempNameSubject.SelectedValue.Trim() == "")
                {
                    lblAttention.Text = "Please insert all data and do not leave the fields blank.";
                }
                else
                {
                    int result = workload.AddWorkloadLecturer(txtTempNameLecturer.SelectedValue, txtTempNameSubject.SelectedValue);
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "workloadlecturer");
                    }
                    else
                    {
                        Server.Transfer("RegisterWorkloadLecturer.aspx");
                    }
                }
            }
            else if (e.CommandName == "DeleteWorkload")
            {
                Label _id = (Label)e.Item.Cells[0].FindControl("lbl_ID");
                int result = workload.DeleteWorkloadLecturer(_id.Text);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "workloadlecturer");
                }
                else
                {
                    Server.Transfer("RegisterWorkloadLecturer.aspx");
                }
            }
        }
        protected void dgEdit_WorkloadLecturer(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            lecturerddl = ((Label)e.Item.FindControl("lbl_LecturerID")).Text;
            subjectddl = ((Label)e.Item.FindControl("lbl_SubjectID")).Text;
            dgWorkloadLecturer.EditItemIndex = e.Item.ItemIndex;
            SetupWorkloadLecturer();
        }

        protected void SetLecturerDropDownIndex(Object sender, System.EventArgs e)
        {
            DropDownList ed;
            ed = (DropDownList)sender;
            ed.SelectedIndex = ed.Items.IndexOf(ed.Items.FindByValue(lecturerddl));
        }

        protected void SetSubjectDropDownIndex(Object sender, System.EventArgs e)
        {
            DropDownList ed;
            ed = (DropDownList)sender;
            ed.SelectedIndex = ed.Items.IndexOf(ed.Items.FindByValue(subjectddl));
        }

        protected void dgCancel_WorkloadLecturer(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgWorkloadLecturer.EditItemIndex = -1;
            SetupWorkloadLecturer();
        }

        protected void dgUpdate_WorkloadLecturer(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            Label id = (Label)e.Item.Cells[0].FindControl("lbl_ID");
            DropDownList txtTempNameLecturer = (DropDownList)e.Item.Cells[0].FindControl("ddledit_lecturername");
            DropDownList txtTempNameSubject = (DropDownList)e.Item.Cells[0].FindControl("ddledit_subjectname");
            WorkloadLecturerClass workload = new WorkloadLecturerClass();
            if (txtTempNameLecturer.SelectedValue.Trim() == "" || txtTempNameSubject.SelectedValue.Trim() == "")
            {
                lblAttention.Text = "Please choose data from drop down list!";
            }
            else
            {
                int result = workload.UpdateWorkloadLecturer(id.Text, txtTempNameLecturer.SelectedValue, txtTempNameSubject.SelectedValue);
                if (result > 0)
                {
                    lblAttention.Text = ErrorClass.ErrorMessage(result, "workloadlecturer");
                }
                else
                {
                    Server.Transfer("RegisterWorkloadLecturer.aspx");
                }
            }
        }

    }
}