using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NimapInfotechMachineTest.SqlDbConnection
{
    public class Connection
    {
        SqlCommand sqlCmd;
        SqlDataAdapter da;
        SqlConnection sqlConn = null;
        public static string connectionString = @"Data Source=MSI; Initial Catalog=DbNimapInfotechKavita ; User Id=sa;Password=Game@123";

        public SqlConnection Connect()
        {
            try
            {

                sqlConn = new SqlConnection(connectionString);
                sqlConn.Close();
                if (sqlConn.State == ConnectionState.Open)
                    sqlConn.Close();
                sqlConn.Open();
            }
            catch (Exception ex)
            {

            }

            return sqlConn;
        }
        public DataTable FillCombo(string query)
        {
            DataTable dt = new DataTable();

            sqlConn = Connect();
            sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;
            da = new SqlDataAdapter(query, sqlConn);
            da.Fill(dt);


            return dt;
        }
    }
}