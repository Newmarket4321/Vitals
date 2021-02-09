using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Vitals.Models.FuneralDAL;
namespace Vitals
{
    public partial class Funeral_Home : System.Web.UI.Page
    {
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
        }

        protected void submit_Click(object sender, EventArgs e)
        {

            if (Shortname.Text != "" && FuneralHome.Text != "")
            {
                string msg = AddFuneral(Shortname.Text, FuneralHome.Text, House_No.Text, House_Qual_No.Text, StrAdd.Text, Unitnum.Text, Province.Text,
                    City.Text, Country.Text, Province.Text, PostalCode.Text);
                if (msg == null)
                {

                    lblMsg.Text = "Record Has Been Added Successfully!";
                    lblMsg.Visible = false;
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "');", true);

                }
                else
                {
                    //lblMsg.Text = "Error -> " + msg;
                    ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "');", true);

                }
            }
            else
            {
                lblMsg.Text = "Please fill required filds with valid value!";
                lblMsg.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('"+ lblMsg.Text + "');", true);
            }
        }

        protected void Backbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Deaths.aspx");
        }
    }
}