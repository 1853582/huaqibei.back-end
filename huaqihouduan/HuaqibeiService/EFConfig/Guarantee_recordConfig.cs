using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService.EFConfig
{
    public class Guarantee_recordConfig : EntityTypeConfiguration<Guarantee_record>
    {
        public Guarantee_recordConfig()
        {
            ToTable("guarantee_record");
            Property(e => e.MessageId).IsRequired();
            Property(e => e.GuarantorId).IsRequired();
            Property(e => e.Status).IsRequired();
        }
    }
}
