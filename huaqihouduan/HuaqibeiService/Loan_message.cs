using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService
{
    public class Loan_message
    {
        [Key]
        public long MessageId { get; set; }
        public long CompanyId { get; set; }
        public string LoanType { get; set; }
        public string LoanMessage { get; set; }
        public double LoanMoney { get; set; }
        public long LoanCredit { get; set; }
        public double Rate{ get; set; }
        public DateTime TimeSlot { get; set; }
        public int Status { get; set; }//借贷信息的状态，0：未执行，1：进行中，2:已完成
        public bool HelpStatus { get; set; }//求助状态，0：不需要平台帮助，1：需要平台帮助
        public double Rent { get; set; }//租金
    }
}
