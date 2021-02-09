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
                    D.D_RegFirsName = dr["D_Reg_FirsName"].ToString();
                    D.D_RegLastName = dr["D_Reg_LastName"].ToString();
                    D.D_RegMiddlename = dr["D_Reg_Middlename"].ToString();
                    D.D_RegHouseNo_D = dr["D_Reg_HouseNo_D"].ToString();
                    D.D_RegHouseQualNo_D = dr["D_Reg_HouseQualNo_D"].ToString();
                    D.D_RegStName_D = dr["D_Reg_StName_D"].ToString();
                    D.D_RegUnit_D = dr["D_Reg_Unit_D"].ToString();
                    D.D_RegCity_D = dr["D_Reg_City_D"].ToString();
                    D.D_RegProv_D = dr["D_Reg_Prov_D"].ToString();
                    D.D_RegCountry_D = dr["D_Reg_Country_D"].ToString();
                    D.D_RegPC_D = dr["D_Reg_PC_D"].ToString();
                    D.D_Municipality = dr["D_Municipality"].ToString();
                    D.D_RegSex = dr["D_RegSex"].ToString();
                    D.D_RegDied = Convert.ToDateTime(dr["D_RegDied"]);
                    D.D_RegDate = Convert.ToDateTime(dr["D_RegDate"]);
                    D.D_RegPlaceOfDeath = dr["D_RegPlaceOfDeath"].ToString();
                    D.D_RegHouse_No = dr["D_RegHouse_No"].ToString();
                    D.D_RegHouseQual_No = dr["D_RegHouseQual_No"].ToString();
                    D.D_RegStName = dr["D_RegStName"].ToString();
                    D.D_RegUnit = dr["D_RegUnit"].ToString();
                    D.D_RegCity = dr["D_RegCity"].ToString();
                    D.D_RegProv = dr["D_RegProv"].ToString();
                    D.D_RegCountry = dr["D_RegCountry"].ToString();
                    D.D_RegPC = dr["D_RegPC"].ToString();
                    //D.D_RegFirstName_I = dr["D_RegFirstName_I"].ToString();
                    //D.D_RegLastName_I = dr["D_RegLastName_I"].ToString();
                    //D.D_RegMiddlename_I = dr["D_RegMiddlename_I"].ToString();
                    //D.D_RegHouseNo_I = dr["D_RegHouseNo_I"].ToString();
                    //D.D_RegHouseQualNo_I = dr["D_RegHouseQualNo_I"].ToString();
                    //D.D_RegStName_I = dr["D_RegStName_I"].ToString();
                    //D.D_RegUnit_I = dr["D_RegUnit_I"].ToString();
                    //D.D_RegCity_I = dr["D_RegCity_I"].ToString();
                    //D.D_RegProv_I = dr["D_RegProv_I"].ToString();
                    //D.D_RegCountry_I = dr["D_RegCountry_I"].ToString();
                    //D.D_RegPC_I = dr["D_RegPC_I"].ToString();
                    D.D_RegCauseo_Death1 = dr["D_RegCauseo_Death1"].ToString();
                    D.D_RegCauseof_eath2 = dr["D_RegCauseof_eath2"].ToString();
                    D.D_RegDrCode = int.Parse(dr["D_RegDrCode"].ToString());
                    D.D_RegFuneralCode = int.Parse(dr["D_RegFuneralCode"].ToString());
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
         string D_RegMiddlename,string D_RegHouseNo_D,string D_RegHouseQualNo_D, string D_RegStName_D,string D_RegUnit_D,string D_RegCity_D,
         string D_RegProv_D,string D_RegCountry_D,string D_RegPC_D ,string D_Municipality,string D_RegSex,DateTime D_RegDied,
         DateTime D_RegDate ,string D_RegPlaceOfDeath ,string D_RegHouse_No,string D_RegHouseQual_No,string D_RegStName,string D_RegUnit,
         string D_RegCity,string D_RegProv,string D_RegCountry,string D_RegPC,string D_RegFirstName_I , string D_RegLastName_I,
         string D_RegMiddlename_I,string D_RegHouseNo_I,string D_RegHouseQualNo_I,string D_RegStName_I,string D_RegUnit_I,
         string D_RegCity_I,string D_RegProv_I , string D_RegCountry_I ,string D_RegPC_I ,string D_RegCauseo_Death1,
         string D_RegCauseof_eath2,Int64 D_RegDrCode, Int64 D_RegFuneralCode, string D_Printed )
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
                cmd.Parameters.AddWithValue("@D_Reg_HouseQualNo_D",D_RegHouseQualNo_D );
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
                cmd.Parameters.AddWithValue("@D_Reg_HouseQual_No", D_RegHouseQual_No);
                cmd.Parameters.AddWithValue("@D_Reg_StName", D_RegStName);
                cmd.Parameters.AddWithValue("@D_Reg_Unit", D_RegUnit);
                cmd.Parameters.AddWithValue("@D_Reg_City", D_RegCity);
                cmd.Parameters.AddWithValue("@D_Reg_Prov", D_RegProv);
                cmd.Parameters.AddWithValue("@D_Reg_Country", D_RegCountry);
                cmd.Parameters.AddWithValue("@D_Reg_PC", D_RegPC);
                cmd.Parameters.AddWithValue("@D_Reg_FirstName_I", D_RegFirstName_I);
                cmd.Parameters.AddWithValue("@D_Reg_FirstName_I", D_RegFirstName_I);
                cmd.Parameters.AddWithValue("@D_Reg_Middlename_I", D_RegMiddlename_I);
                cmd.Parameters.AddWithValue("@D_Reg_HouseNo_I", D_RegHouseNo_I);
                cmd.Parameters.AddWithValue("@D_Reg_Middlename_I", D_RegMiddlename_I);
                cmd.Parameters.AddWithValue("@D_Reg_HouseNo_I", D_RegHouseNo_I);
                cmd.Parameters.AddWithValue("@D_Reg_HouseQualNo_I", D_RegHouseQualNo_I);
                cmd.Parameters.AddWithValue("@D_Reg_StName_I", D_RegStName_I);
                cmd.Parameters.AddWithValue("@D_Reg_Unit_I", D_RegUnit_I);
                cmd.Parameters.AddWithValue("@D_Reg_City_I", D_RegCity_I);
                cmd.Parameters.AddWithValue("@D_Reg_Prov_I", D_RegProv_I);
                cmd.Parameters.AddWithValue("@D_Reg_Country_I", D_RegCountry_I);
                cmd.Parameters.AddWithValue("@D_Reg_PC_I", D_RegPC_I);
                cmd.Parameters.AddWithValue("@D_Reg_Causeo_Death1", D_RegCauseo_Death1);
                cmd.Parameters.AddWithValue("@D_Reg_Causeof_eath2", D_RegCauseof_eath2);
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
         string D_RegMiddlename, string D_RegHouseNo_D, string D_RegHouseQualNo_D, string D_RegStName_D, string D_RegUnit_D, string D_RegCity_D,
         string D_RegProv_D, string D_RegCountry_D, string D_RegPC_D, string D_Municipality, string D_RegSex, DateTime D_RegDied,
         DateTime D_RegDate, string D_RegPlaceOfDeath, string D_RegHouse_No, string D_RegHouseQual_No, string D_RegStName, string D_RegUnit,
         string D_RegCity, string D_RegProv, string D_RegCountry, string D_RegPC, string D_RegFirstName_I, string D_RegLastName_I,
         string D_RegMiddlename_I, string D_RegHouseNo_I, string D_RegHouseQualNo_I, string D_RegStName_I, string D_RegUnit_I,
         string D_RegCity_I, string D_RegProv_I, string D_RegCountry_I, string D_RegPC_I, string D_RegCauseo_Death1,
         string D_RegCauseof_eath2, Int64 D_RegDrCode, Int64 D_RegFuneralCode, string D_Printed)
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
                cmd.Parameters.AddWithValue("@D_Reg_HouseQualNo_D", D_RegHouseQualNo_D);
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
                cmd.Parameters.AddWithValue("@D_Reg_HouseQual_No", D_RegHouseQual_No);
                cmd.Parameters.AddWithValue("@D_Reg_StName", D_RegStName);
                cmd.Parameters.AddWithValue("@D_Reg_Unit", D_RegUnit);
                cmd.Parameters.AddWithValue("@D_Reg_City", D_RegCity);
                cmd.Parameters.AddWithValue("@D_Reg_Prov", D_RegProv);
                cmd.Parameters.AddWithValue("@D_Reg_Country", D_RegCountry);
                cmd.Parameters.AddWithValue("@D_Reg_PC", D_RegPC);
                //cmd.Parameters.AddWithValue("@D_Reg_FirstName_I", D_RegFirstName_I);
                //cmd.Parameters.AddWithValue("@D_Reg_FirstName_I", D_RegFirstName_I);
                //cmd.Parameters.AddWithValue("@D_Reg_Middlename_I", D_RegMiddlename_I);
                //cmd.Parameters.AddWithValue("@D_Reg_HouseNo_I", D_RegHouseNo_I);
                //cmd.Parameters.AddWithValue("@D_Reg_HouseQualNo_I", D_RegHouseQualNo_I);
                //cmd.Parameters.AddWithValue("@D_Reg_StName_I", D_RegStName_I);
                //cmd.Parameters.AddWithValue("@D_Reg_Unit_I", D_RegUnit_I);
                //cmd.Parameters.AddWithValue("@D_Reg_City_I", D_RegCity_I);
                //cmd.Parameters.AddWithValue("@D_Reg_Prov_I", D_RegProv_I);
                //cmd.Parameters.AddWithValue("@D_Reg_Country_I", D_RegCountry_I);
                //cmd.Parameters.AddWithValue("@D_Reg_PC_I", D_RegPC_I);
                cmd.Parameters.AddWithValue("@D_Reg_Causeo_Death1", D_RegCauseo_Death1);
                cmd.Parameters.AddWithValue("@D_Reg_Causeof_eath2", D_RegCauseof_eath2);
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
    }
}