using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public class LecturerSubjectClass

    {
        public DataSet GetLecturerSubjectList(string lect_id)
        {
            DatabaseManager db = new DatabaseManager();
            SqlCommand cmd = new SqlCommand(@"SELECT workloadlecturer.* , subject.subj_name FROM workloadlecturer 
            left join subject on subject.subj_id = workloadlecturer.subj_id
            WHERE lect_id = '" + lect_id + "'");
            DataSet ds = db.GetDataSet(cmd, "LecturerSubject");
            return ds;
        }
    }
}