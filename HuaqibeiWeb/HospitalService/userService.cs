using EFEntites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using HuaqibeiDTO;

namespace HuaqibeiService
{
    //public string UserId { get; set; }
    //public string Username { get; set; }
    //public string Password { get; set; }
    //public string UserType { get; set; }
    public class userService
    {
       public void AddNew(string UserId, string Username, string Password, int UserType)
        {
            using (MyContext ctx = new MyContext())
            {
                user s = new user();
                s.UserId = UserId;
                s.Username = Username;
                s.Password = Password;
                s.UserType = UserType;
                ctx.users.Add(s);
                try
                {
                    ctx.SaveChanges();
                }
                catch (Exception err)
                {
                    Console.WriteLine(err);
                }
            }
        }
        //public void Change(string oldID, string newpassword)
        //{
        //    using (MyContext ctx = new MyContext())
        //    {
        //        //Linq 查询 - 自动转译 T-SQL 语句
        //        var query = from item in ctx.accounts
        //                    where item.user_ID == oldID
        //                    select item;
        //        //查询到对象后，修改对象属性
        //        foreach (var item in query)
        //        {
        //            item.password = newpassword;
        //            break;
        //        }
        //        ctx.SaveChanges();
        //    }
        //}
        //public void Delete(string id)
        //{
        //    using (MyContext ctx = new MyContext())
        //    {
        //        var stu = ctx.accounts.SingleOrDefault(s => s.user_ID == id);
        //        if (stu == null)
        //        {
        //            throw new ArgumentException("没找到id="+id+"的用户");
        //        }
        //        ctx.accounts.Remove(stu);
        //        ctx.SaveChanges();
        //    }
        //}
        //public userDTO GetById(string id)
        //{
        //    using (MyContext ctx = new MyContext())
        //    {
        //        //var s = ctx.Accounts.AsNoTracking()
        //        //.Include(e => e.Class).Include(e => e.MinZu)
        //        //.SingleOrDefault(e => e.Id == id);
        //        var s = ctx.accounts.AsNoTracking()
        //               .SingleOrDefault(e => e.user_ID == id);
        //        if (s == null)
        //        {
        //            return null;
        //        }
        //        return ToDTO(s);
        //    }
        //}
        //private userDTO ToDTO(account s)
        //{

        //    userDTO dto = new userDTO();
        //        dto.user_ID = s.user_ID;
        //        dto.name = s.name;
        //        dto.password = s.password;
        //        dto.account_type = s.account_type;
        //        return dto;
            
        //}

    }
}
