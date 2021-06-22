using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using static Vitals.Models.Funerals;

namespace Vitals.Models
{
    public class FuneralDAL
    {
        public static DataSet GetFuneral()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("GetFuneral", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "Funeral");
            return ds;
        }
        public static Funeral GetFuneral(int F_RegCustomerCnt)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetFuneral", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@F_RegCustomerCnt", F_RegCustomerCnt);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Funeral F = new Funeral();
                    F.F_RegCustomerCnt =int.Parse(dr["F_Reg_Customer_Cntdr"].ToString());
                    F.F_RegShortName = dr["F_Reg_Short_Name"].ToString();
                    F.F_RegFuneralHome = dr["F_RegFuneralHome"].ToString();
                    F.F_RegHouseNo = dr["F_Reg_House_No"].ToString();
                    F.F_RegStName = dr["F_Reg_St_Name"].ToString();
                    F.F_RegUnit = dr["F_Reg_Unit"].ToString();
                    F.F_RegProv = dr["F_Reg_Prov"].ToString();
                    F.F_RegCity = dr["F_Reg_City"].ToString();
                    F.F_RegCountry = dr["F_Reg_Country"].ToString();
                    F.F_RegPC = dr["F_Reg_PC"].ToString();
                    F.F_RegCustomerNo = dr["F_Reg_Customer_No"].ToString();
                    return F;
                }
                else
                    return null;
            }
            catch (Exception ex)
            {
                return null;

            }
            finally
            {
                con.Close();
            }
        }

        //public static Funeral SearcFuneralHome(string Search_String)
        //{
        //    SqlConnection con = new SqlConnection(Database.ConnectionString);
        //    try
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("SearcFuneralHome", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@Searchstr", Search_String);
        //        SqlDataReader dr = cmd.ExecuteReader();
        //        if (dr.Read())
        //        {
        //            Funeral F = new Funeral();

        //            F.F_RegShortName = dr["F_Reg_Short_Name"].ToString();
        //            F.F_RegFuneralHome = dr["F_RegFuneralHome"].ToString();
        //            F.F_RegHouseNo = dr["F_Reg_House_No"].ToString();
        //            F.F_RegStName = dr["F_Reg_St_Name"].ToString();
        //            F.F_RegUnit = dr["F_Reg_Unit"].ToString();
        //            F.F_RegProv = dr["F_Reg_Prov"].ToString();
        //            F.F_RegCity = dr["F_Reg_City"].ToString();
        //            F.F_RegCountry = dr["F_Reg_Country"].ToString();
        //            F.F_RegPC = dr["F_Reg_PC"].ToString();
        //            F.F_RegCustomerNo = dr["F_Reg_Customer_No"].ToString();
        //            return F;
        //        }
        //        else
        //            return null;
        //    }
        //    catch (Exception ex)
        //    {
        //        return null;

        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}
        public static string AddFuneral(string F_RegShortName, string F_RegFuneralHome, string F_RegHouseNo, 
           string F_RegStName, string F_RegUnit, string F_RegProv, string F_RegCity, string F_RegCountry, string F_RegPC, string F_RegCustomerNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Funeral_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@F_RegShortName", F_RegShortName);
                cmd.Parameters.AddWithValue("@F_RegFuneralHome", F_RegFuneralHome);
                cmd.Parameters.AddWithValue("@F_RegHouseNo", F_RegHouseNo);
                cmd.Parameters.AddWithValue("@F_RegStName", F_RegStName);
                cmd.Parameters.AddWithValue("@F_RegUnit", F_RegUnit);
                cmd.Parameters.AddWithValue("@F_RegProv", F_RegProv);
                cmd.Parameters.AddWithValue("@F_RegCity", F_RegCity);
                cmd.Parameters.AddWithValue("@F_RegCountry", F_RegCountry);
                cmd.Parameters.AddWithValue("@F_RegPC", F_RegPC);
                cmd.Parameters.AddWithValue("@F_RegCustomerNo", F_RegCustomerNo);
                cmd.ExecuteNonQuery();
                return null; // success   
            }
            catch (Exception ex)
            {
                return ex.Message; // return error message  
            }
            finally
            {
                con.Close();
            }
        }
        public static string DeleteFuneral(int F_RegCustomerCnt)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteFuneral", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@F_RegCustomerCnt", F_RegCustomerCnt);
                cmd.ExecuteNonQuery();
                return null; // success   
            }
            catch (Exception ex)
            {
                return ex.Message; // return error message  
            }
            finally
            {
                con.Close();
            }
        }
        public static string UpdateFuneral(int F_RegCustomerCnt, string F_RegShortName, string F_RegFuneralHome, string F_RegHouseNo, 
           string F_RegStName, string F_RegUnit, string F_RegProv, string F_RegCity, string F_RegCountry, string F_RegPC, string F_RegCustomerNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Funeral_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@F_RegCustomerCnt", F_RegCustomerCnt);
                cmd.Parameters.AddWithValue("@F_RegShortName", F_RegShortName);
                cmd.Parameters.AddWithValue("@F_RegFuneralHome", F_RegFuneralHome);
                cmd.Parameters.AddWithValue("@F_RegHouseNo", F_RegHouseNo);
                cmd.Parameters.AddWithValue("@F_RegStName", F_RegStName);
                cmd.Parameters.AddWithValue("@F_RegUnit", F_RegUnit);
                cmd.Parameters.AddWithValue("@F_RegProv", F_RegProv);
                cmd.Parameters.AddWithValue("@F_RegCity", F_RegCity);
                cmd.Parameters.AddWithValue("@F_RegCountry", F_RegCountry);
                cmd.Parameters.AddWithValue("@F_RegPC", F_RegPC);
                cmd.Parameters.AddWithValue("@F_RegCustomerNo", F_RegCustomerNo);
                cmd.ExecuteNonQuery();
                return null; // success   
            }
            catch (Exception ex)
            {
                return ex.Message; // return error message  
            }
            finally
            {
                con.Close();
            }
        }
    }
}