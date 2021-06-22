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
    public partial class Vitals_Doctor_Form : System.Web.UI.Page
    {
      
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        public string Mode = "";
        public string Attendants = "";
        protected void Page_Load(object sender, EventArgs e)
        {

          
            if (City.Text == "")
                City.Text = "Newmarket";
            if (Province.Text == "")
                Province.Text = "Ontario";
            if (Country.Text == "")
                Country.Text = "Canada";

            if (Request.QueryString["Page"] != null)
                Backbtn.Visible = true;
            else
                Backbtn.Visible = false;

             

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    // ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + Request.QueryString["Mode"] + "','danger" + "');", true);
                    hfTab.Value = Request.QueryString["Restore"];
                    Section2.Attributes.Add("style", "display:block");
                    grid.Attributes.Add("style", "display:none");
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("GetDoctors", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@D_RegDRNo", Request.QueryString["id"]);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {

                            FName.Text = dr["D_Reg_First_Name"].ToString();
                            Shortname.Text = dr["D_Short_Name"].ToString();
                            Lname.Text = dr["D_Reg_Last_Name"].ToString();
                            HouseNo.Text = dr["D_Reg_House_No"].ToString();
                            StrAdd.Text = dr["D_Reg_St_Name"].ToString();
                            Unitnum.Text = dr["D_Reg_Unit"].ToString();
                            Province.Text = dr["D_Reg_Prov"].ToString();
                            City.Text = dr["D_Reg_City"].ToString();
                            Country.Text = dr["D_Reg_Country"].ToString();
                            PinCode.Text = dr["D_Reg_PC"].ToString();
                            if (dr["D_Reg_Attendant"].ToString() == "Doctor")
                                Doctor.Checked = true;
                            else if (dr["D_Reg_Attendant"].ToString() == "Corner")
                                Corner.Checked = true;
                            else if (dr["D_Reg_Attendant"].ToString() == "Other")
                                Other.Checked = true;

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
                    if (Request.QueryString["Mode"] == "Display")
                    {
                        FName.ReadOnly = true;
                        Shortname.ReadOnly = true;
                        Lname.ReadOnly = true;
                        HouseNo.ReadOnly = true;
                        StrAdd.ReadOnly = true;
                        Unitnum.ReadOnly = true;
                        Province.ReadOnly = true;
                        City.ReadOnly = true;
                        Country.ReadOnly = true;
                        PinCode.ReadOnly = true;
                        Doctor.Enabled = false;
                        Corner.Enabled = false;
                        Other.Enabled = false;
                        EditBtn.Visible = true;
                        SubmitBtn.Visible = false;
                    }
                    else
                    {

                        FName.ReadOnly = false;
                        Shortname.ReadOnly = false;
                        Lname.ReadOnly = false;
                        HouseNo.ReadOnly = false;
                        StrAdd.ReadOnly = false;
                        Unitnum.ReadOnly = false;
                        Province.ReadOnly = false;
                        City.ReadOnly = false;
                        Country.ReadOnly = false;
                        PinCode.ReadOnly = false;
                        Doctor.Enabled = true;
                        Corner.Enabled = true;
                        Other.Enabled = true;
                        EditBtn.Visible = false;
                        SubmitBtn.Visible = true;
                        CancelBtn.Visible = true;
                        Backbtn.Visible = true;
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
        protected void submit_Click(object sender, EventArgs e)
        {
            if (Doctor.Checked || C_Doctor.Checked)
                Attendants = Doctor.Text;
            else if (Corner.Checked || C_Corner.Checked)
                Attendants = Corner.Text;
            else if (Other.Checked || C_Other.Checked)
                Attendants = Other.Text;
            else
                Attendants = "";
            if (Request.QueryString["id"] == null)
            {

                if (C_Shortname.Text != "" && C_Lname.Text != "" && C_FName.Text != "")
                {
                    string msg = AddDoctors(C_FName.Text, C_Shortname.Text, C_Lname.Text, C_HouseNo.Text, C_StrAdd.Text, C_Unitnum.Text, C_Province.Text,
                        C_City.Text, C_Country.Text, C_PinCode.Text, Attendants);
                    if (msg == null)
                    {

                        lblMsg.Text = "Record Has Been Added Successfully!";
                        lblMsg.Visible = false;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','success" + "');", true);

                    }
                    else
                    {
                        //lblMsg.Text = "Error -> " + msg;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','info" + "');", true);

                    }
                    C_FName.Text = "";
                    C_Shortname.Text = "";
                    C_Lname.Text = "";
                    C_HouseNo.Text = "";
                    C_StrAdd.Text = "";
                    C_Unitnum.Text = "";
                    C_Province.Text = "";
                    C_City.Text = "";
                    C_Country.Text = "";
                    C_PinCode.Text = "";
                    C_Doctor.Checked = false;
                    C_Corner.Checked = false;
                    C_Other.Checked = false;

                }
                else
                {
                    lblMsg.Text = "Please fill required fields with valid value!";
                    lblMsg.Visible = false;

                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','error" + "');", true);
                }
            }
            else
            {

                if (Shortname.Text != "" && Lname.Text != "" && FName.Text != "")
                {

                    int DrNumber = int.Parse(Request.QueryString["id"].ToString());
                    string msg = UpdateDoctor(DrNumber, FName.Text, Shortname.Text, Lname.Text, HouseNo.Text, StrAdd.Text, Unitnum.Text, Province.Text,
                        City.Text, Country.Text, PinCode.Text, Attendants);
                    if (msg == null)
                    {

                        lblMsg.Text = "Record Has Been Added Successfully!";
                        lblMsg.Visible = false;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','success" + "');", true);

                    }
                    else
                    {
                        //lblMsg.Text = "Error -> " + msg;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','info" + "');", true);

                    }

                }
                else
                {
                    lblMsg.Text = "Please fill required fields with valid value!";
                    lblMsg.Visible = false;

                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','error" + "');", true);
                }
                Response.Redirect("Vitals_Doctor_Form.aspx?&Restore=tab2");
            }
        }
        protected void Backbtn_Click(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                Response.Redirect("Vitals_Doctor_Form.aspx?id=" + Request.QueryString["id"] + "&Restore=tab2&Mode=Display");
            }
            else
                Response.Redirect("Vitals_Death_Form.aspx");
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowno = 0;
            var DR_ID = "";
            if (e.CommandName == "ViewDetails")
            {
                Mode = "Display";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                DR_ID = GridView1.Rows[rowno].Cells[0].Text.ToString();
                SearchDoctors.Text = "";

                Response.Redirect("Vitals_Doctor_Form.aspx?id=" + DR_ID + "&Restore=tab2&Mode=" + Mode);
            }
            else if (e.CommandName == "Edit")
            {
                Mode = "Edit";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                DR_ID = GridView1.Rows[rowno].Cells[0].Text.ToString();
                SearchDoctors.Text = "";

                Response.Redirect("Vitals_Doctor_Form.aspx?id=" + DR_ID + "&Restore=tab2&Mode=" + Mode);
            }
            else if (e.CommandName == "dlt")
            {
                // Mode = "Delete";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                int DR_ID1 = int.Parse(GridView1.Rows[rowno].Cells[0].Text);
                SearchDoctors.Text = "";
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Deaths where D_Reg_Dr_Code=@D_RegDRNo", con);
                cmd.Parameters.AddWithValue("@D_RegDRNo", DR_ID1);
                using (SqlDataReader dr1 = cmd.ExecuteReader())
                {
                    if (dr1.Read())
                    {
                     var ermsg= "Doctor name is in Use. You can not delete this record !";
                       
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','warning" + "');", true);
                    }
                    else
                    {
                        string msg = DeleteDoctor(DR_ID1);
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
        protected void SearchDoc_Click(object sender, EventArgs e)
        {
            Section2.Attributes.Add("style", "display:none");
            grid.Attributes.Add("style", "display:block");
            SubmitBtn.Visible = false;
        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            FName.ReadOnly = false;
            Shortname.ReadOnly = false;
            Lname.ReadOnly = false;
            HouseNo.ReadOnly = false;
            StrAdd.ReadOnly = false;
            Unitnum.ReadOnly = false;
            Province.ReadOnly = false;
            City.ReadOnly = false;
            Country.ReadOnly = false;
            PinCode.ReadOnly = false;
            Doctor.Enabled = true;
            Corner.Enabled = true;
            Other.Enabled = true;
            EditBtn.Visible = false;
            CancelBtn.Visible = true;
            SubmitBtn.Visible = true;
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            FName.Text = "";
            Shortname.Text = "";
            Lname.Text = "";
            HouseNo.Text = "";
            StrAdd.Text = "";
            Unitnum.Text = "";
            Province.Text = "";
            City.Text = "";
            Country.Text = "";
            PinCode.Text = "";
            //Searchtext.Text = "";
            FName.ReadOnly = false;
            Shortname.ReadOnly = false;
            Lname.ReadOnly = false;
            HouseNo.ReadOnly = false;
            StrAdd.ReadOnly = false;
            Unitnum.ReadOnly = false;
            Province.ReadOnly = false;
            City.ReadOnly = false;
            Country.ReadOnly = false;
            PinCode.ReadOnly = false;
            Doctor.Enabled = false;
            Corner.Enabled = false;
            Other.Enabled = false;
            EditBtn.Visible = false;
            CancelBtn.Visible = false;
            SubmitBtn.Visible = false;
            if (City.Text == "")
                City.Text = "Newmarket";
            if (Province.Text == "")
                Province.Text = "Ontario";
            if (Country.Text == "")
                Country.Text = "Canada";
            Section2.Attributes.Add("style", "display:none");
            grid.Attributes.Add("style", "display:block");
        }

      
    }
}