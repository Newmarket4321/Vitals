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
using static Vitals.Models.FuneralDAL;
using static Vitals.Models.Funerals;
using System.Web.Services;

namespace Vitals
{
    public partial class Vitals_Funeral_Home_Form : System.Web.UI.Page
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
                        SqlCommand cmd = new SqlCommand("GetFuneral", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@F_RegCustomerCnt", Request.QueryString["id"]);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Counter.Text = dr["F_Reg_Customer_Cnt"].ToString();
                            Shortname.Text = dr["F_Reg_Short_Name"].ToString();
                            Acctno.Text = dr["F_Reg_Customer_No"].ToString();
                            FuneralHome.Text = dr["F_Reg_Funeral_Home"].ToString();
                            StrAdd.Text = dr["F_Reg_St_Name"].ToString();
                            House_No.Text = dr["F_Reg_House_No"].ToString();
                            Unitnum.Text = dr["F_Reg_Unit"].ToString();
                            Province.Text = dr["F_Reg_Prov"].ToString();
                            City.Text = dr["F_Reg_City"].ToString();
                            Country.Text = dr["F_Reg_Country"].ToString();
                            PostalCode.Text = dr["F_Reg_PC"].ToString();
                        }
                        else
                        {
                            lblMsg.Text = "Record not found!";
                            lblMsg.Visible = false;
                            ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','warning" + "');", true);
                        }
                    }
                    catch (Exception ex)
                    {

                        lblMsg.Text = "Record not found!";
                        lblMsg.Visible = false;
                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ex + "','warning" + "');", true);

                    }
                    finally
                    {
                        con.Close();
                    }
                    if (Request.QueryString["Mode"] == "Display")
                    {
                        Counter.ReadOnly = true;
                        Shortname.ReadOnly = true;
                        Acctno.ReadOnly = true;
                        FuneralHome.ReadOnly = true;
                        House_No.ReadOnly = true;
                        StrAdd.ReadOnly = true;
                        Unitnum.ReadOnly = true;
                        Province.ReadOnly = true;
                        City.ReadOnly = true;
                        Country.ReadOnly = true;
                        PostalCode.ReadOnly = true;
                        EditBtn.Visible = true;
                        SubmitBtn.Visible = false;
                    }
                    else
                    {
                        Counter.ReadOnly = false;
                        Shortname.ReadOnly = false;
                        Acctno.ReadOnly = false;
                        FuneralHome.ReadOnly = false;
                        House_No.ReadOnly = false;
                        StrAdd.ReadOnly = false;
                        Unitnum.ReadOnly = false;
                        Province.ReadOnly = false;
                        City.ReadOnly = false;
                        Country.ReadOnly = false;
                        PostalCode.ReadOnly = false;
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
                if (hfTab.Value == "tab2")
                    databound();


            }

        }

        protected void databound()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetFuneral", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@F_RegCustomerCnt", "");
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("F_Reg_Customer_Cnt", typeof(int));
                dt.Columns.Add("F_Reg_Short_Name", typeof(string));
                dt.Columns.Add("F_Reg_Funeral_Home", typeof(string));
                dt.Rows.Add("F_Reg_Customer_Cnt", dr["F_Reg_Customer_Cnt"].ToString());
                dt.Rows.Add("F_Reg_Short_Name", dr["F_Reg_Short_Name"].ToString());
                dt.Rows.Add("F_Reg_Funeral_Home", dr["F_Reg_Funeral_Home"].ToString());

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

        }
        protected void submit_Click(object sender, EventArgs e)
        {
            //Response.Write(Request.QueryString["id"]);
            //Response.End();
            if (Request.QueryString["id"] == null)
            {
                if (C_Shortname.Text != "" && C_FuneralHome.Text != "")
                {
                   
                  
                    string msg = AddFuneral(C_Shortname.Text, C_FuneralHome.Text, C_House_No.Text, C_StrAdd.Text, C_Unitnum.Text, C_Province.Text,
                        C_City.Text, C_Country.Text, C_PostalCode.Text, C_Acctno.Text);
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
                    Counter.Text = "";
                    Shortname.Text = "";
                    Acctno.Text = "";
                    StrAdd.Text = "";
                    Unitnum.Text = "";
                    Province.Text = "";
                    City.Text = "";
                    Country.Text = "";
                    PostalCode.Text = "";
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

                if (Shortname.Text != "" && FuneralHome.Text != "")
                {
                    int FuneralCount = int.Parse(Request.QueryString["id"].ToString());
                    string msg = UpdateFuneral(FuneralCount, Shortname.Text, FuneralHome.Text, House_No.Text, StrAdd.Text, Unitnum.Text, Province.Text,
                        City.Text, Country.Text, PostalCode.Text, Acctno.Text);
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
                    Response.Redirect("Vitals_Funeral_Home_Form.aspx?&Restore=tab2");
                }
                else
                {
                    lblMsg.Text = "Please fill required fields with valid value!";
                    lblMsg.Visible = false;

                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "','error" + "');", true);
                }
            }
        }
        protected void SearchFuneral_Click(object sender, EventArgs e)
        {
            Section2.Attributes.Add("style", "display:none");
            grid.Attributes.Add("style", "display:block");
            SubmitBtn.Visible = false;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowno = 0;
            var FN_ID = "";
            if (e.CommandName == "ViewDetails")
            {
                Mode = "Display";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                FN_ID = GridView1.Rows[rowno].Cells[0].Text.ToString();
                //  SearcFuneralHome.Text = "";
                Response.Redirect("Vitals_Funeral_Home_Form.aspx?id=" + FN_ID + "&Restore=tab2&Mode=" + Mode);
            }
            else if (e.CommandName == "Edit")
            {
                Mode = "Edit";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                FN_ID = GridView1.Rows[rowno].Cells[0].Text.ToString();
                // SearcFuneralHome.Text = "";
                Response.Redirect("Vitals_Funeral_Home_Form.aspx?id=" + FN_ID + "&Restore=tab2&Mode=" + Mode);
            }
            else if (e.CommandName == "dlt")
            {
                // Mode = "Delete";
                rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                int FN_ID1 = int.Parse(GridView1.Rows[rowno].Cells[0].Text);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Deaths where D_Reg_Funeral_Code=@Funeral_Code", con);
                cmd.Parameters.AddWithValue("@Funeral_Code", FN_ID1);
                using (SqlDataReader dr1 = cmd.ExecuteReader())
                {
                    if (dr1.Read())
                    {
                        var ermsg = "Funeral Code is in Use. You can not delete this record !";

                        ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ermsg + "','warning" + "');", true);
                    }
                    else
                    {
                        string msg = DeleteFuneral(FN_ID1);
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
        protected void Backbtn_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                Response.Redirect("Vitals_Funeral_Home_Form.aspx?id=" + Request.QueryString["id"] + "&Restore=tab2&Mode=Display");
            }
            else
                Response.Redirect("Vitals_Death_Form.aspx");
        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            Counter.ReadOnly = false;
            Shortname.ReadOnly = false;
            Acctno.ReadOnly = false;
            FuneralHome.ReadOnly = false;
            House_No.ReadOnly = false;
            StrAdd.ReadOnly = false;
            Unitnum.ReadOnly = false;
            Province.ReadOnly = false;
            City.ReadOnly = false;
            Country.ReadOnly = false;
            PostalCode.ReadOnly = false;
            EditBtn.Visible = false;
            CancelBtn.Visible = true;
            SubmitBtn.Visible = true;
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Counter.Text = "";
            Shortname.Text = "";
            Acctno.Text = "";
            StrAdd.Text = "";
            Unitnum.Text = "";
            Province.Text = "";
            City.Text = "";
            Country.Text = "";
            PostalCode.Text = "";
            Counter.ReadOnly = false;
            Shortname.ReadOnly = false;
            Acctno.ReadOnly = false;
            FuneralHome.ReadOnly = false;
            House_No.ReadOnly = false;
            StrAdd.ReadOnly = false;
            Unitnum.ReadOnly = false;
            Province.ReadOnly = false;
            City.ReadOnly = false;
            Country.ReadOnly = false;
            PostalCode.ReadOnly = false;
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.DataBind();
            hfTab.Value = "tab2";
        }
    }
}