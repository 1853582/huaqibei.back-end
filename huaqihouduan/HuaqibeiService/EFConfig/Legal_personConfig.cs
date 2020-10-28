using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService.EFConfig
{
    public class Legal_personConfig : EntityTypeConfiguration<Legal_person>
    {
       public Legal_personConfig()
        {
            ToTable("legal_person");
            HasKey(e => e.CompanyId);//int19
            Property(e => e.CompanyId).IsRequired();
            Property(e => e.Name).HasMaxLength(20).IsRequired();
            Property(e => e.Age).IsRequired();//int8
            Property(e => e.Education).HasMaxLength(40).IsRequired();
            Property(e => e.CreditRecord).HasMaxLength(2000);
            Property(e => e.CrimeRecord).HasMaxLength(2000);
            Property(e => e.IncomeCertificate).HasMaxLength(2000);
            Property(e => e.AssetCertificate).HasMaxLength(2000);
            //Property(e => e.MarryState);//bool类型，可为空
        }
    }
}
