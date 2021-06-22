using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vitals.Models
{
    public class Doctors
    {
        public class Doctor
        {

        public int D_RegDRNo { get; set; }
         public  string D_ShortName { get; set; }
        public string D_RegLastName { get; set; }
        public string D_RegFirstName { get; set; }
        public string D_RegHouseNo { get; set; }
        public string D_RegHouseQualNo { get; set; }
        public string D_RegStName { get; set; }
        public string D_RegUnit { get; set; }
        public string D_RegCity { get; set; }
        public string D_RegProv { get; set; }
        public string D_RegCountry { get; set; }
        public string D_RegPC { get; set; }
        public string Search_String { get; set; }
        public string D_RegAttendant { get; set; }
        }
    }
}