using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using static Vitals.Models.DoctorsDAL;
using Vitals.Models;

namespace Vitals
{
    public partial class Get_Doctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //    BindGrid();
        }
      

        protected void Search_Click(object sender, EventArgs e)
        {
            //GooToTab("#tab2"); // the tab link
            //if (Searchtext.Text != "")
            //{
            //    SqlConnection con = new SqlConnection(Database.ConnectionString);
            //    try
            //    {
            //        con.Open();
            //        SqlCommand cmd = new SqlCommand("SearchDoctors", con);
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.AddWithValue("@Searchstr", Searchtext.Text);
            //        SqlDataAdapter da = new SqlDataAdapter(cmd);
            //        DataTable dt = new DataTable();
            //        da.Fill(dt);
            //        GridView1.DataSource = dt;
            //        GridView1.DataBind();

            //        //SqlDataReader dr = cmd.ExecuteReader();
            //        //if (dr.Read())
            //        //{
            //        //    da.Fill(dt);
            //        //    GridView1.DataSource = dt;
            //        //    GridView1.DataBind();
            //        //}
            //        //else
            //        //{
            //        //    //lblMsg.Text = "Record not found!";
            //        //    //lblMsg.Visible = false;
            //        //    //ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + lblMsg.Text + "');", true);
            //        //}
            //    }
            //    catch (Exception ex)
            //    {

            //        //lblMsg.Text = "Record not found!";
            //        //lblMsg.Visible = false;
            //        //ClientScript.RegisterStartupScript(GetType(), "script", "showMyDialog('" + ex + "');", true);

            //    }
            //    finally
            //    {
            //        con.Close();
            //    }

            //}
        }
        private void BindGrid()
        {

            string constr = ConfigurationManager.ConnectionStrings["Vitals"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT D_Reg_DR_No, D_Short_Name FROM Doctors"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                             
                            //Button Viewdata = new Button();
                            //Viewdata.ID = dt.Rows[1].ToString();
                            //GridView1.Controls.Add(Viewdata);
                           // GridView1.DataBind();
                        }
                    }

                }
            }
        }
        protected void datagridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked
                Response.Write(rowno);
                //string Short_Name = (string)e.NewValues["D_Short_Name"];
                //string location = (string)e.NewValues["location"];
            }
        }

        
    }
}