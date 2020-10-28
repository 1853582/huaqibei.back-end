using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService.EFConfig
{
    public class CompanyConfig : EntityTypeConfiguration<Company>
    {
        public CompanyConfig()
        {
            ToTable("company");
            Property(e => e.CompanyId).IsRequired();
            Property(e => e.Logo).HasMaxLength(2000);
            Property(e => e.CompanyName).HasMaxLength(60).IsRequired();
            Property(e => e.History).HasMaxLength(2000);
            Property(e => e.FutureDevelop).HasMaxLength(2000);
            Property(e => e.Status).IsRequired();
            Property(e => e.Slogan).HasMaxLength(2000);
            Property(e => e.DepositBank).HasMaxLength(60);
            Property(e => e.DepositBankCardNumber).HasMaxLength(60);
        }
    }
}
