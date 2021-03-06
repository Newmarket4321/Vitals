﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Vitals.Models;
using static Vitals.Models.DeathsDAL;
using static Vitals.Models.Deaths;
using System.Web.Services;
using System.ComponentModel.DataAnnotations;

namespace Vitals
{
    public partial class A_Test_AdminLTE : System.Web.UI.Page
    {
        public string Mode = "";

        SqlConnection con = new SqlConnection(Database.ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            RegYear.Text = DateTime.Now.Year.ToString();
            regdate.Text = DateTime.Today.ToShortDateString();
            RegType.Text = "I";
            //if (!IsPostBack)
            //    LoadFuneralhome();
            if (!IsPostBack)
            {
                SqlCommand cmd;
                SqlDataReader dr1;
                //con.Open();
                // cmd = new SqlCommand("select * from Deaths where D_Reg_Year=@DRegYear", con);

                ////cmd.Parameters.AddWithValue("@D_RegDRNo", Request.QueryString["id"]);
                //cmd.Parameters.AddWithValue("@DRegYear", DateTime.Now.Year.ToString());
                // dr1 = cmd.ExecuteReader();
                //if (dr1.Read())
                //{
                //    RegNo.Text = dr1["D_Reg_No"].ToString() + 1;
                //}
                //else
                //{

                //    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog(Record not found!,error" + "');", true);
                //}
                //dr1.Close();
                //con.Close();
                Fname.Attributes.Add("onblur", "validate(this.id);");
                if (Request.QueryString["id"] != null)
                {
                    hfTab.Value = Request.QueryString["Restore"];
                    Section2.Attributes.Add("style", "display:block");
                    grid.Attributes.Add("style", "display:none");
                    try
                    {
                        con.Open();
                         cmd = new SqlCommand("GetDeaths", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@D_RegDRNo", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@D_Reg_Year", Request.QueryString["Year"]);
                        cmd.Parameters.AddWithValue("@D_Reg_type", Request.QueryString["Type"]);
                        cmd.Parameters.AddWithValue("@D_Reg_No", Request.QueryString["id"]);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            H_RegYear.Text = dr["D_Reg_Year"].ToString();
                            H_RegType.Text = dr["D_Reg_type"].ToString();
                            H_RegNo.Text = dr["D_Reg_No"].ToString();
                            H_Billable.SelectedItem.Text = dr["D_Reg_Billable"].ToString();
                            H_Fname.Text = dr["D_Reg_First_Name"].ToString();
                            H_Lname.Text = dr["D_Reg_Last_Name"].ToString();
                            H_Mname.Text = dr["D_Reg_Middle_name"].ToString();
                            H_DHouseNo.Text = dr["D_Reg_House_No_D"].ToString();
                            H_DStreet.Text = dr["D_Reg_St_Name_D"].ToString();
                            H_DUnit.Text = dr["D_Reg_Unit_D"].ToString();
                            H_DCity.Text = dr["D_Reg_City_D"].ToString();
                            H_DProvince.Text = dr["D_Reg_Prov_D"].ToString();
                            H_DCountry.Text = dr["D_Reg_Country_D"].ToString();
                            H_DPostalCode.Text = dr["D_Reg_PC_D"].ToString();
                            H_Municipality.Text = dr["D_Municipality"].ToString();
                            H_RegSex.Text = dr["D_Reg_Sex"].ToString();
                            H_DDeath.Text = dr["D_Reg_Died"].ToString();
                            H_RegDate.Text = dr["D_Reg_Date"].ToString();
                            H_PlaceDeath.Text = dr["D_Reg_Place_Of_Death"].ToString();
                            H_HouseNo.Text = dr["D_Reg_House_No"].ToString();
                            H_Street.Text = dr["D_Reg_St_Name"].ToString();
                            H_Unit.Text = dr["D_Reg_Unit"].ToString();
                            H_City.Text = dr["D_Reg_City"].ToString();
                            H_Province.Text = dr["D_Reg_Prov"].ToString();
                            H_Country.Text = dr["D_Reg_Country"].ToString();
                            H_PostalCode.Text = dr["D_Reg_PC"].ToString();
                            if (dr["D_Reg_Dr_Code"].ToString() != "0")
                                H_SearchDoctor.Text = dr["D_Reg_Dr_Code"].ToString();
                            else
                                H_SearchDoctor.Text = "";
                            if (dr["D_Reg_Funeral_Code"].ToString() != "0")
                                H_SearchFuneral.Text = dr["D_Reg_Funeral_Code"].ToString();
                            else
                                H_SearchFuneral.Text = "";
                            H_Printed.SelectedItem.Text = dr["D_Printed"].ToString();
                            H_DR_Code.Value= dr["D_Reg_Dr_Code"].ToString();
                            H_FuneralCode.Value = dr["D_Reg_Funeral_Code"].ToString();

                        }
                        dr.Close();
                        cmd = new SqlCommand("select * from Funeral where F_Reg_Customer_Cnt=@F_RegCustomerCnt", con);

                        //cmd.Parameters.AddWithValue("@D_RegDRNo", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@F_RegCustomerCnt", H_SearchFuneral.Text);
                         dr1 = cmd.ExecuteReader();
                            if (dr1.Read())
                            {
                                H_SearchFuneral.Text= dr1["F_Reg_Funeral_Home"].ToString();
                                H_F_Name.Text = dr1["F_Reg_Funeral_Home"].ToString();
                                H_F_Street.Text = dr1["F_Reg_St_Name"].ToString() + " " + dr1["F_Reg_House_No"].ToString();
                                H_F_Unit.Text = dr1["F_Reg_Unit"].ToString();
                                H_F_CityProv.Text = dr1["F_Reg_City"].ToString() + ", " + dr1["F_Reg_Prov"].ToString();
                            }
                            else
                            {
                            
                                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog(Record not found!,error" + "');", true);
                            }
                            dr1.Close();

                        cmd = new SqlCommand("select * from Doctors where D_Reg_DR_No=@D_RegDRNo", con);
                        cmd.Parameters.AddWithValue("@D_RegDRNo", H_SearchDoctor.Text);
                        dr1 = cmd.ExecuteReader();
                            if (dr1.Read())
                            {
                                H_SearchDoctor.Text= dr1["D_Short_Name"].ToString();
                                H_D_Name.Text = dr1["D_Short_Name"].ToString();
                                H_D_Street.Text = dr1["D_Reg_St_Name"].ToString() + " " + dr1["D_Reg_House_No"].ToString();
                                H_D_Unit.Text = dr1["D_Reg_Unit"].ToString();
                                H_D_CityProv.Text = dr1["D_Reg_City"].ToString() + ", " + dr1["D_Reg_Prov"].ToString();
                            }
                            else
                            {

                                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog(Record not found!,error" + "');", true);
                            }
                            dr1.Close();
                        
                    }
                    catch (Exception ex)
                    {
                        lblMsg.Text = "Record not found!";
                        lblMsg.Visible = false;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ex + "','error" + "');", true);
                    }
                    finally
                    {
                        con.Close();
                    }
                    if (Request.QueryString["Mode"] == "Display")
                    {
                        H_RegYear.ReadOnly = true;
                        H_RegType.ReadOnly = true;
                        H_RegNo.ReadOnly = true;
                        H_Billable.Enabled = false;
                        H_Fname.ReadOnly = true;
                        H_Lname.ReadOnly = true;
                        H_Mname.ReadOnly = true;
                        H_DHouseNo.ReadOnly = true;
                        H_DStreet.ReadOnly = true;
                        H_DUnit.ReadOnly = true;
                        H_DCity.ReadOnly = true;
                        H_DProvince.ReadOnly = true;
                        H_DCountry.ReadOnly = true;
                        H_DPostalCode.ReadOnly = true;
                        H_Municipality.ReadOnly = true;
                        H_RegSex.Enabled = false;
                        H_DDeath.ReadOnly = true;
                        H_RegDate.ReadOnly = true;
                        H_PlaceDeath.ReadOnly = true;
                        H_HouseNo.ReadOnly = true;
                        H_Street.ReadOnly = true;
                        H_Unit.ReadOnly = true;
                        H_City.ReadOnly = true;
                        H_Province.ReadOnly = true;
                        H_Country.ReadOnly = true;
                        H_PostalCode.ReadOnly = true;
                        H_SearchFuneral.ReadOnly = true;
                        H_SearchDoctor.ReadOnly = true;
                        H_F_Name.ReadOnly = true;
                        H_F_Street.ReadOnly = true;
                        H_F_Unit.ReadOnly = true;
                        H_F_CityProv.ReadOnly = true;
                        H_D_Name.ReadOnly = true;
                        H_D_Street.ReadOnly = true;
                        H_D_Unit.ReadOnly = true;
                        H_D_CityProv.ReadOnly = true;
                        H_Printed.Enabled = false;
                        H_Same.Enabled = false;
                        EditBtn.Visible = true;
                        SubmitBtn.Visible = false;
                    }
                    if (Request.QueryString["Mode"] == "Edit")
                    {
                        H_RegYear.ReadOnly = false;
                        H_RegType.ReadOnly = false;
                        H_RegNo.ReadOnly = false;
                        H_Billable.Enabled = true;
                        H_Fname.ReadOnly = false;
                        H_Lname.ReadOnly = false;
                        H_Mname.ReadOnly = false;
                        H_DHouseNo.ReadOnly = false;
                        H_DStreet.ReadOnly = false;
                        H_DUnit.ReadOnly = false;
                        H_DCity.ReadOnly = false;
                        H_DProvince.ReadOnly = false;
                        H_DCountry.ReadOnly = false;
                        H_DPostalCode.ReadOnly = false;
                        H_Municipality.ReadOnly = false;
                        H_RegSex.Enabled = true;
                        H_DDeath.ReadOnly = false;
                        H_RegDate.ReadOnly = false;
                        H_PlaceDeath.ReadOnly = false;
                        H_HouseNo.ReadOnly = false;
                        H_Street.ReadOnly = false;
                        H_Unit.ReadOnly = false;
                        H_City.ReadOnly = false;
                        H_Province.ReadOnly = false;
                        H_Country.ReadOnly = false;
                        H_PostalCode.ReadOnly = false;
                        H_SearchFuneral.ReadOnly = false;
                        H_SearchDoctor.ReadOnly = false;
                        H_F_Name.ReadOnly = false;
                        H_F_Street.ReadOnly = false;
                        H_F_Unit.ReadOnly = false;
                        H_F_CityProv.ReadOnly = false;
                        H_D_Name.ReadOnly = false;
                        H_D_Street.ReadOnly = false;
                        H_D_Unit.ReadOnly = false;
                        H_D_CityProv.ReadOnly = false;
                        H_Printed.Enabled = true;
                        H_Same.Enabled = true;
                        SubmitBtn.Visible = true;
                        CancelBtn.Visible = true;
                        //Backbtn.Visible = true;
                    }
                }

            }
            else
            {
                if (hfTab.Value == "tab2")
                    SubmitBtn.Visible = true;
               
            }
        }
        protected void LoadFuneralhome()
        {
            var funstr = "";
            if (SearcFuneralHome.Text != "")
                funstr = SearcFuneralHome.Text;
            else
                funstr = H_SearchFuneral.Text;
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            // string constr = ConfigurationManager.ConnectionStrings["Vitals"].ConnectionString;

            using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Funeral where " + "F_Reg_Funeral_Home like @Search + '%' OR F_Reg_Short_Name like @Search + '%' OR F_Reg_St_Name like @Search + '%'"))
            {
                cmd.Parameters.AddWithValue("@Search", funstr);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    FuneralGridView.DataSource = ds.Tables[0];
                    FuneralGridView.DataBind();
                    H_FuneralGrid.DataSource = ds.Tables[0];
                    H_FuneralGrid.DataBind();
                }
            }
        }

