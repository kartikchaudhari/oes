﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

using oes.App_Code;

namespace oes.App_Code
{
    public class Database
    {
       
        public SqlConnection DbConnect()
        {
            
            String ConString = ConfigurationManager.ConnectionStrings["ExamDbConString"].ConnectionString; //connection string
            SqlConnection con = new SqlConnection(ConString);
            try
            {
                con.Open();
                return con;
            }
            catch (Exception ex)
            {
                Logger.ErrorLogger(ex);
            } 
            return con;
        }
    }
}