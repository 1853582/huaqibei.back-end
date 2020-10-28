using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService.EFConfig
{
    public class UserConfig : EntityTypeConfiguration<User>
    {
        public UserConfig()
        {
            ToTable("user");
            Property(e => e.UserId).IsRequired();
            Property(e => e.Username).HasMaxLength(20).IsRequired();
            Property(e => e.Password).HasMaxLength(20).IsRequired();
            Property(e => e.UserType).IsRequired();
        }
    }
}
