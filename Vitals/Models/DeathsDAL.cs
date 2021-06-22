using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using static Vitals.Models.Deaths;
namespace Vitals.Models
{
    public class DeathsDAL
    {
        public static DataSet GetDeaths()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("GetDeaths", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "Deaths");
            return ds;
        }
        public static Death GetDeath(int D_RegYear, string D_Regtype, int D_RegNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetDeaths", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_Reg_Year", D_RegYear);
                cmd.Parameters.AddWithValue("@D_Reg_type", D_Regtype);
                cmd.Parameters.AddWithValue("@D_Reg_No", D_RegNo);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Death D = new Death();
                    D.D_RegYear = int.Parse(dr["D_Reg_Year"].ToString());
                    D.D_Regtype = dr["D_Reg_type"].ToString();
                    D.D_RegNo = int.Parse(dr["D_RegNo"].ToString());
                    D.D_RegBillable = dr["D_Reg_Billable"].ToString();
                    D.D_RegFirsName = dr["D_Reg_First_Name"].ToString();
                    D.D_RegLastName = dr["D_Reg_Last_Name"].ToString();
                    D.D_RegMiddlename = dr["D_Reg_Middle_name"].ToString();
                    D.D_RegHouseNo_D = dr["D_Reg_House_No_D"].ToString();
                    D.D_RegStName_D = dr["D_Reg_St_Name_D"].ToString();
                    D.D_RegUnit_D = dr["D_Reg_Unit_D"].ToString();
                    D.D_RegCity_D = dr["D_Reg_City_D"].ToString();
                    D.D_RegProv_D = dr["D_Reg_Prov_D"].ToString();
                    D.D_RegCountry_D = dr["D_Reg_Country_D"].ToString();
                    D.D_RegPC_D = dr["D_Reg_PC_D"].ToString();
                    D.D_Municipality = dr["D_Municipality"].ToString();
                    D.D_RegSex = dr["D_Reg_Sex"].ToString();
                    D.D_RegDied = Convert.ToDateTime(dr["D_Reg_Died"]);
                    D.D_RegDate = Convert.ToDateTime(dr["D_Reg_Date"]);
                    D.D_RegPlaceOfDeath = dr["D_Reg_Place_Of_Death"].ToString();
                    D.D_RegHouse_No = dr["D_Reg_House_No"].ToString();
                    D.D_RegStName = dr["D_Reg_St_Name"].ToString();
                    D.D_RegUnit = dr["D_Reg_Unit"].ToString();
                    D.D_RegCity = dr["D_Reg_City"].ToString();
                    D.D_RegProv = dr["D_Reg_Prov"].ToString();
                    D.D_RegCountry = dr["D_Reg_Country"].ToString();
                    D.D_RegPC = dr["D_Reg_PC"].ToString();
                    D.D_RegDrCode = int.Parse(dr["D_Reg_Dr_Code"].ToString());
                    D.D_RegFuneralCode = int.Parse(dr["D_Reg_Funeral_Code"].ToString());
                    D.D_Printed = dr["D_Printed"].ToString();
                    return D;
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

        public static string AddDeath(int D_RegYear, string D_Regtype, int D_RegNo, string D_RegBillable, string D_RegFirsName,string D_RegLastName, 
         string D_RegMiddlename,string D_RegHouseNo_D, string D_RegStName_D,string D_RegUnit_D,string D_RegCity_D,
         string D_RegProv_D,string D_RegCountry_D,string D_RegPC_D ,string D_Municipality,string D_RegSex,DateTime D_RegDied,
         DateTime D_RegDate ,string D_RegPlaceOfDeath ,string D_RegHouse_No,string D_RegStName,string D_RegUnit,
         string D_RegCity,string D_RegProv,string D_RegCountry,string D_RegPC,Int64 D_RegDrCode, Int64 D_RegFuneralCode, string D_Printed )
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Death_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_Reg_Year", D_RegYear);
                cmd.Parameters.AddWithValue("@D_Reg_type", D_Regtype);
                cmd.Parameters.AddWithValue("@D_Reg_No", D_RegNo);
                cmd.Parameters.AddWithValue("@D_Reg_Billable", D_RegBillable);
                cmd.Parameters.AddWithValue("@D_Reg_FirsName", D_RegFirsName);
                cmd.Parameters.AddWithValue("@D_Reg_LastName", D_RegLastName);
                cmd.Parameters.AddWithValue("@D_Reg_Middlename", D_RegMiddlename);
                cmd.Parameters.AddWithValue("@D_Reg_HouseNo_D", D_RegHouseNo_D);
                cmd.Parameters.AddWithValue("@D_Reg_StName_D", D_RegStName_D);
                cmd.Parameters.AddWithValue("@D_Reg_Unit_D", D_RegUnit_D);
                cmd.Parameters.AddWithValue("@D_Reg_City_D", D_RegCity_D);
                cmd.Parameters.AddWithValue("@D_Reg_Prov_D", D_RegProv_D);
                cmd.Parameters.AddWithValue("@D_Reg_Country_D", D_RegCountry_D);
                cmd.Parameters.AddWithValue("@D_Reg_PC_D", D_RegPC_D);
                cmd.Parameters.AddWithValue("@D_Municipality", D_Municipality);
                cmd.Parameters.AddWithValue("@D_Reg_Sex", D_RegSex);
                cmd.Parameters.AddWithValue("@D_Reg_Died", D_RegDied);
                cmd.Parameters.AddWithValue("@D_Reg_Date", D_RegDate);
                cmd.Parameters.AddWithValue("@D_Reg_PlaceOfDeath", D_RegPlaceOfDeath);
                cmd.Parameters.AddWithValue("@D_Reg_House_No", D_RegHouse_No);
                cmd.Parameters.AddWithValue("@D_Reg_StName", D_RegStName);
                cmd.Parameters.AddWithValue("@D_Reg_Unit", D_RegUnit);
                cmd.Parameters.AddWithValue("@D_Reg_City", D_RegCity);
                cmd.Parameters.AddWithValue("@D_Reg_Prov", D_RegProv);
                cmd.Parameters.AddWithValue("@D_Reg_Country", D_RegCountry);
                cmd.Parameters.AddWithValue("@D_Reg_PC", D_RegPC);
                cmd.Parameters.AddWithValue("@D_Reg_DrCode", D_RegDrCode);
                cmd.Parameters.AddWithValue("@D_Reg_FuneralCode", D_RegFuneralCode);
                cmd.Parameters.AddWithValue("@D_Printed", D_Printed);

