using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Scribe
{
    public partial class QTFResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupQTFResult();
                PassandFail();
            }
        }

        public void SetupQTFResult()
        {

            dgQTFResult.ShowFooter = true;
            QuizTFClass quiz_tf = new QuizTFClass();
            DataSet ds = quiz_tf.GetQTFResult(int.Parse(Session["workload_id"].ToString()));
            dgQTFResult.DataSource = ds;
            dgQTFResult.DataBind();
        }

        public void PassandFail()
        {
            int pass = 0; 
            int fail = 0;
            QuizTFClass quiz_tf = new QuizTFClass();
            DataSet ds = quiz_tf.GetQTFResult(int.Parse(Session["workload_id"].ToString()));
            int mark = quiz_tf.GetAverageMark(int.Parse(Session["workload_id"].ToString()));

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if(row["quiz_tf_mark"].ToString()!= "")
                {
                    if (int.Parse(row["quiz_tf_mark"].ToString()) >= mark)
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

        protected void dgQTFResult_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgQTFResult.CurrentPageIndex = e.NewPageIndex;
            SetupQTFResult();
        }

    }
}