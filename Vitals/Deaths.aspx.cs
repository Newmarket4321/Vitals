using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vitals
{
    public partial class Deaths : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddFun_Click(object sender, EventArgs e)
        {
            Response.Redirect("Funeral_Home.aspx?Page=Funeral_Home");

        }

        protected void AddDoc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctors.aspx?Page=Doctor");
        }
    }
}