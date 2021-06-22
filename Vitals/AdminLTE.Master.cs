using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using Vitals.Models;
namespace Vitals
{
    public partial class AdminLTE : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                // SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                // adapter.Fill(ResultsTable);
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