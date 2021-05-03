using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Vitals.Models
{
    public class VitalControlFile
    {
        public class VCFile
        {
            public int VC_CntlLast_I_RegNo { get; set; }
            public int VC_Year_Inside { get; set; }
            public int VC_CntlLast_O_RegNo { get; set; }
            public int VC_Year_Outside { get; set; }
            public int VC_CntlLast_S_RegNo { get; set; }
            public int VC_CntlLast_M_RegNo { get; set; }
            public int VC_CntlLast_B_RegNo { get; set; }
            public int VC_CntlLast_BI_RegNo { get; set; }
            public int VC_Cntl_DeptNo { get; set; }
            public int VC_Cntl_AccNo { get; set; }
            public decimal VC_CntlBur_PermitPrice { get; set; }
            public decimal VC_Residant_Marriage_Licence { get; set; }
            public decimal VC_Non_Residant_Marriage_Licence { get; set; }
            public string VC_Town { get; set; }
            public string VC_Region { get; set; }
            public string VC_ProvShort { get; set; }
            public string VC_RegisterNumber { get; set; }
            public string VC_ApplicationTitle { get; set; }
        }


       
    }
}