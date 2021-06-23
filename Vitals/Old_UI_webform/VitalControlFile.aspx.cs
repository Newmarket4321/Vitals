using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Vitals.Models.VitalControlFileDAL;
using System.Xml;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Vitals.Models;

namespace Vitals
{
    public partial class VitalControlFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Environment.UserName);
           // Response.End();
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(Database.ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("GetProvinceState", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds, "ProvinceState");
                province.DataTextField = ds.Tables[0].Columns["Province_Long"].ToString();
                province.DataValueField = ds.Tables[0].Columns["ProvShort"].ToString();
                province.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                province.DataBind();
                con.Open();
                SqlCommand cmd = new SqlCommand("GetVitalControl", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LastDeathInside.Text = dr["Cntl_Last_I_Reg_No"].ToString();
                    Year_Inside.Text = dr["Year_Inside"].ToString();
                    LastDeathOutside.Text = dr["Cntl_Last_O_Reg_No"].ToString();
                    Year_Outside.Text = dr["Year_Outside"].ToString();
                    Stillbirths.Text= dr["Cntl_Last_S_Reg_No"].ToString();
                    LastMarriage.Text = dr["Cntl_Last_M_Reg_No"].ToString();
                    GLNo.Text = dr["Cntl_Dept_No"].ToString();
                    GLActNo.Text = dr["Cntl_Acc_No"].ToString();
                    BurialPermitPrice.Text = dr["Cntl_Bur_Permit_Price"].ToString();
                    MarriageLicence1.Text = dr["Residant_Marriage_Licence"].ToString();
                    MarriageLicence2.Text = dr["Non_Residant_Marriage_Licence"].ToString();
                    NameofTown.Text = dr["Town"].ToString();
                    NameofRegion.Text = dr["Region"].ToString();
                    RegisterNumber.Text = dr["ProvShort"].ToString();
                    ApplicationTitle.Text = dr["Register_Number"].ToString();
                    province.Text = dr["Application_Title"].ToString();
                }
            }
        }
        protected void submit_Click(object sender, EventArgs e)
        {


            if (GLActNo.Text != "")
            {
                int lastdeath = int.Parse(LastDeathInside.Text == string.Empty ? "0" : LastDeathInside.Text);

                int laastDeathOutside = int.Parse(LastDeathOutside.Text == string.Empty ? "0" : LastDeathOutside.Text);

                int GLAcc = int.Parse(GLActNo.Text == string.Empty ? "0" : GLActNo.Text);

                int latsbirth = int.Parse(Stillbirths.Text == string.Empty ? "0" : Stillbirths.Text);

                int lastmrg = int.Parse(LastMarriage.Text == string.Empty ? "0" : LastMarriage.Text);
                int year_inside = int.Parse(Year_Inside.Text == string.Empty ? "0" : Year_Inside.Text);
                int year_outside = int.Parse(Year_Outside.Text == string.Empty ? "0" : Year_Outside.Text);
                //int lastbirthReg = int.Parse(LastBirthRegistration.Text == string.Empty ? "0" : LastBirthRegistration.Text);

                //int lastincompleteReg = int.Parse(LastIncompleteReg.Text == string.Empty ? "0" : LastIncompleteReg.Text);

                int GLno = int.Parse(GLNo.Text == string.Empty ? "0" : GLNo.Text);

                decimal BurialPPrice = decimal.Parse(BurialPermitPrice.Text == string.Empty ? "0.00" : BurialPermitPrice.Text);

                decimal MarriageCPrice1 = decimal.Parse(MarriageLicence1.Text == string.Empty ? "0.00" : MarriageLicence1.Text);
                decimal MarriageCPrice2 = decimal.Parse(MarriageLicence2.Text == string.Empty ? "0.00" : MarriageLicence2.Text);

                string msg = AddVitalControls(
                    lastdeath,
                    year_inside,
                    laastDeathOutside,
                    year_outside,
                    latsbirth,
                    lastmrg,
                    GLno,
                    GLAcc,
                    BurialPPrice,
                    MarriageCPrice1,
                    MarriageCPrice2,
                    NameofTown.Text, 
                    NameofRegion.Text, 
                    province.SelectedItem.Value, 
                    RegisterNumber.Text, 
                    ApplicationTitle.Text);

                if (msg == null)
                {
                    lblMsg.Text = "Record Has Been Added Successfully!";
                    lblMsg.Visible = false;
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "');", true);

                }
                else
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "');", true);
            }
            else
            {
                lblMsg.Text = "Please fill required fields with valid value!";
                lblMsg.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "');", true);
            }
        }
    }
}