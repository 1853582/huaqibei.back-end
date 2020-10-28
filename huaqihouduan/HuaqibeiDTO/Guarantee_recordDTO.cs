using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiDTO
{
    public class Guarantee_recordDTO
    {
        public long MessageId { get; set; }
        public long GuarantorId { get; set; }
        public bool Status { get; set; }//担保状态，0：未担保状态，1：在保状态
    }
}

