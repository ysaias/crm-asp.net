using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Click(object sender, EventArgs e)
    {

        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient("mail.crm21.net");

        mail.From = new MailAddress("ysaiasceron@crm21.net");
        mail.To.Add("joseco48@gmail.com");
        mail.Subject = "Test Mail";
        mail.Body = "This is for testing SMTP mail from GMAIL";


        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential("ysaiasceron@crm21.net", "Ysa4@belgioeri");
        SmtpServer.EnableSsl = false;

        SmtpServer.Send(mail);
    }

    protected void btn_ClickDate(object sender, EventArgs e)
    {



        Label1.Text = from_date.Text;
        Label2.Text = from_time.Text;

    }




    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
}