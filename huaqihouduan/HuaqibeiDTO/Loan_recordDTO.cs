using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiDTO
{
    public class Loan_recordDTO
    {
        public long MessageId { get; set; }
        public long ProviderId { get; set; }
        public string Reason { get; set; }
        public DateTime PaymentTime { get; set; }
        public bool Status { get; set; }//债务公司审核状态，0：不接受借贷，1：接收借贷
    }
}
