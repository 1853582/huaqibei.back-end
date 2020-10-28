using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace HuaqibeiService
{
    public class Company
    {
        [Key]
        public long CompanyId { get; set; }
        public string Investment { get; set; }
        public string CompanyName { get; set; }
        public long MemberNumber { get; set; }
        public string History { get; set; }
        public string Logo { get; set; }//企业logo
        public string Staff { get; set; }
        public string FutureDevelop { get; set; }
        public string Asset { get; set; }
        public long RiskIndex { get; set; }
        public bool Status { get; set; }
        public string Slogan { get; set; }//企业标语
        public string Environment { get; set; }//企业工作环境
        public string DepositBank { get; set; }//开户银行
        public string DepositBankCardNumber { get; set; }//开户银行卡号
    }
}
