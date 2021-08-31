using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Security
{
	public class EmailBl
	{
        public void sendEmail(string htmlString, string subject, string emailTo) {
            try {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("the.news.maker.0@gmail.com");
                message.To.Add(new MailAddress(emailTo));
                message.Subject = subject;
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = htmlString;
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("the.news.maker.0@gmail.com", "makingNews");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            } catch (Exception e) {
                new ErrorBl().create(e.ToString());
            }
        }
    }
}
