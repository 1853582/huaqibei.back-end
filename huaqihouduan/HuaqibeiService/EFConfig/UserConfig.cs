using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Reflection;
using HuaqibeiService;

namespace HuaqibeiService
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
                Assembly.GetExecutingAssembly());
        }
        public DbSet<User> users { get; set; }
    }
}