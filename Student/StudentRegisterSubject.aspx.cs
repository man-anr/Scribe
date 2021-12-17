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
    public partial class StudentRegisterSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupStudRegisterSubject();
            }
        }
        public void SetupStudRegisterSubject()
        {
            dgStudRegisterSubject.ShowFooter = true;

            WorkloadLecturerClass workload = new WorkloadLecturerClass();
            DataSet ds = workload.GetWorkloadLecturerList();
            dgStudRegisterSubject.DataSource = ds;
            dgStudRegisterSubject.DataBind();
        }


        protected void dgStudRegisterSubject_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgStudRegisterSubject.CurrentPageIndex = e.NewPageIndex;
            SetupStudRegisterSubject();
        }



        protected void dgStudRegisterSubject_ItemDataBound(object source, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {

            if (e.Item.FindControl("btnRegisterSubject") != null)
            {
                ((Button)e.Item.FindControl("btnRegisterSubject")).Attributes.Add("onClick", "return confirm('Are you sure to register this subject?');");
            }


        }

        protected void dgStudRegisterSubject_ItemCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            StudentSubjectClass stud_subj = new StudentSubjectClass();

            if (e.CommandName == "RegisterSubject")
            {
                Label subj_id = (Label)e.Item.Cells[0].FindControl("lbl_SubjID");
                Label workload_id = (Label)e.Item.Cells[0].FindControl("lbl_WorkloadID");
                bool check = stud_subj.CheckSubjRegistered(subj_id.Text, Session["stud_id"].ToString());
                if (check == true)
                {
                    lblAttention.Text = "This subject is already registered.";
                }
                else
                {
                    int result = stud_subj.RegisterSubject(workload_id.Text, Session["stud_id"].ToString());
                    if (result > 0)
                    {
                        lblAttention.Text = ErrorClass.ErrorMessage(result, "subject");
                    }
                    else
                    {
                        lblAttention.Text = "*Successful";
                    }
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