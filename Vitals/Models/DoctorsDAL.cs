using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using static Vitals.Models.Doctors;

namespace Vitals.Models
{
    public class DoctorsDAL
    {
        public static DataSet GetDoctors()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("GetDoctors", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "Doctors");
            return ds;
        }
        public static Doctor GetDoctor(int D_RegDRNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetDoctors", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_RegDRNo", D_RegDRNo);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Doctor D = new Doctor();
                    D.D_RegFirstName = dr["D_Reg_First_Name"].ToString();
                    D.D_ShortName = dr["D_Short_Name"].ToString();
                    D.D_RegLastName = dr["D_Reg_Last_Name"].ToString();
                    D.D_RegHouseNo = dr["D_Reg_House_No"].ToString();
                    D.D_RegStName = dr["D_Reg_St_Name"].ToString();
                    D.D_RegUnit = dr["D_Reg_Unit"].ToString();
                    D.D_RegProv = dr["D_Reg_Prov"].ToString();
                    D.D_RegCity = dr["D_Reg_City"].ToString();
                    D.D_RegCountry = dr["D_Reg_Country"].ToString();
                    D.D_RegPC = dr["D_Reg_PC"].ToString();
                    D.D_RegAttendant = dr["D_Reg_Attendant"].ToString();

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
        public static Doctor SearchDoctor(string Search_String)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SearchDoctors", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Searchstr", Search_String);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Doctor D = new Doctor();
                   
                    D.D_RegFirstName = dr["D_Reg_First_Name"].ToString();
                    D.D_ShortName = dr["D_Short_Name"].ToString();
                    D.D_RegLastName = dr["D_Reg_Last_Name"].ToString();
                    D.D_RegHouseNo = dr["D_Reg_House_No"].ToString();
                    D.D_RegStName = dr["D_Reg_St_Name"].ToString();
                    D.D_RegUnit = dr["D_Reg_Unit"].ToString();
                    D.D_RegProv = dr["D_Reg_Prov"].ToString();
                    D.D_RegCity = dr["D_Reg_City"].ToString();
                    D.D_RegCountry = dr["D_Reg_Country"].ToString();
                    D.D_RegPC = dr["D_Reg_PC"].ToString();
                    D.D_RegAttendant = dr["D_Reg_Attendant"].ToString();
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

            public static string AddDoctors(string D_RegFirstName, string D_ShortName, string D_RegLastName, string D_RegHouseNo,
            string D_RegStName, string D_RegUnit, string D_RegProv, string D_RegCity, string D_RegCountry, string D_RegPC, string D_RegAttendant)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Doctors_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_ShortName", D_ShortName);
                cmd.Parameters.AddWithValue("@D_RegLastName", D_RegLastName);
                cmd.Parameters.AddWithValue("@D_RegFirstName", D_RegFirstName);
                cmd.Parameters.AddWithValue("@D_RegHouseNo", D_RegHouseNo);
                cmd.Parameters.AddWithValue("@D_RegStName", D_RegStName);
                cmd.Parameters.AddWithValue("@D_RegUnit", D_RegUnit);
                cmd.Parameters.AddWithValue("@D_RegProv", D_RegProv);
                cmd.Parameters.AddWithValue("@D_RegCity", D_RegCity);
                cmd.Parameters.AddWithValue("@D_RegCountry", D_RegCountry);
                cmd.Parameters.AddWithValue("@D_RegPC", D_RegPC);
                cmd.Parameters.AddWithValue("@D_RegAttendant", D_RegAttendant);
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
        public static string DeleteDoctor(int D_RegDRNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteDoctors", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_RegDRNo", D_RegDRNo);
               // cmd.ExecuteNonQuery();
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
        public static string UpdateDoctor(int D_RegDRNo, string D_RegFirstName, string D_ShortName, string D_RegLastName, string D_RegHouseNo, 
            string D_RegStName, string D_RegUnit, string D_RegProv, string D_RegCity, string D_RegCountry, string D_RegPC, string D_RegAttendant)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Doctors_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@D_RegDRNo", D_RegDRNo);
                cmd.Parameters.AddWithValue("@D_ShortName", D_ShortName);
                cmd.Parameters.AddWithValue("@D_RegLastName", D_RegLastName);
                cmd.Parameters.AddWithValue("@D_RegFirstName", D_RegFirstName);
                cmd.Parameters.AddWithValue("@D_RegHouseNo", D_RegHouseNo);
                cmd.Parameters.AddWithValue("@D_RegStName", D_RegStName);
                cmd.Parameters.AddWithValue("@D_RegUnit", D_RegUnit);
                cmd.Parameters.AddWithValue("@D_RegProv", D_RegProv);
                cmd.Parameters.AddWithValue("@D_RegCity", D_RegCity);
                cmd.Parameters.AddWithValue("@D_RegCountry", D_RegCountry);
                cmd.Parameters.AddWithValue("@D_RegPC", D_RegPC);
                cmd.Parameters.AddWithValue("@D_RegAttendant", D_RegAttendant);
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