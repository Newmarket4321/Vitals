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
using static Vitals.Models.MarriagesDAL;
using Vitals.Models;
namespace Vitals
{
    public partial class MarriagesApplicationVerification_Reportaspx : System.Web.UI.Page
    {
        DataTable ResultsTable = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void load()
        {
            DataTable dt = GetSPResult();
            try
            {
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.Visible = true;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Reports\\MarriageApplicationVerification.rdlc");
                // Assign report parameters.
                Microsoft.Reporting.WebForms.ReportParameter[] parms = new Microsoft.Reporting.WebForms.ReportParameter[2];

                if (Mrgyear.Text.ToString() != "")
                    parms[0] = new Microsoft.Reporting.WebForms.ReportParameter("MRegYear", Mrgyear.Text.ToString());
                else
                    parms[0] = new Microsoft.Reporting.WebForms.ReportParameter("MRegYear", DateTime.Now.Year.ToString());

                if (MrgNumber.Text.ToString() != "")
                    parms[1] = new Microsoft.Reporting.WebForms.ReportParameter("MRegNumber", MrgNumber.Text.ToString());
               
                ReportViewer1.LocalReport.SetParameters(parms);

                ReportDataSource rds = new ReportDataSource("ApplicationVerification", dt);
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception ex)
            {

            }
        }

        private DataTable GetSPResult()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                SqlCommand cmd = new SqlCommand("ReportMarriageApplicationVerification", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@M_Reg_Year", Mrgyear.Text);
                cmd.Parameters.AddWithValue("@M_Reg_No", MrgNumber.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ResultsTable);
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
            return ResultsTable;
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            if (Mrgyear.Text != "" && MrgNumber.Text != "")

                load();
            else

                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('Please fill required fields with valid value!','error" + "');", true);

        }
    }
}