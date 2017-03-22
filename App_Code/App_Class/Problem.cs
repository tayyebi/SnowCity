using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class Problem
{
	public Problem()
	{
	}
    public static void sendproblem(string ProblemType, string ProblemAdress, string ProblemValue)
    {
        string ProblemDate = DateTime.Now.ToLongDateString();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "INSERT INTO [Problem] (ProblemType,ProblemAdress,ProblemDate,ProblemValue) values (@Type,@Adress,@Date,@Value)";
        com.Parameters.AddWithValue("Type", ProblemType);
        com.Parameters.AddWithValue("Adress", ProblemAdress);
        com.Parameters.AddWithValue("Date", ProblemDate);
        com.Parameters.AddWithValue("Value", ProblemValue);
        com.ExecuteNonQuery();
        con.Close();
    }
}