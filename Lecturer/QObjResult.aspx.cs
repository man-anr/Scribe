using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Scribe
{
    public partial class QObjResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupQObjResult();
                PassandFail();
            }
        }

        public void SetupQObjResult()
        {

            dgQObjResult.ShowFooter = true;
            QuizObjectiveClass quiz_obj = new QuizObjectiveClass();
            DataSet ds = quiz_obj.GetQObjResult(int.Parse(Session["workload_id"].ToString()));
            dgQObjResult.DataSource = ds;
            dgQObjResult.DataBind();
        }

        public void PassandFail()
        {
            int pass = 0;
            int fail = 0;
            QuizObjectiveClass quiz_obj = new QuizObjectiveClass();
            DataSet ds = quiz_obj.GetQObjResult(int.Parse(Session["workload_id"].ToString()));
            int mark = quiz_obj.GetAverageMark(int.Parse(Session["workload_id"].ToString()));

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                //to handle null value
                if (row["quiz_obj_mark"].ToString() != "")
                {
                    if (int.Parse(row["quiz_obj_mark"].ToString()) >= mark)
                    {
                        pass++;
                    }
                    else
                    {
                        fail++;
                    }
                }
            }
            lblAttention.Text = "Number of students pass: " + pass + ". Number of students fail: " + fail;
        }
        protected void ListSubjectButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerSubject.aspx");
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }

        protected void dgQObjResult_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgQObjResult.CurrentPageIndex = e.NewPageIndex;
            SetupQObjResult();
        }
    }
}