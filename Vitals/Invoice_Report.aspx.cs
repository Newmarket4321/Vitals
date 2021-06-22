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
    public partial class Invoice_Report : System.Web.UI.Page
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
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Reports\\Invoice.rdlc");
                // Assign report parameters.
                Microsoft.Reporting.WebForms.ReportParameter[] parms = new Microsoft.Reporting.WebForms.ReportParameter[3];

                if (StartDate.Text.ToString() != "")
                    parms[0] = new Microsoft.Reporting.WebForms.ReportParameter("StartDate", StartDate.Text.ToString());
                

                if (EndDate.Text.ToString() != "")
                    parms[1] = new Microsoft.Reporting.WebForms.ReportParameter("EndDate", EndDate.Text.ToString());

                if (SigninName.Text.ToString() != "")
                    parms[2] = new Microsoft.Reporting.WebForms.ReportParameter("SigninName", SigninName.Text.ToString());

                ReportViewer1.LocalReport.SetParameters(parms);

                ReportDataSource rds = new ReportDataSource("Invoice", dt);
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
                SqlCommand cmd = new SqlCommand("ReportInvoice", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StartDate", StartDate.Text);
                cmd.Parameters.AddWithValue("@EndDate", EndDate.Text);
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
            load();

        }
    }
}