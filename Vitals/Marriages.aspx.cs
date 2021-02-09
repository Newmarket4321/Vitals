using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Vitals.Models;
namespace Vitals
{
    public partial class Marriages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           Regno.Text = DateTime.Now.Year.ToString();

            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(Database.ConnectionString);
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
            }

        }
    }
}