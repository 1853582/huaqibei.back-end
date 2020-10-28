using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService
{
    public class Legal_person
    {
        [Key]
        public long CompanyId { get; set; }
        public string Name { get; set; }
        public long Age { get; set; }
        public string Education { get; set; }
        public string CreditRecord { get; set; }
        public string CrimeRecord { get; set; }
        public string IncomeCertificate { get; set; }
        public string AssetCertificate { get; set; }
        public bool MarryState { get; set; }//婚姻状况，0：未婚，1：已婚

    }
}
