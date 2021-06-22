using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using static Vitals.Models.Marriages;
namespace Vitals.Models
{
   
    public class MarriagesDAL
    {
        public static DataSet GetMarriages()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("GetMarriage", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "Marrage");
            return ds;
        }

        public static Marriage GetMarriage(int M_Reg_Year, int M_Reg_No, string M_Reg_Letter, int M_Reg_CertNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetMarriage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@M_Reg_Year", M_Reg_Year);
                cmd.Parameters.AddWithValue("@M_Reg_No", M_Reg_No);
                cmd.Parameters.AddWithValue("@M_Reg_Letter", M_Reg_Letter);
                cmd.Parameters.AddWithValue("@M_Reg_CertNo", M_Reg_CertNo);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                   Marriage M = new Marriage();
                   M.M_Reg_AddressSame = dr["M_Reg_Address_Same"].ToString();
	               M.M_Reg_FirstName_F = dr["M_Reg_First_Name_F"].ToString();
	               M.M_Reg_LastNameF = dr["M_Reg_Last_Name_F"].ToString();
	               M.M_Reg_Middlename_F = dr["M_Reg_Middle_name_F"].ToString();
	               M.M_Reg_HouseNo_F = dr["M_Reg_House_No_F"].ToString();
	               M.M_Reg_StName_F = dr["M_Reg_St_Name_F"].ToString();
	               M.M_Reg_Unit_F = dr["M_Reg_Unit_F"].ToString();
	               M.M_Reg_City_F = dr["M_Reg_City_F"].ToString();
	               M.M_Reg_Prov_F = dr["M_Reg_Prov_F"].ToString();
	               M.M_Reg_Country_F = dr["M_Reg_Country_F"].ToString();
	               M.M_Reg_PC_F = dr["M_Reg_PC_F"].ToString();
	               M.M_Reg_FirstName_M = dr["M_Reg_First_Name_M"].ToString();
	               M.M_Reg_LastName_M = dr["M_Reg_Last_Name_M"].ToString();
	               M.M_Reg_Middlename_M = dr["M_Reg_Middle_name_M"].ToString();
	               M.M_Reg_HouseNo_M = dr["M_Reg_House_No_M"].ToString();
	               M.M_Reg_StName_M = dr["M_Reg_St_Name_M"].ToString();
	               M.M_Reg_Unit_M = dr["M_Reg_Unit_M"].ToString();
	               M.M_Reg_City_M = dr["M_Reg_City_M"].ToString();
	               M.M_Reg_Prov_M = dr["M_Reg_Prov_M"].ToString();
	               M.M_Reg_Country_M = dr["M_Reg_Country_M"].ToString();
	               M.M_Reg_PC_M = dr["M_Reg_PC_M"].ToString();
	               M.M_Reg_Issued = Convert.ToDateTime(dr["M_Reg_Issued"].ToString());
	               M.M_Reg_PlaceOfMarriage = dr["M_Reg_Place_Of_Marriage"].ToString();
	               M.M_Reg_DateOfMarriage = Convert.ToDateTime(dr["M_Reg_Date_Of_Marriage"].ToString());
	               M.M_Marriage_Status_F = dr["M_Marriage_Status_F"].ToString();
	               M.M_Reg_CourtFileNo_F = dr["M_Reg_Court_File_No_F"].ToString();
	               M.M_Reg_MunGranted_F = dr["M_Reg_Mun_Granted_F"].ToString();
	               M.M_Reg_DOB_F = Convert.ToDateTime(dr["M_Reg_DOB_F"].ToString());
	               M.M_Reg_Religion_F = dr["M_Reg_Religion_F"].ToString();
	               M.M_Reg_Age_F = int.Parse(dr["M_Reg_Age_F"].ToString());
	               M.M_Reg_PlaceOfBirth_F = dr["M_Reg_Place_Of_Birth_F"].ToString();
	               M.M_Reg_POP_FirstName_F = dr["M_Reg_POP_First_Name_F"].ToString();
	               M.M_Reg_POP_LastName_F = dr["M_Reg_POP_Last_Name_F"].ToString();
	               M.M_Reg_POP_Prov_F = dr["M_Reg_POP_Prov_F"].ToString();
	               M.M_Reg_MOM_FirstName_F = dr["M_Reg_MOM_First_Name_F"].ToString();
	               M.M_Reg_MOM_Last_Name_F = dr["M_Reg_MOM_Last_Name_F"].ToString();
	               M.M_Reg_MOM_Prov_F = dr["M_Reg_MOM_Prov_F"].ToString();
	               M.M_MarriageStatus_M = dr["M_Marriage_Status_M"].ToString();
	               M.M_Reg_CourtFileNo_M = dr["M_Reg_Court_File_No_M"].ToString();
	               M.M_Reg_MunGranted_M = dr["M_Reg_Mun_Granted_M"].ToString();
	               M.M_Reg_DOB_M = Convert.ToDateTime(dr["M_Reg_DOB_M"].ToString());
	               M.M_Reg_Religion_M = dr["M_Reg_Religion_M"].ToString();
	               M.M_Reg_Age_M = int.Parse(dr["M_Reg_Age_M"].ToString());
	               M.M_Reg_PlaceOfBirth_M = dr["M_Reg_Place_Of_Birth_M"].ToString();
	               M.M_Reg_POP_FirstName_M = dr["M_Reg_POP_First_Name_M"].ToString();
	               M.M_Reg_POP_LastName_M = dr["M_Reg_POP_Last_Name_M"].ToString();
	               M.M_Reg_POP_Prov_M = dr["M_Reg_POP_Prov_M"].ToString();
	               M.M_Reg_MOM_FirstName_M = dr["M_Reg_MOM_First_Name_M"].ToString();
	               M.M_Reg_MOM_LastName_M = dr["M_Reg_MOM_Last_Name_M"].ToString();
	               M.M_Reg_MOM_Prov_M = dr["M_Reg_MOM_Prov_M"].ToString();
	               M.M_Reg_TelePhoneNo_F = dr["M_Reg_TelePhone_No_F"].ToString();
	               M.M_Reg_TelephoneNo_M = dr["M_Reg_Telephone_No_M"].ToString();
	               M.M_Reg_Applicant = dr["M_Reg_Applicant"].ToString();
	               M.M_Reg_POP_FirstNameSur_F = dr["M_Reg_POP_First_Name_Sur_F"].ToString();
	               M.M_Reg_POP_LastNameSur_F = dr["M_Reg_POP_Last_Name_Sur_F"].ToString();
	               M.M_Reg_POP_ProvSur_F = dr["M_Reg_POP_Prov_Sur_F"].ToString();
	               M.M_Reg_MOM_FirstNameSur_F = dr["M_Reg_MOM_First_Name_Sur_F"].ToString();
	               M.M_Reg_MOM_LastNameSur_F = dr["M_Reg_MOM_Last_Name_Sur_F"].ToString();
	               M.M_Reg_MOM_ProvSur_F = dr["M_Reg_MOM_Prov_Sur_F"].ToString();
	               M.M_Reg_POP_FirstNameSur_M = dr["M_Reg_POP_First_Name_Sur_M"].ToString();
	               M.M_Reg_POP_LastNameSur_M = dr["M_Reg_POP_Last_Name_Sur_M"].ToString();
	               M.M_Reg_POP_ProvSur_M = dr["M_Reg_POP_Prov_Sur_M"].ToString();
	               M.M_Reg_MOM_FirstNameSur_M = dr["M_Reg_MOM_First_Name_Sur_M"].ToString();
	               M.M_Reg_MOM_LastName_Sur_M = dr["M_Reg_MOM_Last_Name_Sur_M"].ToString();
	               M.M_Reg_MOM_ProvSur_M = dr["M_Reg_MOM_Prov_Sur_M"].ToString();
	               M.M_Reg_CountryGranted_F = dr["M_Reg_Country_Granted_F"].ToString();
	               M.M_Reg_CountryGranted_M = dr["M_Reg_Country_Granted_M"].ToString();

                    return M;
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
        public static Marriage SearchMarriage(int M_Reg_Year, int M_Reg_No, string M_Reg_Letter, int M_Reg_CertNo, 
            string M_Reg_FirstName_F, string M_Reg_LastNameF, string M_Reg_FirstName_M, string M_Reg_LastName_M)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SearchMarriage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@M_Reg_Year", M_Reg_Year);
                cmd.Parameters.AddWithValue("@M_Reg_No", M_Reg_No);
                cmd.Parameters.AddWithValue("@M_Reg_Letter", M_Reg_Letter);
                cmd.Parameters.AddWithValue("@M_Reg_CertNo", M_Reg_CertNo);
                cmd.Parameters.AddWithValue("@M_Reg_FirstName_F", M_Reg_FirstName_F);
                cmd.Parameters.AddWithValue("@M_Reg_LastNameF", M_Reg_LastNameF);
                cmd.Parameters.AddWithValue("@M_Reg_FirstName_M", M_Reg_FirstName_M);
                cmd.Parameters.AddWithValue("@M_Reg_LastName_M", M_Reg_LastName_M);
                SqlDataReader dr = cmd.ExecuteReader();

                  if (dr.Read())
                {
                    Marriage M = new Marriage();
                    M.M_Reg_AddressSame = dr["M_Reg_Address_Same"].ToString();
                    M.M_Reg_FirstName_F = dr["M_Reg_First_Name_F"].ToString();
                    M.M_Reg_LastNameF = dr["M_Reg_Last_Name_F"].ToString();
                    M.M_Reg_Middlename_F = dr["M_Reg_Middle_name_F"].ToString();
                    M.M_Reg_HouseNo_F = dr["M_Reg_House_No_F"].ToString();
                    M.M_Reg_StName_F = dr["M_Reg_St_Name_F"].ToString();
                    M.M_Reg_Unit_F = dr["M_Reg_Unit_F"].ToString();
                    M.M_Reg_City_F = dr["M_Reg_City_F"].ToString();
                    M.M_Reg_Prov_F = dr["M_Reg_Prov_F"].ToString();
                    M.M_Reg_Country_F = dr["M_Reg_Country_F"].ToString();
                    M.M_Reg_PC_F = dr["M_Reg_PC_F"].ToString();
                    M.M_Reg_FirstName_M = dr["M_Reg_First_Name_M"].ToString();
                    M.M_Reg_LastName_M = dr["M_Reg_Last_Name_M"].ToString();
                    M.M_Reg_Middlename_M = dr["M_Reg_Middle_name_M"].ToString();
                    M.M_Reg_HouseNo_M = dr["M_Reg_House_No_M"].ToString();
                    M.M_Reg_StName_M = dr["M_Reg_St_Name_M"].ToString();
                    M.M_Reg_Unit_M = dr["M_Reg_Unit_M"].ToString();
                    M.M_Reg_City_M = dr["M_Reg_City_M"].ToString();
                    M.M_Reg_Prov_M = dr["M_Reg_Prov_M"].ToString();
                    M.M_Reg_Country_M = dr["M_Reg_Country_M"].ToString();
                    M.M_Reg_PC_M = dr["M_Reg_PC_M"].ToString();
                    M.M_Reg_Issued = Convert.ToDateTime(dr["M_Reg_Issued"].ToString());
                    M.M_Reg_PlaceOfMarriage = dr["M_Reg_Place_Of_Marriage"].ToString();
                    M.M_Reg_DateOfMarriage = Convert.ToDateTime(dr["M_Reg_Date_Of_Marriage"].ToString());
                    M.M_Marriage_Status_F = dr["M_Marriage_Status_F"].ToString();
                    M.M_Reg_CourtFileNo_F = dr["M_Reg_Court_File_No_F"].ToString();
                    M.M_Reg_MunGranted_F = dr["M_Reg_Mun_Granted_F"].ToString();
                    M.M_Reg_DOB_F = Convert.ToDateTime(dr["M_Reg_DOB_F"].ToString());
                    M.M_Reg_Religion_F = dr["M_Reg_Religion_F"].ToString();
                    M.M_Reg_Age_F = int.Parse(dr["M_Reg_Age_F"].ToString());
                    M.M_Reg_PlaceOfBirth_F = dr["M_Reg_Place_Of_Birth_F"].ToString();
                    M.M_Reg_POP_FirstName_F = dr["M_Reg_POP_First_Name_F"].ToString();
                    M.M_Reg_POP_LastName_F = dr["M_Reg_POP_Last_Name_F"].ToString();
                    M.M_Reg_POP_Prov_F = dr["M_Reg_POP_Prov_F"].ToString();
                    M.M_Reg_MOM_FirstName_F = dr["M_Reg_MOM_First_Name_F"].ToString();
                    M.M_Reg_MOM_Last_Name_F = dr["M_Reg_MOM_Last_Name_F"].ToString();
                    M.M_Reg_MOM_Prov_F = dr["M_Reg_MOM_Prov_F"].ToString();
                    M.M_MarriageStatus_M = dr["M_Marriage_Status_M"].ToString();
                    M.M_Reg_CourtFileNo_M = dr["M_Reg_Court_File_No_M"].ToString();
                    M.M_Reg_MunGranted_M = dr["M_Reg_Mun_Granted_M"].ToString();
                    M.M_Reg_DOB_M = Convert.ToDateTime(dr["M_Reg_DOB_M"].ToString());
                    M.M_Reg_Religion_M = dr["M_Reg_Religion_M"].ToString();
                    M.M_Reg_Age_M = int.Parse(dr["M_Reg_Age_M"].ToString());
                    M.M_Reg_PlaceOfBirth_M = dr["M_Reg_Place_Of_Birth_M"].ToString();
                    M.M_Reg_POP_FirstName_M = dr["M_Reg_POP_First_Name_M"].ToString();
                    M.M_Reg_POP_LastName_M = dr["M_Reg_POP_Last_Name_M"].ToString();
                    M.M_Reg_POP_Prov_M = dr["M_Reg_POP_Prov_M"].ToString();
                    M.M_Reg_MOM_FirstName_M = dr["M_Reg_MOM_First_Name_M"].ToString();
                    M.M_Reg_MOM_LastName_M = dr["M_Reg_MOM_Last_Name_M"].ToString();
                    M.M_Reg_MOM_Prov_M = dr["M_Reg_MOM_Prov_M"].ToString();
                    M.M_Reg_TelePhoneNo_F = dr["M_Reg_TelePhone_No_F"].ToString();
                    M.M_Reg_TelephoneNo_M = dr["M_Reg_Telephone_No_M"].ToString();
                    M.M_Reg_Applicant = dr["M_Reg_Applicant"].ToString();
                    M.M_Reg_POP_FirstNameSur_F = dr["M_Reg_POP_First_Name_Sur_F"].ToString();
                    M.M_Reg_POP_LastNameSur_F = dr["M_Reg_POP_Last_Name_Sur_F"].ToString();
                    M.M_Reg_POP_ProvSur_F = dr["M_Reg_POP_Prov_Sur_F"].ToString();
                    M.M_Reg_MOM_FirstNameSur_F = dr["M_Reg_MOM_First_Name_Sur_F"].ToString();
                    M.M_Reg_MOM_LastNameSur_F = dr["M_Reg_MOM_Last_Name_Sur_F"].ToString();
                    M.M_Reg_MOM_ProvSur_F = dr["M_Reg_MOM_Prov_Sur_F"].ToString();
                    M.M_Reg_POP_FirstNameSur_M = dr["M_Reg_POP_First_Name_Sur_M"].ToString();
                    M.M_Reg_POP_LastNameSur_M = dr["M_Reg_POP_Last_Name_Sur_M"].ToString();
                    M.M_Reg_POP_ProvSur_M = dr["M_Reg_POP_Prov_Sur_M"].ToString();
                    M.M_Reg_MOM_FirstNameSur_M = dr["M_Reg_MOM_First_Name_Sur_M"].ToString();
                    M.M_Reg_MOM_LastName_Sur_M = dr["M_Reg_MOM_Last_Name_Sur_M"].ToString();
                    M.M_Reg_MOM_ProvSur_M = dr["M_Reg_MOM_Prov_Sur_M"].ToString();
                    M.M_Reg_CountryGranted_F = dr["M_Reg_Country_Granted_F"].ToString();
                    M.M_Reg_CountryGranted_M = dr["M_Reg_Country_Granted_M"].ToString();

                    return M;
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
        public static string AddMarriages(int M_Reg_Year, int M_Reg_No, string M_Reg_Letter, Int64 M_Reg_CertNo, string M_Reg_AddressSame,
               string M_Reg_FirstName_F, string M_Reg_LastNameF, string M_Reg_Middlename_F,
               string M_Reg_HouseNo_F, string M_Reg_StName_F, string M_Reg_Unit_F,
               string M_Reg_City_F, string M_Reg_Prov_F, string M_Reg_Country_F, string M_Reg_PC_F,
               string M_Reg_FirstName_M, string M_Reg_LastName_M, string M_Reg_Middlename_M, string M_Reg_HouseNo_M,string M_Reg_StName_M, string M_Reg_Unit_M, string M_Reg_City_M,
               string M_Reg_Prov_M, string M_Reg_Country_M, string M_Reg_PC_M, DateTime M_Reg_Issued,
               string M_Reg_PlaceOfMarriage, DateTime M_Reg_DateOfMarriage, string M_Marriage_Status_F, string M_Reg_CourtFileNo_F,
               string M_Reg_MunGranted_F, DateTime M_Reg_DOB_F, string M_Reg_Religion_F, int M_Reg_Age_F, string M_Reg_PlaceOfBirth_F, string M_Reg_POP_FirstName_F,
               string M_Reg_POP_LastName_F, string M_Reg_POP_Prov_F, string M_Reg_MOM_FirstName_F, string M_Reg_MOM_Last_Name_F,
               string M_Reg_MOM_Prov_F, string M_MarriageStatus_M, string M_Reg_CourtFileNo_M, string M_Reg_MunGranted_M,
               DateTime M_Reg_DOB_M, string M_Reg_Religion_M, int M_Reg_Age_M, string M_Reg_PlaceOfBirth_M,
               string M_Reg_POP_FirstName_M, string M_Reg_POP_LastName_M, string M_Reg_POP_Prov_M, string M_Reg_MOM_FirstName_M,
               string M_Reg_MOM_LastName_M, string M_Reg_MOM_Prov_M, string M_Reg_TelePhoneNo_F, string M_Reg_TelephoneNo_M,
               string M_Reg_Applicant, string M_Reg_POP_FirstNameSur_F, string M_Reg_POP_LastNameSur_F, string M_Reg_POP_ProvSur_F,
               string M_Reg_MOM_FirstNameSur_F, string M_Reg_MOM_LastNameSur_F, string M_Reg_MOM_ProvSur_F, string M_Reg_POP_FirstNameSur_M,
               string M_Reg_POP_LastNameSur_M, string M_Reg_POP_ProvSur_M, string M_Reg_MOM_FirstNameSur_M, string M_Reg_MOM_LastName_Sur_M,
               string M_Reg_MOM_ProvSur_M, string M_Reg_CountryGranted_F, string M_Reg_CountryGranted_M)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Marriage_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@M_Reg_Year", M_Reg_Year);
               cmd.Parameters.AddWithValue("@M_Reg_No", M_Reg_No);
               cmd.Parameters.AddWithValue("@M_Reg_Letter", M_Reg_Letter);
               cmd.Parameters.AddWithValue("@M_Reg_CertNo", M_Reg_CertNo);
               cmd.Parameters.AddWithValue("@M_Reg_AddressSame", M_Reg_AddressSame);
               cmd.Parameters.AddWithValue("@M_Reg_FirstName_F", M_Reg_FirstName_F);
               cmd.Parameters.AddWithValue("@M_Reg_LastNameF", M_Reg_LastNameF);
               cmd.Parameters.AddWithValue("@M_Reg_Middlename_F", M_Reg_Middlename_F);
               cmd.Parameters.AddWithValue("@M_Reg_HouseNo_F", M_Reg_HouseNo_F);
               cmd.Parameters.AddWithValue("@M_Reg_StName_F", M_Reg_StName_F);
               cmd.Parameters.AddWithValue("@M_Reg_Unit_F", M_Reg_Unit_F);
               cmd.Parameters.AddWithValue("@M_Reg_City_F", M_Reg_City_F);
               cmd.Parameters.AddWithValue("@M_Reg_Prov_F", M_Reg_Prov_F);
               cmd.Parameters.AddWithValue("@M_Reg_Country_F",M_Reg_Country_F);
               cmd.Parameters.AddWithValue("@M_Reg_PC_F",M_Reg_PC_F);
               cmd.Parameters.AddWithValue("@M_Reg_FirstName_M",M_Reg_FirstName_M);
               cmd.Parameters.AddWithValue("@M_Reg_LastName_M",M_Reg_LastName_M);
               cmd.Parameters.AddWithValue("@M_Reg_Middlename_M",M_Reg_Middlename_F);
               cmd.Parameters.AddWithValue("@M_Reg_HouseNo_M",M_Reg_HouseNo_M);
               cmd.Parameters.AddWithValue("@M_Reg_StName_M",M_Reg_StName_M);
               cmd.Parameters.AddWithValue("@M_Reg_Unit_M",M_Reg_Unit_M);
               cmd.Parameters.AddWithValue("@M_Reg_City_M",M_Reg_City_M);
               cmd.Parameters.AddWithValue("@M_Reg_Prov_M",M_Reg_Prov_M);
               cmd.Parameters.AddWithValue("@M_Reg_Country_M",M_Reg_Country_M);
               cmd.Parameters.AddWithValue("@M_Reg_PC_M",M_Reg_PC_M);
               cmd.Parameters.AddWithValue("@M_Reg_Issued",M_Reg_Issued);
               cmd.Parameters.AddWithValue("@M_Reg_PlaceOfMarriage",M_Reg_PlaceOfMarriage);
               cmd.Parameters.AddWithValue("@M_Reg_DateOfMarriage",M_Reg_DateOfMarriage);
               cmd.Parameters.AddWithValue("@M_Marriage_Status_F",M_Marriage_Status_F);
               cmd.Parameters.AddWithValue("@M_Reg_CourtFileNo_F",M_Reg_CourtFileNo_F);
               cmd.Parameters.AddWithValue("@M_Reg_MunGranted_F",M_Reg_MunGranted_F);
               cmd.Parameters.AddWithValue("@M_Reg_DOB_F",M_Reg_DOB_F);
               cmd.Parameters.AddWithValue("@M_Reg_Religion_F",M_Reg_Religion_F);
               cmd.Parameters.AddWithValue("@M_Reg_Age_F",M_Reg_Age_F);
               cmd.Parameters.AddWithValue("@M_Reg_PlaceOfBirth_F",M_Reg_PlaceOfBirth_F);
               cmd.Parameters.AddWithValue("@M_Reg_POP_FirstName_F",M_Reg_POP_FirstName_F);
               cmd.Parameters.AddWithValue("@M_Reg_POP_LastName_F", M_Reg_POP_LastName_F);
               cmd.Parameters.AddWithValue("@M_Reg_POP_Prov_F", M_Reg_POP_Prov_F);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstName_F", M_Reg_MOM_FirstName_F);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_Last_Name_F", M_Reg_MOM_Last_Name_F);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_Prov_F", M_Reg_MOM_Prov_F);
               cmd.Parameters.AddWithValue("@M_MarriageStatus_M", M_MarriageStatus_M);
               cmd.Parameters.AddWithValue("@M_Reg_CourtFileNo_M", M_Reg_CourtFileNo_M);
               cmd.Parameters.AddWithValue("@M_Reg_MunGranted_M", M_Reg_MunGranted_M);
               cmd.Parameters.AddWithValue("@M_Reg_DOB_M", M_Reg_DOB_M);
               cmd.Parameters.AddWithValue("@M_Reg_Religion_M", M_Reg_Religion_M);
               cmd.Parameters.AddWithValue("@M_Reg_Age_M", M_Reg_Age_M);
               cmd.Parameters.AddWithValue("@M_Reg_PlaceOfBirth_M", M_Reg_PlaceOfBirth_M);
               cmd.Parameters.AddWithValue("@M_Reg_POP_FirstName_M", M_Reg_POP_FirstName_M);
               cmd.Parameters.AddWithValue("@M_Reg_POP_LastName_M", M_Reg_POP_LastName_M);
               cmd.Parameters.AddWithValue("@M_Reg_POP_Prov_M", M_Reg_POP_Prov_M);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstName_M", M_Reg_MOM_FirstName_M);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_LastName_M", M_Reg_MOM_LastName_M);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_Prov_M", M_Reg_MOM_Prov_M);
               cmd.Parameters.AddWithValue("@M_Reg_TelePhoneNo_F", M_Reg_TelePhoneNo_F);
               cmd.Parameters.AddWithValue("@M_Reg_TelephoneNo_M", M_Reg_TelephoneNo_M);
               cmd.Parameters.AddWithValue("@M_Reg_Applicant", M_Reg_Applicant);
               cmd.Parameters.AddWithValue("@M_Reg_POP_FirstNameSur_F", M_Reg_POP_FirstNameSur_F);
               cmd.Parameters.AddWithValue("@M_Reg_POP_LastNameSur_F", M_Reg_POP_LastNameSur_F);
               cmd.Parameters.AddWithValue("@M_Reg_POP_ProvSur_F", M_Reg_POP_ProvSur_F);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstNameSur_F", M_Reg_MOM_FirstNameSur_F);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_LastNameSur_F", M_Reg_MOM_LastNameSur_F);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_ProvSur_F", M_Reg_MOM_ProvSur_F);
               cmd.Parameters.AddWithValue("@M_Reg_POP_FirstNameSur_M", M_Reg_POP_FirstNameSur_M);
               cmd.Parameters.AddWithValue("@M_Reg_POP_LastNameSur_M", M_Reg_POP_LastNameSur_M);
               cmd.Parameters.AddWithValue("@M_Reg_POP_ProvSur_M", M_Reg_POP_ProvSur_M);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstNameSur_M", M_Reg_MOM_FirstNameSur_M);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_LastName_Sur_M", M_Reg_MOM_LastName_Sur_M);
               cmd.Parameters.AddWithValue("@M_Reg_MOM_ProvSur_M", M_Reg_MOM_ProvSur_M);
               cmd.Parameters.AddWithValue("@M_Reg_CountryGranted_F", M_Reg_CountryGranted_F);
               cmd.Parameters.AddWithValue("@M_Reg_CountryGranted_M", M_Reg_CountryGranted_M);
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

        public static string UpdateMarrigaes(int M_Reg_Year, int M_Reg_No, string M_Reg_Letter, Int64 M_Reg_CertNo, string M_Reg_AddressSame,
                string M_Reg_FirstName_F, string M_Reg_LastNameF, string M_Reg_Middlename_F,
                string M_Reg_HouseNo_F, string M_Reg_StName_F, string M_Reg_Unit_F,
                string M_Reg_City_F, string M_Reg_Prov_F, string M_Reg_Country_F, string M_Reg_PC_F,
                string M_Reg_FirstName_M, string M_Reg_LastName_M, string M_Reg_Middlename_M, string M_Reg_HouseNo_M, string M_Reg_StName_M, string M_Reg_Unit_M, string M_Reg_City_M,
                string M_Reg_Prov_M, string M_Reg_Country_M, string M_Reg_PC_M, DateTime M_Reg_Issued,
                string M_Reg_PlaceOfMarriage, DateTime M_Reg_DateOfMarriage, string M_Marriage_Status_F, string M_Reg_CourtFileNo_F,
                string M_Reg_MunGranted_F, DateTime M_Reg_DOB_F, string M_Reg_Religion_F, int M_Reg_Age_F, string M_Reg_PlaceOfBirth_F, string M_Reg_POP_FirstName_F,
                string M_Reg_POP_LastName_F, string M_Reg_POP_Prov_F, string M_Reg_MOM_FirstName_F, string M_Reg_MOM_Last_Name_F,
                string M_Reg_MOM_Prov_F, string M_MarriageStatus_M, string M_Reg_CourtFileNo_M, string M_Reg_MunGranted_M,
                DateTime M_Reg_DOB_M, string M_Reg_Religion_M, int M_Reg_Age_M, string M_Reg_PlaceOfBirth_M,
                string M_Reg_POP_FirstName_M, string M_Reg_POP_LastName_M, string M_Reg_POP_Prov_M, string M_Reg_MOM_FirstName_M,
                string M_Reg_MOM_LastName_M, string M_Reg_MOM_Prov_M, string M_Reg_TelePhoneNo_F, string M_Reg_TelephoneNo_M,
                string M_Reg_Applicant, string M_Reg_POP_FirstNameSur_F, string M_Reg_POP_LastNameSur_F, string M_Reg_POP_ProvSur_F,
                string M_Reg_MOM_FirstNameSur_F, string M_Reg_MOM_LastNameSur_F, string M_Reg_MOM_ProvSur_F, string M_Reg_POP_FirstNameSur_M,
                string M_Reg_POP_LastNameSur_M, string M_Reg_POP_ProvSur_M, string M_Reg_MOM_FirstNameSur_M, string M_Reg_MOM_LastName_Sur_M,
                string M_Reg_MOM_ProvSur_M, string M_Reg_CountryGranted_F, string M_Reg_CountryGranted_M)
        {

            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Marriage_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@M_Reg_Year", M_Reg_Year);
                cmd.Parameters.AddWithValue("@M_Reg_No", M_Reg_No);
                cmd.Parameters.AddWithValue("@M_Reg_Letter", M_Reg_Letter);
                cmd.Parameters.AddWithValue("@M_Reg_CertNo", M_Reg_CertNo);
                cmd.Parameters.AddWithValue("@M_Reg_AddressSame", M_Reg_AddressSame);
                cmd.Parameters.AddWithValue("@M_Reg_FirstName_F", M_Reg_FirstName_F);
                cmd.Parameters.AddWithValue("@M_Reg_LastNameF", M_Reg_LastNameF);
                cmd.Parameters.AddWithValue("@M_Reg_Middlename_F", M_Reg_Middlename_F);
                cmd.Parameters.AddWithValue("@M_Reg_HouseNo_F", M_Reg_HouseNo_F);
                cmd.Parameters.AddWithValue("@M_Reg_StName_F", M_Reg_StName_F);
                cmd.Parameters.AddWithValue("@M_Reg_Unit_F", M_Reg_Unit_F);
                cmd.Parameters.AddWithValue("@M_Reg_City_F", M_Reg_City_F);
                cmd.Parameters.AddWithValue("@M_Reg_Prov_F", M_Reg_Prov_F);
                cmd.Parameters.AddWithValue("@M_Reg_Country_F", M_Reg_Country_F);
                cmd.Parameters.AddWithValue("@M_Reg_PC_F", M_Reg_PC_F);
                cmd.Parameters.AddWithValue("@M_Reg_FirstName_M", M_Reg_FirstName_M);
                cmd.Parameters.AddWithValue("@M_Reg_LastName_M", M_Reg_LastName_M);
                cmd.Parameters.AddWithValue("@M_Reg_Middlename_M", M_Reg_Middlename_F);
                cmd.Parameters.AddWithValue("@M_Reg_HouseNo_M", M_Reg_HouseNo_M);
                cmd.Parameters.AddWithValue("@M_Reg_StName_M", M_Reg_StName_M);
                cmd.Parameters.AddWithValue("@M_Reg_Unit_M", M_Reg_Unit_M);
                cmd.Parameters.AddWithValue("@M_Reg_City_M", M_Reg_City_M);
                cmd.Parameters.AddWithValue("@M_Reg_Prov_M", M_Reg_Prov_M);
                cmd.Parameters.AddWithValue("@M_Reg_Country_M", M_Reg_Country_M);
                cmd.Parameters.AddWithValue("@M_Reg_PC_M", M_Reg_PC_M);
                cmd.Parameters.AddWithValue("@M_Reg_Issued", M_Reg_Issued);
                cmd.Parameters.AddWithValue("@M_Reg_PlaceOfMarriage", M_Reg_PlaceOfMarriage);
                cmd.Parameters.AddWithValue("@M_Reg_DateOfMarriage", M_Reg_DateOfMarriage);
                cmd.Parameters.AddWithValue("@M_Marriage_Status_F", M_Marriage_Status_F);
                cmd.Parameters.AddWithValue("@M_Reg_CourtFileNo_F", M_Reg_CourtFileNo_F);
                cmd.Parameters.AddWithValue("@M_Reg_MunGranted_F", M_Reg_MunGranted_F);
                cmd.Parameters.AddWithValue("@M_Reg_DOB_F", M_Reg_DOB_F);
                cmd.Parameters.AddWithValue("@M_Reg_Religion_F", M_Reg_Religion_F);
                cmd.Parameters.AddWithValue("@M_Reg_Age_F", M_Reg_Age_F);
                cmd.Parameters.AddWithValue("@M_Reg_PlaceOfBirth_F", M_Reg_PlaceOfBirth_F);
                cmd.Parameters.AddWithValue("@M_Reg_POP_FirstName_F", M_Reg_POP_FirstName_F);
                cmd.Parameters.AddWithValue("@M_Reg_POP_LastName_F", M_Reg_POP_LastName_F);
                cmd.Parameters.AddWithValue("@M_Reg_POP_Prov_F", M_Reg_POP_Prov_F);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstName_F", M_Reg_MOM_FirstName_F);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_Last_Name_F", M_Reg_MOM_Last_Name_F);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_Prov_F", M_Reg_MOM_Prov_F);
                cmd.Parameters.AddWithValue("@M_MarriageStatus_M", M_MarriageStatus_M);
                cmd.Parameters.AddWithValue("@M_Reg_CourtFileNo_M", M_Reg_CourtFileNo_M);
                cmd.Parameters.AddWithValue("@M_Reg_MunGranted_M", M_Reg_MunGranted_M);
                cmd.Parameters.AddWithValue("@M_Reg_DOB_M", M_Reg_DOB_M);
                cmd.Parameters.AddWithValue("@M_Reg_Religion_M", M_Reg_Religion_M);
                cmd.Parameters.AddWithValue("@M_Reg_Age_M", M_Reg_Age_M);
                cmd.Parameters.AddWithValue("@M_Reg_PlaceOfBirth_M", M_Reg_PlaceOfBirth_M);
                cmd.Parameters.AddWithValue("@M_Reg_POP_FirstName_M", M_Reg_POP_FirstName_M);
                cmd.Parameters.AddWithValue("@M_Reg_POP_LastName_M", M_Reg_POP_LastName_M);
                cmd.Parameters.AddWithValue("@M_Reg_POP_Prov_M", M_Reg_POP_Prov_M);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstName_M", M_Reg_MOM_FirstName_M);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_LastName_M", M_Reg_MOM_LastName_M);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_Prov_M", M_Reg_MOM_Prov_M);
                cmd.Parameters.AddWithValue("@M_Reg_TelePhoneNo_F", M_Reg_TelePhoneNo_F);
                cmd.Parameters.AddWithValue("@M_Reg_TelephoneNo_M", M_Reg_TelephoneNo_M);
                cmd.Parameters.AddWithValue("@M_Reg_Applicant", M_Reg_Applicant);
                cmd.Parameters.AddWithValue("@M_Reg_POP_FirstNameSur_F", M_Reg_POP_FirstNameSur_F);
                cmd.Parameters.AddWithValue("@M_Reg_POP_LastNameSur_F", M_Reg_POP_LastNameSur_F);
                cmd.Parameters.AddWithValue("@M_Reg_POP_ProvSur_F", M_Reg_POP_ProvSur_F);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstNameSur_F", M_Reg_MOM_FirstNameSur_F);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_LastNameSur_F", M_Reg_MOM_LastNameSur_F);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_ProvSur_F", M_Reg_MOM_ProvSur_F);
                cmd.Parameters.AddWithValue("@M_Reg_POP_FirstNameSur_M", M_Reg_POP_FirstNameSur_M);
                cmd.Parameters.AddWithValue("@M_Reg_POP_LastNameSur_M", M_Reg_POP_LastNameSur_M);
                cmd.Parameters.AddWithValue("@M_Reg_POP_ProvSur_M", M_Reg_POP_ProvSur_M);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_FirstNameSur_M", M_Reg_MOM_FirstNameSur_M);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_LastName_Sur_M", M_Reg_MOM_LastName_Sur_M);
                cmd.Parameters.AddWithValue("@M_Reg_MOM_ProvSur_M", M_Reg_MOM_ProvSur_M);
                cmd.Parameters.AddWithValue("@M_Reg_CountryGranted_F", M_Reg_CountryGranted_F);
                cmd.Parameters.AddWithValue("@M_Reg_CountryGranted_M", M_Reg_CountryGranted_M);
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

    }

}