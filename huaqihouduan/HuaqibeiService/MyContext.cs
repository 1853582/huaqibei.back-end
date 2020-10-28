using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using HuaqibeiService;
using HuaqibeiDTO;

namespace hospital1
{
    public class MyContext : DbContext
    {
        public MyContext() : base("name=connStr")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Configurations.AddFromAssembly(
                 Assembly.GetExecutingAssembly()
                );
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<Asset_mortgage> Asset_Mortgages { get; set; }
    }
}