        protected void LoadDoctor()
        {
            var Doctorstr = "";
            if (SearchDoctor.Text != "")
                Doctorstr = SearchDoctor.Text;
            else
                Doctorstr = H_SearchDoctor.Text;
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Doctors where " + "D_Short_Name like @Search + '%' OR D_Reg_Last_Name like @Search + '%' OR D_Reg_First_Name like @Search + '%'"))
            {
                cmd.Parameters.AddWithValue("@Search", Doctorstr);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);

                    DoctorGrid.DataSource = ds.Tables[0];
                    DoctorGrid.DataBind();
                    H_DoctorGrid.DataSource = ds.Tables[0];
                    H_DoctorGrid.DataBind();
                }
            }
        }
        protected void SearchEvent(object sender, EventArgs e)
        {
            LoadFuneralhome();
        }


        protected void FuneralGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           // ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + e.Row.RowType + "','error" + "');", true);
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;
            e.Row.Cells[0].Style["display"] = "none";
            e.Row.Cells[1].Style["display"] = "none";
           
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';"
            + "this.originalBackgroundColor=this.style.backgroundColor;"
            + "this.style.backgroundColor='#bbbbbb';";

            e.Row.Attributes["onmouseout"] =
            "this.style.backgroundColor=this.originalBackgroundColor;";
           
            e.Row.Attributes["onclick"] =
            ClientScript.GetPostBackClientHyperlink(this.FuneralGridView,
             "Select$" + e.Row.RowIndex);
        }

        protected void FuneralGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            if (FuneralGridView.SelectedRow != null)
            {
                Label Fshortname = (Label)FuneralGridView.SelectedRow.Cells[2].FindControl("L1");
                SearcFuneralHome.Text = Server.HtmlDecode(Fshortname.Text);
                FuneralCode.Value = FuneralGridView.SelectedRow.Cells[1].Text;
                Label FName = (Label)FuneralGridView.SelectedRow.Cells[3].FindControl("L2");
                F_Name.Text = FName.Text;
                Label FAddress = (Label)FuneralGridView.SelectedRow.Cells[4].FindControl("L3");
                F_Street.Text = FAddress.Text;
                Label unit = (Label)FuneralGridView.SelectedRow.Cells[5].FindControl("L4");
                F_Unit.Text = unit.Text;
                Label cityprov = (Label)FuneralGridView.SelectedRow.Cells[6].FindControl("L5");
                F_CityProv.Text = cityprov.Text;
            }
            else
                SearcFuneralHome.Text = "";
        }


        protected void H_FuneralGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;
            e.Row.Cells[0].Style["display"] = "none";
            e.Row.Cells[1].Style["display"] = "none";
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';"
            + "this.originalBackgroundColor=this.style.backgroundColor;"
            + "this.style.backgroundColor='#bbbbbb';";

            e.Row.Attributes["onmouseout"] =
            "this.style.backgroundColor=this.originalBackgroundColor;";

            e.Row.Attributes["onclick"] =
            ClientScript.GetPostBackClientHyperlink(this.H_FuneralGrid,
             "Select$" + e.Row.RowIndex);
        }

        protected void H_FuneralGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (H_FuneralGrid.SelectedRow != null)
            {
                Label Fshortname = (Label)H_FuneralGrid.SelectedRow.Cells[2].FindControl("L11");
                H_SearchFuneral.Text = Server.HtmlDecode(Fshortname.Text);
                H_FuneralCode.Value = H_FuneralGrid.SelectedRow.Cells[1].Text;
                Label FName = (Label)H_FuneralGrid.SelectedRow.Cells[3].FindControl("L12");
                H_F_Name.Text = FName.Text;
                Label FAddress = (Label)H_FuneralGrid.SelectedRow.Cells[4].FindControl("L13");
                H_F_Street.Text = FAddress.Text;
                Label unit = (Label)H_FuneralGrid.SelectedRow.Cells[5].FindControl("L14");
                H_F_Unit.Text = unit.Text;
                Label cityprov = (Label)H_FuneralGrid.SelectedRow.Cells[6].FindControl("L15");
                H_F_CityProv.Text = cityprov.Text;
            }
            else
                H_SearchFuneral.Text = "";
        }

        protected void H_SearchFuneral_TextChanged(object sender, EventArgs e)
        {

            LoadFuneralhome();
        }

        protected void H_DoctorGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;
            e.Row.Cells[0].Style["display"] = "none";
            e.Row.Cells[1].Style["display"] = "none";
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';"
            + "this.originalBackgroundColor=this.style.backgroundColor;"
            + "this.style.backgroundColor='#bbbbbb';";

            e.Row.Attributes["onmouseout"] =
            "this.style.backgroundColor=this.originalBackgroundColor;";

            e.Row.Attributes["onclick"] =
            ClientScript.GetPostBackClientHyperlink(this.H_DoctorGrid,
             "Select$" + e.Row.RowIndex);
        }

        protected void H_DoctorGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (H_DoctorGrid.SelectedRow != null)
            {
                Label Dshortname = (Label)H_DoctorGrid.SelectedRow.Cells[2].FindControl("L16");
                H_SearchDoctor.Text = Server.HtmlDecode(Dshortname.Text);
                H_DR_Code.Value = H_DoctorGrid.SelectedRow.Cells[1].Text;
                Label Dname = (Label)H_DoctorGrid.SelectedRow.Cells[3].FindControl("L17");
                H_D_Name.Text = Dname.Text;
                Label Dstreet = (Label)H_DoctorGrid.SelectedRow.Cells[4].FindControl("L18");
                H_D_Street.Text = Dstreet.Text;
                Label DUnit = (Label)H_DoctorGrid.SelectedRow.Cells[5].FindControl("L19");
                H_D_Unit.Text = DUnit.Text;
                Label DCityprov = (Label)H_DoctorGrid.SelectedRow.Cells[6].FindControl("L20");
                H_D_Street.Text = DCityprov.Text;
            }
            else
                H_SearchDoctor.Text = "";
        }
        protected void SearchDoctor_PreRender(object sender, EventArgs e)
        {
            LoadDoctor();
        }
        protected void SearchDoctorGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow)
                return;
            e.Row.Cells[0].Style["display"] = "none";
            e.Row.Cells[1].Style["display"] = "none";

            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';"
            + "this.originalBackgroundColor=this.style.backgroundColor;"
            + "this.style.backgroundColor='#bbbbbb';";

            e.Row.Attributes["onmouseout"] =
            "this.style.backgroundColor=this.originalBackgroundColor;";

            e.Row.Attributes["onclick"] =
            ClientScript.GetPostBackClientHyperlink(this.DoctorGrid,
             "Select$" + e.Row.RowIndex);
        }

        protected void SearchDoctorGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (DoctorGrid.SelectedRow != null)
            {
                Label Dshortname = (Label)DoctorGrid.SelectedRow.Cells[2].FindControl("L6");
                SearchDoctor.Text = Server.HtmlDecode(Dshortname.Text);
                DoctorCode.Value = DoctorGrid.SelectedRow.Cells[1].Text;
                Label Dname = (Label)DoctorGrid.SelectedRow.Cells[3].FindControl("L7");
                D_Name.Text = Dname.Text;
                Label Dstreet = (Label)DoctorGrid.SelectedRow.Cells[4].FindControl("L8");
                D_Street.Text = Dstreet.Text;
                Label DUnit = (Label)DoctorGrid.SelectedRow.Cells[5].FindControl("L9");
                D_Unit.Text = DUnit.Text;
                Label DCityprov = (Label)DoctorGrid.SelectedRow.Cells[6].FindControl("L10");
                D_CityProv.Text = DCityprov.Text;
            }
            else
                SearchDoctor.Text = "";
        }


        protected void AddFun_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vitals_Funeral_Home_Form.aspx?Page=Funeral_Home");

        }

        protected void AddDoc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vitals_Doctor_Form.aspx?Page=Doctor");
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
              
                if (Fname.Text != "" && DDeath.Text != "")
                {
                    
                    int regyear = int.Parse(RegYear.Text);
                    int regno = int.Parse(RegNo.Text);
                    DateTime dDeath = Convert.ToDateTime(DDeath.Text);
                    DateTime regDate = Convert.ToDateTime(regdate.Text);
                    int DrCode = 0;
                    if (DoctorCode.Value != "")
                        DrCode = int.Parse(DoctorCode.Value);

                    int FunCode =0;
                    if (FuneralCode.Value != "")
                        int.Parse(FuneralCode.Value);
                   
                    string msg = AddDeath(regyear, RegType.Text, regno, Billable.SelectedValue, Fname.Text, Lname.Text, Mname.Text,
                        DHouseNo.Text, DStreet.Text, DUnit.Text, DCity.Text, DProvince.Text, DCountry.Text, DPostalcode.Text,
                        Municipality.Text, sex.SelectedValue, dDeath, regDate, PlaceDeath.Text, HouseNo.Text, Street.Text, Unit.Text, City.Text,
                        Province.Text, Country.Text, Postalcode.Text, DrCode, FunCode, printed.Text);
                    if (msg == null)
                    {

                        lblMsg.Text = "Record Has Been Added Successfully!";
                        lblMsg.Visible = false;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','success" + "');", true);
                        RegType.Text = "";
                        RegNo.Text = ""; 
                        Billable.SelectedValue = ""; 
                        Fname.Text = ""; 
                        Lname.Text = ""; 
                        Mname.Text = "";
                        DHouseNo.Text = ""; 
                        DStreet.Text = ""; 
                        DUnit.Text = ""; 
                        DCity.Text = "";
                        DProvince.Text = "";
                        DCountry.Text = ""; 
                        DPostalcode.Text = "";
                        Municipality.Text = ""; 
                        sex.SelectedValue = "";
                        DDeath.Text = "";
                        regdate.Text = ""; 
                        PlaceDeath.Text = ""; 
                        HouseNo.Text = ""; 
                        Street.Text = ""; 
                        Unit.Text = ""; 
                        City.Text = "";
                        Province.Text = "";
                        Country.Text = ""; 
                        Postalcode.Text = "";
                        DoctorCode.Value = "";
                        FuneralCode.Value = ""; 
                        printed.Text = "";
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','info" + "');", true);

                    }
                }
                else
                {
                    var ermsg = "Please fill required fields with valid value!";
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','error" + "');", true);
                }

            }
            else
            {
                if (H_Fname.Text != "" && H_DDeath.Text != "")
                {
                    int regyear = int.Parse(H_RegYear.Text);
                    int regno = int.Parse(H_RegNo.Text);
                    DateTime dDeath = Convert.ToDateTime(H_DDeath.Text);
                    DateTime regDate = Convert.ToDateTime(H_RegDate.Text);
                    int DrCode = 0;
                    if (H_DR_Code.Value != "")
                        DrCode = int.Parse(H_DR_Code.Value);

                    int FunCode = 0;
                    if (H_FuneralCode.Value != "")
                        FunCode = int.Parse(H_FuneralCode.Value);
                   
                    string msg = UpdateDeath(regyear, H_RegType.Text, regno, H_Billable.SelectedValue, H_Fname.Text, H_Lname.Text, H_Mname.Text,
                        H_DHouseNo.Text, H_DStreet.Text, H_DUnit.Text, H_DCity.Text, H_DProvince.Text, H_DCountry.Text, H_DPostalCode.Text,
                        H_Municipality.Text, H_RegSex.SelectedValue, dDeath, regDate, H_PlaceDeath.Text, H_HouseNo.Text, H_Street.Text, H_Unit.Text, H_City.Text,
                        H_Province.Text, H_Country.Text, H_PostalCode.Text, DrCode, FunCode, printed.Text);
                    if (msg == null)
                    {

                        lblMsg.Text = "Record Has Been Added Successfully!";
                        lblMsg.Visible = false;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','success" + "');", true);
                        Response.Redirect("Vitals_Death_Form.aspx?&Restore=tab2");

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','info" + "');", true);

                    }
                }
                else
                {
                    lblMsg.Text = "Please fill required fields with valid value!";
                    lblMsg.Visible = false;
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','error" + "');", true);
                }

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowno = 0;
            var Death_ID = "";
            var type = "";
            var year = "";

            if (e.CommandName == "ViewDetails")
            {
                Mode = "Display";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                Death_ID = GridView1.Rows[rowno].Cells[0].Text.ToString();
                year = GridView1.Rows[rowno].Cells[1].Text.ToString();
                type = GridView1.Rows[rowno].Cells[2].Text.ToString();
                SearchDeath.Text = "";
                Response.Redirect("Vitals_Death_Form.aspx?id=" + Death_ID + "&Year=" + year + "&Type=" + type + "&Restore=tab2&Mode=" + Mode);

            }
            else if (e.CommandName == "Edit")
            {
                Mode = "Edit";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                Death_ID = GridView1.Rows[rowno].Cells[0].Text.ToString();
                year = GridView1.Rows[rowno].Cells[1].Text.ToString();
                type = GridView1.Rows[rowno].Cells[2].Text.ToString();
                SearchDeath.Text = "";
                Response.Redirect("Vitals_Death_Form.aspx?id=" + Death_ID + "&Year=" + year + "&Type=" + type + "&Restore=tab2&Mode=" + Mode);

            }
            else if (e.CommandName == "dlt")
            {
                // Mode = "Delete";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                Death_ID = GridView1.Rows[rowno].Cells[0].Text.ToString();
                year = GridView1.Rows[rowno].Cells[1].Text.ToString();
                type = GridView1.Rows[rowno].Cells[2].Text.ToString();
                SearchDoctor.Text = "";
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Deaths where D_Reg_Year=@DRegYear and D_Reg_type=@DRegtype and D_Reg_No=@DRegNo", con);
                cmd.Parameters.AddWithValue("@DRegYear", year);
                cmd.Parameters.AddWithValue("@D_Reg_type", type);
                cmd.Parameters.AddWithValue("@D_Reg_No", Death_ID);
                using (SqlDataReader dr1 = cmd.ExecuteReader())
                {
                    if (dr1.Read())
                    {
                        var ermsg = "Doctor name is in Use. You can not delete this record !";

                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','warning" + "');", true);
                    }
                    else
                    {
                        int year1 = 0;
                        int Death_ID1 = 0;
                        string msg = DeleteDeath(year1,type,Death_ID1);
                        if (msg == null)
                        {
                          
                            var ermsg = "Record Has Been Deleted Successfully!";
                            ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','success" + "');", true);

                        }
                        else
                        {
                            //lblMsg.Text = "Error -> " + msg;
                            ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','info" + "');", true);

                        }
                    }
                }
                con.Close();
            }
       
        }

        protected void Search_Death_Click(object sender, EventArgs e)
        {
            Section2.Attributes.Add("style", "display:none");
            grid.Attributes.Add("style", "display:block");
            SubmitBtn.Visible = false;
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            H_RegYear.ReadOnly = true;
            H_RegType.ReadOnly = true;
            H_RegNo.ReadOnly = true;
            H_Billable.Enabled = false;
            H_Fname.ReadOnly = true;
            H_Lname.ReadOnly = true;
            H_Mname.ReadOnly = true;
            H_DHouseNo.ReadOnly = true;
            H_DStreet.ReadOnly = true;
            H_DUnit.ReadOnly = true;
            H_DCity.ReadOnly = true;
            H_DProvince.ReadOnly = true;
            H_DCountry.ReadOnly = true;
            H_DPostalCode.ReadOnly = true;
            H_Municipality.ReadOnly = true;
            H_RegSex.Enabled = false;
            H_DDeath.ReadOnly = true;
            H_RegDate.ReadOnly = true;
            H_PlaceDeath.ReadOnly = true;
            H_HouseNo.ReadOnly = true;
            H_Street.ReadOnly = true;
            H_Unit.ReadOnly = true;
            H_City.ReadOnly = true;
            H_Province.ReadOnly = true;
            H_Country.ReadOnly = true;
            H_PostalCode.ReadOnly = true;
            H_SearchFuneral.ReadOnly = true;
            H_SearchDoctor.ReadOnly = true;
            H_F_Name.ReadOnly = true;
            H_F_Street.ReadOnly = true;
            H_F_Unit.ReadOnly = true;
            H_F_CityProv.ReadOnly = true;
            H_D_Name.ReadOnly = true;
            H_D_Street.ReadOnly = true;
            H_D_Unit.ReadOnly = true;
            H_D_CityProv.ReadOnly = true;
            H_Printed.Enabled = false;
            H_Same.Enabled = false;
            EditBtn.Visible = false;
            CancelBtn.Visible = false;
            SubmitBtn.Visible = false;
            Section2.Attributes.Add("style", "display:none");
            grid.Attributes.Add("style", "display:block");
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            H_RegYear.ReadOnly = false;
            H_RegType.ReadOnly = false;
            H_RegNo.ReadOnly = false;
            H_Billable.Enabled = true;
            H_Fname.ReadOnly = false;
            H_Lname.ReadOnly = false;
            H_Mname.ReadOnly = false;
            H_DHouseNo.ReadOnly = false;
            H_DStreet.ReadOnly = false;
            H_DUnit.ReadOnly = false;
            H_DCity.ReadOnly = false;
            H_DProvince.ReadOnly = false;
            H_DCountry.ReadOnly = false;
            H_DPostalCode.ReadOnly = false;
            H_Municipality.ReadOnly = false;
            H_RegSex.Enabled = true;
            H_DDeath.ReadOnly = false;
            H_RegDate.ReadOnly = false;
            H_PlaceDeath.ReadOnly = false;
            H_HouseNo.ReadOnly = false;
            H_Street.ReadOnly = false;
            H_Unit.ReadOnly = false;
            H_City.ReadOnly = false;
            H_Province.ReadOnly = false;
            H_Country.ReadOnly = false;
            H_PostalCode.ReadOnly = false;
            H_SearchFuneral.ReadOnly = false;
            H_SearchDoctor.ReadOnly = false;
            H_F_Name.ReadOnly = false;
            H_F_Street.ReadOnly = false;
            H_F_Unit.ReadOnly = false;
            H_F_CityProv.ReadOnly = false;
            H_D_Name.ReadOnly = false;
            H_D_Street.ReadOnly = false;
            H_D_Unit.ReadOnly = false;
            H_D_CityProv.ReadOnly = false;
            H_Printed.Enabled = true;
            H_Same.Enabled = true;
            EditBtn.Visible = false;
            SubmitBtn.Visible = true;
            CancelBtn.Visible = true;

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.DataBind();
            hfTab.Value = "tab2";
        }



        //protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        //{
        //    DStreet.Text = Street.Text;
        //}
    }
}