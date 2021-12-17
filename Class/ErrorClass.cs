using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DatabaseProject
{
    public class ErrorClass
    {
        public static string ErrorMessage(int code, string source)
        {
            if (source == "admin")
            {
                if (code == 547)
                {
                    return "*Unsuccessful! Admin data is being used at other tables.";
                }

                if (code == 2627)
                {
                    return "*Duplicated Admin Id.";
                }
            }

            if (source == "student")
            {
                if (code == 547)
                {
                    return "*Unsuccessful! Student data is being used at other tables.";
                }

                if (code == 2627)
                {
                    return "*Duplicated Student Id.";
                }
            }

            if (source == "lecturer")
            {
                if (code == 547)
                {
                    return "*Unsuccessful! Lecturer data is being used at other tables.";
                }

                if (code == 2627)
                {
                    return "*Duplicated Lecturer Id.";
                }
            }
            if (source == "subject")
            {
                if (code == 547)
                {
                    return "*Unsuccessful! Subject data is being used at other tables.";
                }

                if (code == 2627)
                {
                    return "*Duplicated Subject Id.";
                }
            }

            if (source == "workloadlecturer")
            {
                if (code == 547)
                {
                    return "*Unsuccessful! Workload lecturer data is being used at other tables.";
                }

                if (code == 2627)
                {
                    return "*One lecturer can allocated for a subject once only. ";
                }
            }

            if (source == "atl")
            {
                if (code == 547)
                {
                    return "*There are ATL submitted by students in this section. Unable to delete";
                }
            }
            return "Error occured. Please contact system administrator";
        }
    }
}