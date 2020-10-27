using HuaqibeiService;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFEntites
{
    public class user
    {
        [Key]
        public string UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int UserType { get; set; }
        //public virtual nurse nurse { get; set; }
    }
}
