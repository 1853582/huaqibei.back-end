﻿using HuaqibeiDTO;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFEntites.EntityConfig
{
    class userConfig : EntityTypeConfiguration<user>
    {

        //public int user_ID { get; set; }
        //public string name { get; set; }
        //public string password { get; set; }
        //public string account_type { get; set; }
        public userConfig()
        { 
            ToTable("user");
            //this.HasKey(e => e.user_ID);
            Property(e => e.UserId).IsRequired();
            Property(e => e.Username).IsRequired();
            Property(e => e.Password).IsRequired();
            Property(e => e.UserType).IsRequired();
            
        }
    } 
}
