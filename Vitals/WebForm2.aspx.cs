﻿using System;
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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //write your code here
        }

        protected void btnSelectTab2_Click(object sender, EventArgs e)
        {
            hfTab.Value = "tab2";
        }

        protected void btnSelectTab3_Click(object sender, EventArgs e)
        {
           // hfTab.Value = "tab3";
        }
        protected void Search_Click(object sender, EventArgs e)
        {
           
        }
        protected void datagridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int rowno = Int32.Parse(e.CommandArgument.ToString()); // It is the rowno of which the user as clicked

            }
        }

    }
}