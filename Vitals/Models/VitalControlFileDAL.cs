using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using static Vitals.Models.VitalControlFile;
namespace Vitals.Models
{
    public class VitalControlFileDAL
    {

        public static DataSet GetVitalControls()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("GetVitalControl", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "VitalControlFile");
            return ds;
        }
        public static VCFile GetVitalControls(int VC_CntlLast_I_RegNo)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetVitalControl", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VC_CntlLastIRegNo", VC_CntlLast_I_RegNo);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    VCFile VC = new VCFile();
                    VC.VC_CntlLast_I_RegNo = int.Parse(dr["Cntl_Last_I_Reg_No"].ToString());
                    VC.VC_Year_Inside = int.Parse(dr["Year_Inside"].ToString());
                    VC.VC_CntlLast_O_RegNo = int.Parse(dr["Cntl_Last_O_Reg_No"].ToString());
                    VC.VC_Year_Outside = int.Parse(dr["Year_Outside"].ToString());
                    VC.VC_CntlLast_S_RegNo = int.Parse(dr["Cntl_Last_S_Reg_No"].ToString());
                    VC.VC_CntlLast_M_RegNo = int.Parse(dr["Cntl_Last_M_Reg_No"].ToString());
                    VC.VC_Cntl_DeptNo = int.Parse(dr["Cntl_Dept_No"].ToString());
                    VC.VC_Cntl_AccNo = int.Parse(dr["Cntl_Acc_No"].ToString());
                    VC.VC_CntlBur_PermitPrice = decimal.Parse(dr["Cntl_Bur_Permit_Price"].ToString());
                    VC.VC_Residant_Marriage_Licence = decimal.Parse(dr["Residant_Marriage_Licence"].ToString());
                    VC.VC_Non_Residant_Marriage_Licence = decimal.Parse(dr["Non_Residant_Marriage_Licence"].ToString());
                    VC.VC_Town = dr["Town"].ToString();
                    VC.VC_Region = dr["Region"].ToString();
                    VC.VC_ProvShort = dr["ProvShort"].ToString();
                    VC.VC_RegisterNumber = dr["Register_Number"].ToString();
                    VC.VC_ApplicationTitle = dr["Application_Title"].ToString();

                    return VC;
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
       // int VC_CntlLast_B_RegNo, int VC_CntlLast_BI_RegNo,
        public static string AddVitalControls(int VC_CntlLast_I_RegNo,int VC_Year_Inside, int VC_CntlLast_O_RegNo, int VC_Year_Outside, int VC_CntlLast_S_RegNo, int VC_CntlLast_M_RegNo,
           int VC_Cntl_DeptNo,int VC_Cntl_AccNo,decimal VC_CntlBur_PermitPrice,
            decimal VC_Residant_Marriage_Licence,decimal VC_Non_Residant_Marriage_Licence, string VC_Town,string VC_Region, string VC_ProvShort, string VC_RegisterNumber, 
            string VC_ApplicationTitle)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("VitalControl_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VC_CntlLastIRegNo", VC_CntlLast_I_RegNo);
                cmd.Parameters.AddWithValue("@VC_Year_Inside", VC_Year_Inside);
                cmd.Parameters.AddWithValue("@VC_CntlLastORegNo", VC_CntlLast_O_RegNo);
                cmd.Parameters.AddWithValue("@VC_Year_Outside", VC_Year_Outside);
                cmd.Parameters.AddWithValue("@VC_CntlLastSRegNo", VC_CntlLast_S_RegNo);
                cmd.Parameters.AddWithValue("@VC_CntlLastMRegNo", VC_CntlLast_M_RegNo);
                cmd.Parameters.AddWithValue("@VC_CntlDeptNo", VC_Cntl_DeptNo);
                cmd.Parameters.AddWithValue("@VC_CntlAccNo", VC_Cntl_AccNo);
                cmd.Parameters.AddWithValue("@VC_CntlBurPermitPrice", VC_CntlBur_PermitPrice);
                cmd.Parameters.AddWithValue("@VC_ResidantMarriageLicence", VC_Residant_Marriage_Licence);
                cmd.Parameters.AddWithValue("@VC_NonResidantMarriageLicence", VC_Non_Residant_Marriage_Licence);
                cmd.Parameters.AddWithValue("@VC_Town", VC_Town);
                cmd.Parameters.AddWithValue("@VC_Region", VC_Region);
                cmd.Parameters.AddWithValue("@VC_ProvShort", VC_ProvShort);
                cmd.Parameters.AddWithValue("@VC_RegisterNumber", VC_RegisterNumber);
                cmd.Parameters.AddWithValue("@VC_Application_Title", VC_ApplicationTitle);
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
        public static string UpdateVitalControls(int VC_CntlLast_I_RegNo, int VC_Year_Inside, int VC_CntlLast_O_RegNo, int VC_Year_Outside, int VC_CntlLast_S_RegNo, int VC_CntlLast_M_RegNo,
             int VC_Cntl_DeptNo, int VC_Cntl_AccNo, decimal VC_CntlBur_PermitPrice,
              decimal VC_Residant_Marriage_Licence, decimal VC_Non_Residant_Marriage_Licence, string VC_Town, string VC_Region, string VC_ProvShort, string VC_RegisterNumber,
              string VC_ApplicationTitle)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("VitalControl_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VC_CntlLastIRegNo", VC_CntlLast_I_RegNo);
                cmd.Parameters.AddWithValue("@VC_YearInside", VC_Year_Inside);
                cmd.Parameters.AddWithValue("@VC_CntlLastORegNo", VC_CntlLast_O_RegNo);
                cmd.Parameters.AddWithValue("@VC_YearOutside", VC_Year_Outside);
                cmd.Parameters.AddWithValue("@VC_CntlLastSRegNo", VC_CntlLast_S_RegNo);
                cmd.Parameters.AddWithValue("@VC_CntlLastMRegNo", VC_CntlLast_M_RegNo);
                cmd.Parameters.AddWithValue("@VC_CntlDeptNo", VC_Cntl_DeptNo);
                cmd.Parameters.AddWithValue("@VC_CntlAccNo", VC_Cntl_AccNo);
                cmd.Parameters.AddWithValue("@VC_CntlBurPermitPrice", VC_CntlBur_PermitPrice);
                cmd.Parameters.AddWithValue("@VC_ResidantMarriageLicence", VC_Residant_Marriage_Licence);
                cmd.Parameters.AddWithValue("@VC_NonResidantMarriageLicence", VC_Non_Residant_Marriage_Licence);
                cmd.Parameters.AddWithValue("@VC_Town", VC_Town);
                cmd.Parameters.AddWithValue("@VC_Region", VC_Region);
                cmd.Parameters.AddWithValue("@VC_ProvShort", VC_ProvShort);
                cmd.Parameters.AddWithValue("@VC_RegisterNumber", VC_RegisterNumber);
                cmd.Parameters.AddWithValue("@VC_Application_Title", VC_ApplicationTitle);
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