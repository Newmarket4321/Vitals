using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Vitals.Models
{
    public class Database
    {
        static public String ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Vitals"].ConnectionString;
            }
        }
    }
}