using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Vitals.Models
{
    public class Deaths
    {
        public class Death
        {
            public int D_RegYear { get; set; }
            public string  D_Regtype { get; set; }
            public  int  D_RegNo { get; set; }
            public string D_RegBillable { get; set; }

            [Required(ErrorMessage = "Name is required")]
            public string D_RegFirsName { get; set; }
            public string D_RegLastName { get; set; }
            public string D_RegMiddlename { get; set; }
            public string D_RegHouseNo_D { get; set; }
            public string D_RegHouseQualNo_D { get; set; }
            public string D_RegStName_D { get; set; }
            public string   D_RegUnit_D { get; set; }
            public string   D_RegCity_D { get; set; }
            public string D_RegProv_D { get; set; }
            public string D_RegCountry_D { get; set; }
            public string D_RegPC_D { get; set; }
            public string D_Municipality { get; set; }
            public string D_RegSex { get; set; }
            public DateTime D_RegDied { get; set; }
            public DateTime D_RegDate { get; set; }
            public string D_RegPlaceOfDeath { get; set; }
            public string D_RegHouse_No { get; set; }
            public string D_RegHouseQual_No { get; set; }
            public string D_RegStName { get; set; }
            public string D_RegUnit { get; set; }
            public string D_RegCity { get; set; }
            public string D_RegProv { get; set; }
            public string D_RegCountry { get; set; }
            public string D_RegPC { get; set; }
            public string D_RegFirstName_I { get; set; }
            public string D_RegLastName_I { get; set; }
            public string D_RegMiddlename_I { get; set; }
            public string D_RegHouseNo_I { get; set; }
            public string D_RegHouseQualNo_I { get; set; }
            public string D_RegStName_I { get; set; }
            public string D_RegUnit_I { get; set; }
            public string D_RegCity_I { get; set; }
            public string D_RegProv_I { get; set; }
            public string D_RegCountry_I { get; set; }
            public string D_RegPC_I { get; set; }
            public string D_RegCauseo_Death1 { get; set; }
            public string D_RegCauseof_eath2 { get; set; }
            public Int64 D_RegDrCode { get; set; }
            public Int64 D_RegFuneralCode { get; set; }
	        public  string D_Printed { get; set; }
        }
    }
}