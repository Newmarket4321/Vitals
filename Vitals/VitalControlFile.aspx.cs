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
            }
        }
        protected void submit_Click(object sender, EventArgs e)
        {

            if (GLActNo.Text != "")
            {
                int lastdeath = int.Parse(LastDeathInside.Text == string.Empty ? "0" : LastDeathInside.Text);

                int laastDeathOutside = int.Parse(LastDeathOutside.Text == string.Empty ? "0" : LastDeathOutside.Text);

                int GLAcc = int.Parse(GLActNo.Text == string.Empty ? "0" : GLActNo.Text);

                int latsbirth = int.Parse(Lastbirths.Text == string.Empty ? "0" : Lastbirths.Text);

                int lastmrg = int.Parse(LastMarriage.Text == string.Empty ? "0" : LastMarriage.Text);

                int lastbirthReg = int.Parse(LastBirthRegistration.Text == string.Empty ? "0" : LastBirthRegistration.Text);

                int lastincompleteReg = int.Parse(LastIncompleteReg.Text == string.Empty ? "0" : LastIncompleteReg.Text);

                int GLno = int.Parse(GLNo.Text == string.Empty ? "0" : GLNo.Text);

                decimal BurialPPrice = decimal.Parse(BurialPermitPrice.Text == string.Empty ? "0.00" : BurialPermitPrice.Text);

                decimal MarriageCPrice = decimal.Parse(MarriageCertificatePrice.Text == string.Empty ? "0.00" : MarriageCertificatePrice.Text);
               
                string msg = AddVitalControls(
                    lastdeath,
                    laastDeathOutside,
                    latsbirth,
                    lastmrg,
                    lastbirthReg,
                    lastincompleteReg,
                    GLno,
                    GLAcc,
                    BurialPPrice,
                    MarriageCPrice,
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
                lblMsg.Text = "Please fill required filds with valid value!";
                lblMsg.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "');", true);
            }
        }
    }
}