                cmd.ExecuteNonQuery();
                return null; // success   
            }
            catch (SqlException ex)
            {
                return ex.Message; // return error message  
            }
            finally
            {
                con.Close();
            }
        }

        public static string UpdateDeath(int D_RegYear, string D_Regtype, int D_RegNo, string D_RegBillable, string D_RegFirsName, string D_RegLastName,
         string D_RegMiddlename, string D_RegHouseNo_D, string D_RegStName_D, string D_RegUnit_D, string D_RegCity_D,
         string D_RegProv_D, string D_RegCountry_D, string D_RegPC_D, string D_Municipality, string D_RegSex, DateTime D_RegDied,
         DateTime D_RegDate, string D_RegPlaceOfDeath, string D_RegHouse_No, string D_RegStName, string D_RegUnit,
         string D_RegCity, string D_RegProv, string D_RegCountry, string D_RegPC, Int64 D_RegDrCode, Int64 D_RegFuneralCode, string D_Printed)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Death_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_Reg_Year", D_RegYear);
                cmd.Parameters.AddWithValue("@D_Reg_type", D_Regtype);
                cmd.Parameters.AddWithValue("@D_Reg_No", D_RegNo);
                cmd.Parameters.AddWithValue("@D_Reg_Billable", D_RegBillable);
                cmd.Parameters.AddWithValue("@D_Reg_FirsName", D_RegFirsName);
                cmd.Parameters.AddWithValue("@D_Reg_LastName", D_RegLastName);
                cmd.Parameters.AddWithValue("@D_Reg_Middlename", D_RegMiddlename);
                cmd.Parameters.AddWithValue("@D_Reg_HouseNo_D", D_RegHouseNo_D);
                cmd.Parameters.AddWithValue("@D_Reg_StName_D", D_RegStName_D);
                cmd.Parameters.AddWithValue("@D_Reg_Unit_D", D_RegUnit_D);
                cmd.Parameters.AddWithValue("@D_Reg_City_D", D_RegCity_D);
                cmd.Parameters.AddWithValue("@D_Reg_Prov_D", D_RegProv_D);
                cmd.Parameters.AddWithValue("@D_Reg_Country_D", D_RegCountry_D);
                cmd.Parameters.AddWithValue("@D_Reg_PC_D", D_RegPC_D);
                cmd.Parameters.AddWithValue("@D_Municipality", D_Municipality);
                cmd.Parameters.AddWithValue("@D_Reg_Sex", D_RegSex);
                cmd.Parameters.AddWithValue("@D_Reg_Died", D_RegDied);
                cmd.Parameters.AddWithValue("@D_Reg_Date", D_RegDate);
                cmd.Parameters.AddWithValue("@D_Reg_PlaceOfDeath", D_RegPlaceOfDeath);
                cmd.Parameters.AddWithValue("@D_Reg_House_No", D_RegHouse_No);
                cmd.Parameters.AddWithValue("@D_Reg_StName", D_RegStName);
                cmd.Parameters.AddWithValue("@D_Reg_Unit", D_RegUnit);
                cmd.Parameters.AddWithValue("@D_Reg_City", D_RegCity);
                cmd.Parameters.AddWithValue("@D_Reg_Prov", D_RegProv);
                cmd.Parameters.AddWithValue("@D_Reg_Country", D_RegCountry);
                cmd.Parameters.AddWithValue("@D_Reg_PC", D_RegPC);
                cmd.Parameters.AddWithValue("@D_Reg_DrCode", D_RegDrCode);
                cmd.Parameters.AddWithValue("@D_Reg_FuneralCode", D_RegFuneralCode);
                cmd.Parameters.AddWithValue("@D_Printed", D_Printed);
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
        public static string DeleteDeath(int D_RegYear, string D_Regtype, int D_RegNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteDeath", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_Reg_Year", D_RegYear);
                cmd.Parameters.AddWithValue("@D_Reg_type", D_Regtype);
                cmd.Parameters.AddWithValue("@D_Reg_No", D_RegNo);
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