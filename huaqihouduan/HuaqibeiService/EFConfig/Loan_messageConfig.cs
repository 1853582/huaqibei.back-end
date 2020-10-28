using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HuaqibeiService.EFConfig
{
    public class Loan_messageConfig : EntityTypeConfiguration<Loan_message>
    {
        public Loan_messageConfig()
        {
            ToTable("loan_message");
            HasKey(e => e.MessageId);
            Property(e => e.MessageId).IsRequired();//int(19)
            Property(e => e.CompanyId).IsRequired();//int(19)
            Property(e => e.LoanType).HasMaxLength(20);
            Property(e => e.LoanMessage).HasMaxLength(2000);
            Property(e => e.LoanMoney); //double
            Property(e => e.LoanCredit);//int(19)
            Property(e => e.Rate);      //double
            Property(e => e.TimeSlot);  //datetime
            Property(e => e.Status);    //int(1)
            Property(e => e.HelpStatus);    //bool
            Property(e => e.Rent);    //double

        }

    }
}
