using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService
{
    public class Guarantee_record
    {
        [Key]
        public long MessageId { get; set; }
        [Key]
        public long GuarantorId { get; set; }
        public bool Status { get; set; }//担保状态，0：未担保状态，1：在保状态
    }
}
