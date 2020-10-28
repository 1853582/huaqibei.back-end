using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService
{
    public class Asset_mortgage
    {
        [Key]
        public long AssetId { get; set; }
        public long MessageId { get; set; }
        public string Mortgagor { get; set; }
        public string Contact { get; set; }
        public string Asset { get; set; }
    }
}
