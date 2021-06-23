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
using static Vitals.Models.DeathsDAL;
using Vitals.Models;

namespace Vitals
{
    public partial class InsideDeathReport : System.Web.UI.Page
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
              
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Reports\\InsideDeath.rdlc");
                // Assign report parameters.
                Microsoft.Reporting.WebForms.ReportParameter[] parms = new Microsoft.Reporting.WebForms.ReportParameter[4];

                if (Deathyear.Text.ToString() != "")
                    parms[0] = new Microsoft.Reporting.WebForms.ReportParameter("Death_Year", Deathyear.Text.ToString());
                else
                    parms[0] = new Microsoft.Reporting.WebForms.ReportParameter("Death_Year", DateTime.Now.Year.ToString());

                if (MonthFrom.Text.ToString() != "")
                    parms[1] = new Microsoft.Reporting.WebForms.ReportParameter("Month_From", MonthFrom.Text.ToString());
                if (MonthTo.Text.ToString() != "")
                    parms[2] = new Microsoft.Reporting.WebForms.ReportParameter("Month_To", MonthTo.Text.ToString());
                if (Type.Text.ToString() != "")
                    parms[3] = new Microsoft.Reporting.WebForms.ReportParameter("Type", Type.Text.ToString());
                ReportViewer1.LocalReport.SetParameters(parms);

                ReportDataSource rds = new ReportDataSource("Inside_Death", dt);
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }

        private DataTable GetSPResult()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                SqlCommand cmd = new SqlCommand("ReportInsideDeath", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MonthFrom",MonthFrom.Text);
                cmd.Parameters.AddWithValue("@MonthTo", MonthTo.Text);
                cmd.Parameters.AddWithValue("@DeathYear", Deathyear.Text);
                cmd.Parameters.AddWithValue("@Type", Type.Text);
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
            if (Deathyear.Text != "" && MonthFrom.Text != "" && MonthTo.Text != "" && Type.Text != "")
            
                load();
            
            else
            
                ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('Please fill required fields with valid value!','error" + "');", true);
            
        }
    }
}