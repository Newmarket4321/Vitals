using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using static Vitals.Models.DoctorsDAL;
using System.Xml;
using System.Text;
using Vitals.Models;
using static Vitals.Models.Doctors;

namespace Vitals
{
    public partial class Doctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(City.Text == "" )
              City.Text = "Newmarket";
            if(Province.Text == "")
                Province.Text = "Ontario";
            if(Country.Text == "")
                Country.Text = "Canada";
          
            if (Request.QueryString["Page"] != null)
                Backbtn.Visible = true;
            else
                Backbtn.Visible = false;

        }
      
        protected void submit_Click(object sender, EventArgs e)
        {
           
                if (Shortname.Text != "" && Lname.Text != "" && FName.Text != "")
                {
                    string msg = AddDoctors(Shortname.Text, Lname.Text, FName.Text, HouseNo.Text, HouseQualNo.Text, StrAdd.Text, Unitnum.Text, Province.Text,
                        City.Text, Country.Text, PinCode.Text);
                    if (msg == null)
                        lblMsg.Text = "Record Has Been Added Successfully!";
                    else
                    //lblMsg.Text = "Error -> " + msg;
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "');", true);


                //XmlTextWriter xWriter = new XmlTextWriter(@"C:\Users\kpatel\DoctorDetails.xml",  Encoding.UTF8);
                ////XmlTextWriter xWriter = new XmlTextWriter(Server.MapPath("DoctorDetails.xml"), Encoding.UTF8);
                //xWriter.WriteStartDocument();
                ////Create Parent element
                //xWriter.WriteStartElement("DoctorDetails");
                ////Create Child elements
                //xWriter.WriteStartElement("Details");
                //xWriter.WriteElementString("ShortName", Shortname.Text);
                //xWriter.WriteElementString("LastName", Lname.Text);
                //xWriter.WriteElementString("FisrtName", FName.Text);
                //xWriter.WriteElementString("HouseNumber", HouseNo.Text);
                //xWriter.WriteEndElement();
                ////End writing top element and XML document
                //xWriter.WriteEndElement();
                //xWriter.WriteEndDocument();
                //xWriter.Close();
            }
            else
            {
                lblMsg.Text = "Please fill required filds with valid value!";
                lblMsg.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('"+ lblMsg.Text + "');", true);
            }
            
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // ReadXmlFile(@"C:\Users\kpatel\DoctorDetails.xml");
        }
    protected void ReadXmlFile(string fileName)
    {

        string parentElementName = "";
        string childElementName = "";
        string childElementValue = "";
        bool element = false;
        lblMsg.Text = "";
        XmlTextReader xReader = new XmlTextReader(fileName);

        while (xReader.Read())
            {
                if (xReader.NodeType == XmlNodeType.Element)
                {
                if (element)
                {
                   parentElementName = parentElementName + childElementName + "<br>";
                }
                    element = true;
                    childElementName = xReader.Name;
                }
                else if (xReader.NodeType == XmlNodeType.Text | xReader.NodeType == XmlNodeType.CDATA)
                {
                element = false;
                childElementValue = xReader.Value;
                lblMsg.Text = lblMsg.Text + "<b>" + parentElementName + "<br>" + childElementName + "</b><br>" + childElementValue;
                parentElementName = "";
                childElementName = "";
                }
            }
            xReader.Close();
        }

        protected void Backbtn_Click(object sender, EventArgs e)
        {
        
             Response.Redirect("Deaths.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            if (Searchtext.Text != "")
            {
                SqlConnection con = new SqlConnection(Database.ConnectionString);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SearchDoctors", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Searchstr", Searchtext.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        DocNum.Text = dr["D_Reg_DR_No"].ToString();
                        FName.Text = dr["D_Reg_First_Name"].ToString();
                        Shortname.Text = dr["D_Short_Name"].ToString();
                        Lname.Text = dr["D_Reg_Last_Name"].ToString();
                        HouseNo.Text = dr["D_Reg_House_No"].ToString();
                        HouseQualNo.Text = dr["D_Reg_House_Qual_No"].ToString();
                        StrAdd.Text = dr["D_Reg_St_Name"].ToString();
                        Unitnum.Text = dr["D_Reg_Unit"].ToString();
                        Province.Text = dr["D_Reg_Prov"].ToString();
                        City.Text = dr["D_Reg_City"].ToString();
                        Country.Text = dr["D_Reg_Country"].ToString();
                        PinCode.Text = dr["D_Reg_PC"].ToString();

                    }
                    else
                    {
                        lblMsg.Text = "Record not found!";
                        lblMsg.Visible = false;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "');", true);
                    }
                }
                catch (Exception ex)
                {

                    lblMsg.Text = "Record not found!";
                    lblMsg.Visible = false;
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ex + "');", true);

                }
                finally
                {
                    con.Close();
                }
                DocNum.ReadOnly = true;
                FName.ReadOnly = true;
                Shortname.ReadOnly = true;
                Lname.ReadOnly = true;
                HouseNo.ReadOnly = true;
                HouseQualNo.ReadOnly = true;
                StrAdd.ReadOnly = true;
                Unitnum.ReadOnly = true;
                Province.ReadOnly = true;
                City.ReadOnly = true;
                Country.ReadOnly = true;
                PinCode.ReadOnly = true;
                EditBtn.Visible = true;
                SubmitBtn.Visible = false;
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            DocNum.ReadOnly = false;
            FName.ReadOnly = false;
            Shortname.ReadOnly = false;
            Lname.ReadOnly = false;
            HouseNo.ReadOnly = false;
            HouseQualNo.ReadOnly = false;
            StrAdd.ReadOnly = false;
            Unitnum.ReadOnly = false;
            Province.ReadOnly = false;
            City.ReadOnly = false;
            Country.ReadOnly = false;
            PinCode.ReadOnly = false;
            EditBtn.Visible = false;
            CancelBtn.Visible = true;
            SubmitBtn.Visible = true;
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            DocNum.Text = "";
            FName.Text = "";
            Shortname.Text = "";
            Lname.Text = "";
            HouseNo.Text = "";
            HouseQualNo.Text = "";
            StrAdd.Text = "";
            Unitnum.Text = "";
            Province.Text = "";
            City.Text = "";
            Country.Text = "";
            PinCode.Text = "";
            Searchtext.Text = "";
            DocNum.ReadOnly = false;
            FName.ReadOnly = false;
            Shortname.ReadOnly = false;
            Lname.ReadOnly = false;
            HouseNo.ReadOnly = false;
            HouseQualNo.ReadOnly = false;
            StrAdd.ReadOnly = false;
            Unitnum.ReadOnly = false;
            Province.ReadOnly = false;
            City.ReadOnly = false;
            Country.ReadOnly = false;
            PinCode.ReadOnly = false;
            EditBtn.Visible = false;
            CancelBtn.Visible = false;
            SubmitBtn.Visible = true;
            if (City.Text == "")
                City.Text = "Newmarket";
            if (Province.Text == "")
                Province.Text = "Ontario";
            if (Country.Text == "")
                Country.Text = "Canada";
        }
    }
}