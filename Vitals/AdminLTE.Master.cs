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
using System.Web.Services;
namespace Vitals
{
    public partial class AdminLTE : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Environment.UserName;
            con.Open();

            //if (Environment.MachineName == "ITTEMPDT-01-21")
            //    name = "Agoncillo, Marian";

            SqlCommand cmd = new SqlCommand("select displayname from users where username=@NAME",con);
                cmd.Parameters.AddWithValue("@NAME", name);
                SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read()) 
            {
                name = dr1["displayname"].ToString();
             
            }
            else//If not recognized...
            {
                string msg = "User \"" + name + "\" not found. Please contact Admin.";
                // Page.ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + msg + "','warning" + "');", true);
                Response.Write("<script language='javascript'>alert('User \"" + name + "\" not found. Please contact Admin.'); window.close();</script>");
            }
               
                con.Close();
           
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Server Side Code is Executed')</script>");
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Deaths set D_Printed = 'P' where ((D_Reg_Type='O') and (D_Reg_Billable='Y') and (D_Printed='Y')) or ((D_Reg_Type='S') and (D_Reg_Billable='Y') and (D_Printed='Y'))", con);
             
                cmd.ExecuteNonQuery();
                Response.Redirect("Form17_Report.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                }
            }
        }
    }
}