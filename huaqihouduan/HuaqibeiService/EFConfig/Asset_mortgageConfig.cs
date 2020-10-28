using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService.EFConfig
{
    public class Asset_mortgageConfig : EntityTypeConfiguration<Asset_mortgage>
    {
        public Asset_mortgageConfig()
        {
            ToTable("asset_mortgage");
            Property(e => e.AssetId).IsRequired();
            Property(e => e.MessageId).IsRequired();
            Property(e => e.Mortgagor).IsRequired().HasMaxLength(20);
            Property(e => e.Contact).IsRequired().HasMaxLength(2000);
            Property(e => e.Asset).IsRequired();
        }
    }
}
