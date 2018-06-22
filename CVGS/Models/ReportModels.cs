using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CVGS.Models
{
    [Table("Report")]
    public partial class Report
    {
        [Key]
        public int id { get; set; }
        public int reportTypeId { get; set; }

        [ForeignKey(nameof(reportTypeId))]
        public ReportType Type {get; set;}
    }

    [Table("ReportType")]
    public partial class ReportType
    {
        [Key]
        public int id { get; set; }
        public string type { get; set; }
        [DataType(DataType.Html)]
        public string template { get; set; }
    }
}