using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Scribe
{
    public class DatabaseManager
    {
        private string strConn;
        private SqlConnection sqlConn;
        private SqlCommand sqlCmd;

        public SqlConnection OpenConnection()
        {
            try
            {
                //strConn = "Data Source = DESKTOP-C6IAJPU\\SQLEXPRESS; Initial Catalog = Project;  Integrated Security = True; Pooling = False";
                strConn = "Data Source = DESKTOP-4F1CBGS\\SQLEXPRESS; Initial Catalog = Scribe;  Integrated Security = True; Pooling = False";
                sqlConn = new SqlConnection(strConn);
                sqlCmd = new SqlCommand();
                sqlCmd.Connection = sqlConn;
                sqlConn.Open();
                return sqlConn;
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public void CloseConnection()
        {
            try
            {
                sqlConn.Close();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public DataSet GetDataSet(object query, string tablename)
        {
            DataSet ds = new DataSet();

            try
            {
                OpenConnection();
                sqlCmd = (SqlCommand)query;
                sqlCmd.Connection = sqlConn;
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCmd);
                adapter.Fill(ds, tablename);
                CloseConnection();
            }
            catch (Exception exception)
            {
                throw exception;
            }

            return ds;
        }

        public int ExecuteNonQuery(object query)
        {
            try
            {
                OpenConnection();


                sqlCmd = (SqlCommand)query;
                sqlCmd.Connection = sqlConn;
                sqlCmd.ExecuteNonQuery();

                CloseConnection();
                return 0;

            }
            catch (Exception exception)
            {
                return ((SqlException)exception).Number;
            }
        }

        public ArrayList GetArrayList(object query)
        {
            ArrayList drContainer = null;
            int iFieldCount = 0;

            try
            {
                OpenConnection();

                sqlCmd = (SqlCommand)query;
                sqlCmd.Connection = sqlConn;
                SqlDataReader reader = (SqlDataReader)sqlCmd.ExecuteReader();

                drContainer = new ArrayList();
                while (reader.Read())
                {
                    iFieldCount = reader.FieldCount;//get count of the number of columns selected
                    for (int i = 0; i < iFieldCount; i++)
                    {
                        //check is the result return is NULL. If it's NULL and datatype is string, will return "", 
                        //else if datatype is int, will return 0
                        //add the valid data into arraylist 
                        drContainer.Add(reader.IsDBNull(i) ? ResetEmptyObject(reader.GetFieldType(i)) : reader.GetValue(i));
                    }
                }
                if (reader != null) ((IDisposable)reader).Dispose();//Releasing the SqlDataReader object

                CloseConnection();
            }

            catch (Exception exception)
            {
                throw exception;
            }
            return drContainer;
        }

        public ArrayList GetConcatCode(ArrayList alTempResult, string strID, string strValue)
        {
            DictionaryEntry de = new DictionaryEntry();
            ArrayList arResult = new ArrayList();

            if (alTempResult.Count > 0)
            {
                if (strID != "")
                {
                    de.Key = strID;
                    de.Value = strValue;
                    arResult.Add(de);
                }

                for (int i = 0; i < alTempResult.Count; i += 2)
                {
                    de.Key = alTempResult[i];
                    de.Value = alTempResult[i + 1];
                    arResult.Add(de);
                }
            }

            return arResult;
        }

        private object ResetEmptyObject(System.Type readerType)
        {
            if (readerType == typeof(System.String))
                return "";
            else if (readerType == typeof(int))
                return 0;
            else return null;
        }
    }
}