using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Vitals.Models;
using static Vitals.Models.MarriagesDAL;
using System.Web.Services;

namespace Vitals
{
    public partial class Vitals_Marriages_Form : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        public string Mode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            RegYear.Text = DateTime.Now.Year.ToString();
            DateIssued.Text = DateTime.Today.ToShortDateString();
            CertLetter.Text = "G";
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from VitalControlFile", con);
            using (SqlDataReader dr1 = cmd1.ExecuteReader())
                if (dr1.Read())
                {
                    Regno.Text = dr1["Cntl_Last_M_Reg_No"].ToString();
                }
            con.Close();
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter("GetProvinceState", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                da.Fill(ds, "ProvinceState");
                Province1.DataTextField = ds.Tables[0].Columns["Province_Long"].ToString();
                Province1.DataValueField = ds.Tables[0].Columns["ProvShort"].ToString();
                Province1.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                Province1.DataBind();
                Province2.DataTextField = ds.Tables[0].Columns["Province_Long"].ToString();
                Province2.DataValueField = ds.Tables[0].Columns["ProvShort"].ToString();
                Province2.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
                Province2.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    hfTab.Value = Request.QueryString["Restore"];
                    section.Attributes.Add("style", "display:block");
                    grid.Attributes.Add("style", "display:none");
                    try
                    {

                        con.Open();
                        SqlCommand cmd = new SqlCommand("GetMarriage", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@M_Reg_Year", Request.QueryString["year"]);
                        cmd.Parameters.AddWithValue("@M_Reg_No", Request.QueryString["regno"]);
                        cmd.Parameters.AddWithValue("@M_Reg_Letter", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@M_Reg_CertNo", Request.QueryString["certno"]);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            H_RegYear.Text = dr["M_Reg_Year"].ToString();
                            H_Regno.Text = dr["M_Reg_No"].ToString();
                            H_Certletter.Text = dr["M_Reg_Letter"].ToString();
                            H_CertNo.Text = dr["M_Reg_Cert_No"].ToString();
                            if (dr["M_Reg_Address_Same"].ToString() == "Y")
                                H_Same.Checked = true;
                            else
                                H_Same.Checked = false;
                            H_JointFirstname.Text = dr["M_Reg_First_Name_F"].ToString();
                            H_JointLastname.Text = dr["M_Reg_Last_Name_F"].ToString();
                            H_JointMiddlename.Text = dr["M_Reg_Middle_name_F"].ToString();
                            H_Joint_House_No.Text = dr["M_Reg_House_No_F"].ToString();
                            H_Street2.Text = dr["M_Reg_St_Name_F"].ToString();
                            H_Apt2.Text = dr["M_Reg_Unit_F"].ToString();
                            H_City2.Text = dr["M_Reg_City_F"].ToString();
                            H_Province2.Text = dr["M_Reg_Prov_F"].ToString();
                            H_Country2.Text = dr["M_Reg_Country_F"].ToString();
                            H_Pin2.Text = dr["M_Reg_PC_F"].ToString();
                            H_Fname.Text = dr["M_Reg_First_Name_M"].ToString();
                            H_Lname.Text = dr["M_Reg_Last_Name_M"].ToString();
                            H_Mname.Text = dr["M_Reg_Middle_name_M"].ToString();
                            H_House_No.Text = dr["M_Reg_House_No_M"].ToString();
                            H_Street.Text = dr["M_Reg_St_Name_M"].ToString();
                            H_Apt.Text = dr["M_Reg_Unit_M"].ToString();
                            H_City.Text = dr["M_Reg_City_M"].ToString();
                            H_Province1.Text = dr["M_Reg_Prov_M"].ToString();
                            H_Country.Text = dr["M_Reg_Country_M"].ToString();
                            H_Postalcode.Text = dr["M_Reg_PC_M"].ToString();
                            H_DateIssued.Text = dr["M_Reg_Issued"].ToString();
                            H_CityofMarriage.Text = dr["M_Reg_Place_Of_Marriage"].ToString();
                            H_MarriageDate.Text = dr["M_Reg_Date_Of_Marriage"].ToString();
                            H_JointStatus.SelectedItem.Text = dr["M_Marriage_Status_F"].ToString();
                            H_JointCourtFile.Text = dr["M_Reg_Court_File_No_F"].ToString();
                            H_JointCity.Text = dr["M_Reg_Mun_Granted_F"].ToString();
                            H_JointDOB.Text = dr["M_Reg_DOB_F"].ToString();
                            H_JointReligion.Text = dr["M_Reg_Religion_F"].ToString();
                            H_JointAge.Text = dr["M_Reg_Age_F"].ToString();
                            H_JointProvinceBirth.Text = dr["M_Reg_Place_Of_Birth_F"].ToString();
                            H_MaritalStatus.SelectedItem.Text = dr["M_Marriage_Status_M"].ToString();
                            H_CourtFileNo.Text = dr["M_Reg_Court_File_No_M"].ToString();
                            H_CityGranted.Text = dr["M_Reg_Mun_Granted_M"].ToString();
                            H_DBirth.Text = dr["M_Reg_DOB_M"].ToString();
                            H_Religion.Text = dr["M_Reg_Religion_M"].ToString();
                            H_Age.Text = dr["M_Reg_Age_M"].ToString();
                            H_Phone2.Text = dr["M_Reg_TelePhone_No_F"].ToString();
                            H_Phone.Text = dr["M_Reg_Telephone_No_M"].ToString();
                            var applicant = "";
                            if (dr["M_Reg_Applicant"].ToString() == "1")
                            { applicant = "Applicant"; }
                            else if (dr["M_Reg_Applicant"].ToString() == "2")
                            { applicant = "Joint Applicant"; }
                            else if (dr["M_Reg_Applicant"].ToString() == "3")
                            { applicant = "Other"; }
                            else
                            {
                                applicant = dr["M_Reg_Applicant"].ToString();
                            }

                            H_Applicant.SelectedItem.Text = applicant;
                            H_ProvinceofBirth.Text = dr["M_Reg_Place_Of_Birth_M"].ToString();
                            H_CountryofDivorce.Text = dr["M_Reg_Country_Granted_F"].ToString();
                            H_JointCountryDivorce.Text = dr["M_Reg_Country_Granted_M"].ToString();

                            H_P1FName1.Text = dr["M_Reg_POP_First_Name_F"].ToString();
                            H_P1LName1.Text = dr["M_Reg_POP_Last_Name_F"].ToString();
                            H_P1BirthProvince1.Text = dr["M_Reg_POP_Prov_F"].ToString();

                            H_P2FName2.Text = dr["M_Reg_MOM_First_Name_F"].ToString();
                            H_P2LName2.Text = dr["M_Reg_MOM_Last_Name_F"].ToString();
                            H_P2BirthProvince2.Text = dr["M_Reg_MOM_Prov_F"].ToString();

                            H_P3FName3.Text = dr["M_Reg_POP_First_Name_Sur_F"].ToString();
                            H_P3LName3.Text = dr["M_Reg_POP_Last_Name_Sur_F"].ToString();
                            H_P3BirthProvince3.Text = dr["M_Reg_POP_Prov_Sur_F"].ToString();

                            H_P4FName4.Text = dr["M_Reg_MOM_First_Name_Sur_F"].ToString();
                            H_P4LName4.Text = dr["M_Reg_MOM_Last_Name_Sur_F"].ToString();
                            H_P4BirthProvince4.Text = dr["M_Reg_MOM_Prov_Sur_F"].ToString();

                            H_P1FName.Text = dr["M_Reg_POP_First_Name_M"].ToString();
                            H_P1LName.Text = dr["M_Reg_POP_Last_Name_M"].ToString();
                            H_P1BirthProvince.Text = dr["M_Reg_POP_Prov_M"].ToString();

                            H_P2FName.Text = dr["M_Reg_MOM_First_Name_M"].ToString();
                            H_P2LName.Text = dr["M_Reg_MOM_Last_Name_M"].ToString();
                            H_P2BirthProvince.Text = dr["M_Reg_MOM_Prov_M"].ToString();


                            H_P3FName.Text = dr["M_Reg_POP_First_Name_Sur_M"].ToString();
                            H_P3LName.Text = dr["M_Reg_POP_Last_Name_Sur_M"].ToString();
                            H_P3BirthProvince.Text = dr["M_Reg_POP_Prov_Sur_M"].ToString();

                            H_P4FName.Text = dr["M_Reg_MOM_First_Name_Sur_M"].ToString();
                            H_P4LName.Text = dr["M_Reg_MOM_Last_Name_Sur_M"].ToString();
                            H_P4BirthProvince.Text = dr["M_Reg_MOM_Prov_Sur_M"].ToString();

                        }
                        else
                        {
                            string msg = "Record not found!";

                            ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "');", true);
                        }
                    }

                    catch (Exception ex)
                    {

                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ex + "');", true);

                    }
                    finally
                    {
                        con.Close();
                    }
                    if (Request.QueryString["Mode"] == "Display")
                    {
                        H_RegYear.ReadOnly = true;
                        H_Regno.ReadOnly = true;
                        H_Certletter.ReadOnly = true;
                        H_CertNo.ReadOnly = true;
                        H_JointFirstname.ReadOnly = true;
                        H_JointLastname.ReadOnly = true;
                        H_JointMiddlename.ReadOnly = true;
                        H_Joint_House_No.ReadOnly = true;
                        H_Same.Enabled = false;
                        H_Street2.ReadOnly = true;
                        H_Apt2.ReadOnly = true;
                        H_City2.ReadOnly = true;
                        H_Province2.Enabled = false;
                        H_Country2.ReadOnly = true;
                        H_Pin2.ReadOnly = true;
                        H_Fname.ReadOnly = true;
                        H_Lname.ReadOnly = true;
                        H_Mname.ReadOnly = true;
                        H_House_No.ReadOnly = true;
                        H_Street.ReadOnly = true;
                        H_Apt.ReadOnly = true;
                        H_City.ReadOnly = true;
                        H_Province1.Enabled = false;
                        H_Country.ReadOnly = true;
                        H_Postalcode.ReadOnly = true;
                        H_DateIssued.ReadOnly = true;
                        H_CityofMarriage.ReadOnly = true;
                        H_MarriageDate.ReadOnly = true;
                        H_JointStatus.Enabled = false;
                        H_JointCourtFile.ReadOnly = true;
                        H_JointCity.ReadOnly = true;
                        H_JointDOB.ReadOnly = true;
                        H_JointReligion.ReadOnly = true;
                        H_JointAge.ReadOnly = true;
                        H_JointProvinceBirth.ReadOnly = true;
                        H_MaritalStatus.Enabled = false;
                        H_CourtFileNo.ReadOnly = true;
                        H_CityGranted.ReadOnly = true;
                        H_DBirth.ReadOnly = true;
                        H_Religion.ReadOnly = true;
                        H_Age.ReadOnly = true;
                        H_Phone2.ReadOnly = true;
                        H_Phone.ReadOnly = true;
                        H_Applicant.Enabled = false;
                        H_ProvinceofBirth.ReadOnly = true;
                        H_CountryofDivorce.ReadOnly = true;
                        H_JointCountryDivorce.ReadOnly = true;
                        H_P1FName1.ReadOnly = true;
                        H_P1LName1.ReadOnly = true;
                        H_P1BirthProvince1.ReadOnly = true;
                        H_P2FName2.ReadOnly = true;
                        H_P2LName2.ReadOnly = true;
                        H_P2BirthProvince2.ReadOnly = true;
                        H_P3FName3.ReadOnly = true;
                        H_P3LName3.ReadOnly = true;
                        H_P3BirthProvince3.ReadOnly = true;
                        H_P4FName4.ReadOnly = true;
                        H_P4LName4.ReadOnly = true;
                        H_P4BirthProvince4.ReadOnly = true;
                        H_P1FName.ReadOnly = true;
                        H_P1LName.ReadOnly = true;
                        H_P1BirthProvince.ReadOnly = true;
                        H_P2FName.ReadOnly = true;
                        H_P2LName.ReadOnly = true;
                        H_P2BirthProvince.ReadOnly = true;
                        H_P3FName.ReadOnly = true;
                        H_P3LName.ReadOnly = true;
                        H_P3BirthProvince.ReadOnly = true;
                        H_P4FName.ReadOnly = true;
                        H_P4LName.ReadOnly = true;
                        H_P4BirthProvince.ReadOnly = true;

                        EditBtn.Visible = true;
                        SubmitBtn.Visible = false;
                    }
                    else
                    {
                        H_RegYear.ReadOnly = true;
                        H_Regno.ReadOnly = false;
                        H_Certletter.ReadOnly = false;
                        H_CertNo.ReadOnly = false;
                        H_JointFirstname.ReadOnly = false;
                        H_JointLastname.ReadOnly = false;
                        H_JointMiddlename.ReadOnly = false;
                        H_Joint_House_No.ReadOnly = false;
                        H_Same.Enabled = true;
                        H_Street2.ReadOnly = false;
                        H_Apt2.ReadOnly = false;
                        H_City2.ReadOnly = false;
                        H_Province2.Enabled = true;
                        H_Country2.ReadOnly = false;
                        H_Pin2.ReadOnly = false;
                        H_Fname.ReadOnly = false;
                        H_Lname.ReadOnly = false;
                        H_Mname.ReadOnly = false;
                        H_House_No.ReadOnly = false;
                        H_Street.ReadOnly = false;
                        H_Apt.ReadOnly = false;
                        H_City.ReadOnly = false;
                        H_Province1.Enabled = true;
                        H_Country.ReadOnly = false;
                        H_Postalcode.ReadOnly = false;
                        H_DateIssued.ReadOnly = false;
                        H_CityofMarriage.ReadOnly = false;
                        H_MarriageDate.ReadOnly = false;
                        H_JointStatus.Enabled = true;
                        H_JointCourtFile.ReadOnly = false;
                        H_JointCity.ReadOnly = false;
                        H_JointDOB.ReadOnly = false;
                        H_JointReligion.ReadOnly = false;
                        H_JointAge.ReadOnly = false;
                        H_JointProvinceBirth.ReadOnly = false;
                        H_MaritalStatus.Enabled = true;
                        H_CourtFileNo.ReadOnly = false;
                        H_CityGranted.ReadOnly = false;
                        H_DBirth.ReadOnly = false;
                        H_Religion.ReadOnly = false;
                        H_Age.ReadOnly = false;
                        H_Phone2.ReadOnly = false;
                        H_Phone.ReadOnly = false;
                        H_Applicant.Enabled = true;
                        H_ProvinceofBirth.ReadOnly = false;
                        H_CountryofDivorce.ReadOnly = false;
                        H_JointCountryDivorce.ReadOnly = false;
                        H_P1FName1.ReadOnly = false;
                        H_P1LName1.ReadOnly = false;
                        H_P1BirthProvince1.ReadOnly = false;
                        H_P2FName2.ReadOnly = false;
                        H_P2LName2.ReadOnly = false;
                        H_P2BirthProvince2.ReadOnly = false;
                        H_P3FName3.ReadOnly = false;
                        H_P3LName3.ReadOnly = false;
                        H_P3BirthProvince3.ReadOnly = false;
                        H_P4FName4.ReadOnly = false;
                        H_P4LName4.ReadOnly = false;
                        H_P4BirthProvince4.ReadOnly = false;
                        H_P1FName.ReadOnly = false;
                        H_P1LName.ReadOnly = false;
                        H_P1BirthProvince.ReadOnly = false;
                        H_P2FName.ReadOnly = false;
                        H_P2LName.ReadOnly = false;
                        H_P2BirthProvince.ReadOnly = false;
                        H_P3FName.ReadOnly = false;
                        H_P3LName.ReadOnly = false;
                        H_P3BirthProvince.ReadOnly = false;
                        H_P4FName.ReadOnly = false;
                        H_P4LName.ReadOnly = false;
                        H_P4BirthProvince.ReadOnly = false;

                        EditBtn.Visible = false;
                        SubmitBtn.Visible = true;
                        CancelBtn.Visible = true;
                        Backbtn.Visible = false;
                    }
                }
                if (Request.QueryString["Restore"] != "")
                {
                    hfTab.Value = Request.QueryString["Restore"];
                    grid.Attributes.Add("style", "display:block");
                }

            }
            else
            {
                if (hfTab.Value == "tab1")
                    SubmitBtn.Visible = true;
            }

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowno = 0;
            var year = "";
            var Regno = "";
            var letter = "";
            var certno = "";
            if (e.CommandName == "ViewDetails")
            {
                Mode = "Display";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                year = GridView1.Rows[rowno].Cells[0].Text.ToString();
                Regno = GridView1.Rows[rowno].Cells[1].Text.ToString();
                letter = GridView1.Rows[rowno].Cells[2].Text.ToString();
                certno = GridView1.Rows[rowno].Cells[3].Text.ToString();
                SearchApplicants.Text = "";
            }
            else if (e.CommandName == "Edit")
            {
                Mode = "Edit";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                year = GridView1.Rows[rowno].Cells[0].Text.ToString();
                Regno = GridView1.Rows[rowno].Cells[1].Text.ToString();
                letter = GridView1.Rows[rowno].Cells[2].Text.ToString();
                certno = GridView1.Rows[rowno].Cells[3].Text.ToString();
                SearchApplicants.Text = "";
            }
            Response.Redirect("Vitals_Marragies_Form.aspx?id=" + letter + "&certno=" + certno + "&year=" + year + "&regno=" + Regno + "&Restore=tab2&Mode=" + Mode);
        }

        protected void SearchApp_Click(object sender, EventArgs e)
        {
            section.Attributes.Add("style", "display:none");
            grid.Attributes.Add("style", "display:block");
            SubmitBtn.Visible = false;
        }
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                if (CertNo.Text != "" && CertLetter.Text != "" && DateIssued.Text != "" && Regno.Text != "" &&
                    MarriageDate.Text != "" && Fname.Text != "" && Lname.Text != "")
                {
                    int regyear = int.Parse(RegYear.Text);
                    int regno = int.Parse(Regno.Text);
                    int certno = int.Parse(CertNo.Text);
                    int jointage = int.Parse(JointAge.Text);
                    int age = int.Parse(Age.Text);
                    DateTime DIssued = Convert.ToDateTime(DateIssued.Text);
                    DateTime MrgDate = DateTime.Parse(MarriageDate.Text);
                    DateTime Joint_DOB = Convert.ToDateTime(JointDOB.Text);
                    DateTime D_Birth = Convert.ToDateTime(DBirth.Text);
                    string msg = AddMarriages(regyear, regno, CertLetter.Text, certno,
                        Same.Checked.ToString(), JointFirstname.Text, JointLastname.Text, JointMiddlename.Text, Joint_House_No.Text, Street2.Text,
                        Apt2.Text, City2.Text, Province2.Text, Country2.Text, Pin2.Text, Fname.Text, Lname.Text, Mname.Text, House_No.Text,
                        Street.Text, Apt.Text, City.Text, Province1.Text, Country.Text, Postalcode.Text, DIssued,
                        CityofMarriage.Text, MrgDate, JointStatus.SelectedItem.Text,
                        JointCourtFile.Text, JointCity.Text, Joint_DOB, JointReligion.Text, jointage,
                        JointProvinceBirth.Text, P1FName1.Text, P1LName1.Text, P1BirthProvince1.Text, P2FName2.Text, P2LName2.Text,
                        P2BirthProvince2.Text, MaritalStatus.SelectedItem.Text, CourtFileNo.Text, CityGranted.Text, D_Birth,
                        Religion.Text, age, ProvinceofBirth.Text, P1FName.Text, P1LName.Text, P1BirthProvince.Text,
                        P2FName.Text, P2LName.Text, P2BirthProvince.Text, Phone2.Text, Phone.Text, Applicant.SelectedItem.Text,
                        P3FName3.Text, P3LName3.Text, P3BirthProvince3.Text, P4FName4.Text, P4LName4.Text, P4BirthProvince4.Text,
                        P3FName.Text, P3LName.Text, P3BirthProvince.Text, P4FName.Text, P4LName.Text, P4BirthProvince.Text,
                        CountryofDivorce.Text, JointCountryDivorce.Text);
                    if (msg == null)
                    {
                        var ermsg = "Record Has Been Added Successfully!";

                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','success" + "');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','info" + "');", true);

                    }
                    // Response.Redirect("Vitals_Marragies_Form.aspx");
                }
                else
                {
                    var ermsg = "Please fill required fields with valid value!";
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','error" + "');", true);

                }
            }
            else
            {
                if (H_CertNo.Text != "" && H_Certletter.Text != "" && H_DateIssued.Text != "" && H_Regno.Text != "" &&
                   H_MarriageDate.Text != "" && H_Fname.Text != "" && H_Lname.Text != "")
                {
                    int h_regyear = int.Parse(H_RegYear.Text);
                    int h_regno = int.Parse(H_Regno.Text);
                    int h_certno = int.Parse(H_CertNo.Text);
                    int h_jointage = int.Parse(H_JointAge.Text);
                    int h_age = int.Parse(H_Age.Text);
                    DateTime DIssued = Convert.ToDateTime(H_DateIssued.Text);
                    DateTime MrgDate = Convert.ToDateTime(H_MarriageDate.Text);
                    DateTime Joint_DOB = Convert.ToDateTime(H_JointDOB.Text);
                    DateTime D_Birth = Convert.ToDateTime(H_DBirth.Text);

                    string msg = UpdateMarrigaes(h_regyear, h_regno, H_Certletter.Text, h_certno,
                           H_Same.Checked.ToString(), H_JointFirstname.Text, H_JointLastname.Text, H_JointMiddlename.Text, H_Joint_House_No.Text, H_Street2.Text,
                           H_Apt2.Text, H_City2.Text, H_Province2.Text, H_Country2.Text, H_Pin2.Text, H_Fname.Text, H_Lname.Text, H_Mname.Text, H_House_No.Text,
                           H_Street.Text, H_Apt.Text, H_City.Text, H_Province1.Text, H_Country.Text, H_Postalcode.Text, DIssued,
                           H_CityofMarriage.Text, MrgDate, H_JointStatus.SelectedItem.Text,
                           H_JointCourtFile.Text, H_JointCity.Text, Joint_DOB, H_JointReligion.Text, h_jointage,
                           H_JointProvinceBirth.Text, H_P1FName1.Text, H_P1LName1.Text, H_P1BirthProvince1.Text, H_P2FName2.Text, H_P2LName2.Text,
                           H_P2BirthProvince2.Text, H_MaritalStatus.SelectedItem.Text, H_CourtFileNo.Text, H_CityGranted.Text, D_Birth,
                           H_Religion.Text, h_age, H_ProvinceofBirth.Text, H_P1FName.Text, H_P1LName.Text, H_P1BirthProvince.Text,
                           H_P2FName.Text, H_P2LName.Text, H_P2BirthProvince.Text, H_Phone2.Text, H_Phone.Text, H_Applicant.SelectedItem.Text,
                           H_P3FName3.Text, H_P3LName3.Text, H_P3BirthProvince3.Text, H_P4FName4.Text, H_P4LName4.Text, H_P4BirthProvince4.Text,
                           H_P3FName.Text, H_P3LName.Text, H_P3BirthProvince.Text, H_P4FName.Text, H_P4LName.Text, H_P4BirthProvince.Text,
                           H_CountryofDivorce.Text, H_JointCountryDivorce.Text);
                    if (msg == null)
                    {
                        var ermsg = "Record Has Been Added Successfully!";

                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','success" + "');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','info" + "');", true);

                    }
                    Response.Redirect("Vitals_Marragies_Form.aspx?&Restore=tab2");
                }
                else
                {
                    var ermsg = "Please fill required fields with valid value!";
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','error" + "');", true);

                }
            }
        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            H_RegYear.ReadOnly = true;
            H_Regno.ReadOnly = false;
            H_Certletter.ReadOnly = false;
            H_CertNo.ReadOnly = false;
            H_JointFirstname.ReadOnly = false;
            H_JointLastname.ReadOnly = false;
            H_JointMiddlename.ReadOnly = false;
            H_Joint_House_No.ReadOnly = false;
            H_Same.Enabled = true;
            H_Street2.ReadOnly = false;
            H_Apt2.ReadOnly = false;
            H_City2.ReadOnly = false;
            H_Province2.Enabled = true;
            H_Country2.ReadOnly = false;
            H_Pin2.ReadOnly = false;
            H_Fname.ReadOnly = false;
            H_Lname.ReadOnly = false;
            H_Mname.ReadOnly = false;
            H_House_No.ReadOnly = false;
            H_Street.ReadOnly = false;
            H_Apt.ReadOnly = false;
            H_City.ReadOnly = false;
            H_Province1.Enabled = true;
            H_Country.ReadOnly = false;
            H_Postalcode.ReadOnly = false;
            H_DateIssued.ReadOnly = false;
            H_CityofMarriage.ReadOnly = false;
            H_MarriageDate.ReadOnly = false;
            H_JointStatus.Enabled = true;
            H_JointCourtFile.ReadOnly = false;
            H_JointCity.ReadOnly = false;
            H_JointDOB.ReadOnly = false;
            H_JointReligion.ReadOnly = false;
            H_JointAge.ReadOnly = false;
            H_JointProvinceBirth.ReadOnly = false;
            H_MaritalStatus.Enabled = true;
            H_CourtFileNo.ReadOnly = false;
            H_CityGranted.ReadOnly = false;
            H_DBirth.ReadOnly = false;
            H_Religion.ReadOnly = false;
            H_Age.ReadOnly = false;
            H_Phone2.ReadOnly = false;
            H_Phone.ReadOnly = false;
            H_Applicant.Enabled = true;
            H_ProvinceofBirth.ReadOnly = false;
            H_CountryofDivorce.ReadOnly = false;
            H_JointCountryDivorce.ReadOnly = false;
            H_P1FName1.ReadOnly = false;
            H_P1LName1.ReadOnly = false;
            H_P1BirthProvince1.ReadOnly = false;
            H_P2FName2.ReadOnly = false;
            H_P2LName2.ReadOnly = false;
            H_P2BirthProvince2.ReadOnly = false;
            H_P3FName3.ReadOnly = false;
            H_P3LName3.ReadOnly = false;
            H_P3BirthProvince3.ReadOnly = false;
            H_P4FName4.ReadOnly = false;
            H_P4LName4.ReadOnly = false;
            H_P4BirthProvince4.ReadOnly = false;
            H_P1FName.ReadOnly = false;
            H_P1LName.ReadOnly = false;
            H_P1BirthProvince.ReadOnly = false;
            H_P2FName.ReadOnly = false;
            H_P2LName.ReadOnly = false;
            H_P2BirthProvince.ReadOnly = false;
            H_P3FName.ReadOnly = false;
            H_P3LName.ReadOnly = false;
            H_P3BirthProvince.ReadOnly = false;
            H_P4FName.ReadOnly = false;
            H_P4LName.ReadOnly = false;
            H_P4BirthProvince.ReadOnly = false;


            EditBtn.Visible = false;
            CancelBtn.Visible = true;
            SubmitBtn.Visible = true;
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            EditBtn.Visible = false;
            CancelBtn.Visible = false;
            SubmitBtn.Visible = false;
            section.Attributes.Add("style", "display:none");
            grid.Attributes.Add("style", "display:block");
        }

    }
}