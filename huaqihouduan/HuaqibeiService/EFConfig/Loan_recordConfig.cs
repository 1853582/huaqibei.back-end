using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService.EFConfig
{
        public class Loan_recordConfig : EntityTypeConfiguration<Loan_record>
        {
            public Loan_recordConfig()
            {
                ToTable("loan_record");
                Property(e => e.MessageId).IsRequired();//int(19)
                Property(e => e.ProviderId).IsRequired();//int(19)
                Property(e => e.Reason).HasMaxLength(2000);
                Property(e => e.PaymentTime).IsRequired();//date
                Property(e => e.Status).IsRequired();//bool
            }
        }
}
