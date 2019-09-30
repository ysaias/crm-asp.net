using System;
using System.Linq;
using System.Net;
using System.Net.Mail;
using UsuarioDSTableAdapters;

/// <summary>
/// Descripción breve de UsuarioDto
/// </summary>
public class UsuarioDto
{
    public UsuarioDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public static UsuarioDAO login(string user, string pass) {
        pr_verificacionUsuariosTableAdapter adapter = new pr_verificacionUsuariosTableAdapter();
        UsuarioDS.pr_verificacionUsuariosDataTable table = adapter.getLogin(user, pass);

        if (table == null || table.Rows.Count > 1)
        {
            throw new Exception("La consulta retornó un numero incorrecto de filas");
        }
        UsuarioDS.pr_verificacionUsuariosRow row = table[0];
        return new UsuarioDAO()
        {
            idUsuario = row.idUsuario,
            Usuario = row.Usuario,
        };
        
    }
    public static bool getVerificacionCorreo(string correo)
    {
        pr_verificacionUsuariosTableAdapter adapter = new pr_verificacionUsuariosTableAdapter();
        UsuarioDS.pr_verificacionUsuariosDataTable table = adapter.getVerificacionCorreo(correo);
        if (table.Rows.Count==0) {
            return true;
        }
        return false;
    }
    public static void insertCorreo(UsuarioDAO user) {
        UsuarioDS.pr_verificacionUsuariosDataTable table;
        try {
            pr_verificacionUsuariosTableAdapter adapter = new pr_verificacionUsuariosTableAdapter();
            table = adapter.insertCuenta(user.Nombre, user.Direccion, user.Telefono, user.Usuario, user.Contrasena,
                    user.codigoConfirmacion, user.activa, user.correo, user.Celular);
        } catch (Exception e) {
            throw new Exception(e.ToString());
        }
          
        UsuarioDS.pr_verificacionUsuariosRow row = table[0];
        enviarEmail(row.idUsuario);
    }

    public static UsuarioDAO getUsuarioID(int id) {
        pr_verificacionUsuariosTableAdapter adapter = new pr_verificacionUsuariosTableAdapter();
        UsuarioDS.pr_verificacionUsuariosDataTable table = adapter.getUsuarioID(id);

        if (table == null || table.Rows.Count > 1)
        {
            throw new Exception("La consulta retornó un numero incorrecto de filas");
        }
        UsuarioDS.pr_verificacionUsuariosRow row = table[0];
        return new UsuarioDAO()
        {
            idUsuario = row.idUsuario,
            Usuario = row.Usuario,
            correo = row.Correo,
            codigoConfirmacion = row.codigoConfirmacion
            
        };

    }
    public static bool validarCodigo(string codigo) {
        try
        {
            pr_verificacionUsuariosTableAdapter adapter = new pr_verificacionUsuariosTableAdapter();
            adapter.validarCodigo(codigo);
            return true;
        }
        catch (Exception E) {
            return false;
        }
    }
    public static void enviarEmail(int usuarioId)
    {
        try
        {
            UsuarioDAO user = UsuarioDto.getUsuarioID(usuarioId);

            MailMessage mail = new MailMessage();
            SmtpClient smtpCli = new SmtpClient();
            mail.From = new MailAddress("jose.cadima@aetest.net");
            mail.To.Add(new MailAddress(user.correo));

            string message =
                "<p>" +
                    "Felicidades tu cuenta ha sido activada, haz click en el siguiente link para confirmarla" +
                "</p>" +
                "http://localhost:56988/ConfirmarCuenta.aspx?code=" + user.codigoConfirmacion;
            mail.Body = message;
            mail.IsBodyHtml = true;
            mail.Subject = "Activacion de Cuenta";
            smtpCli.Host = "mail.aetest.net";
            smtpCli.Port = 587;
            smtpCli.Credentials = new NetworkCredential("jose.cadima@aetest.net", "ysNwm0axilRj");
            smtpCli.EnableSsl = true;
            smtpCli.Send(mail);
        }
        catch (Exception e)
        {
            Console.WriteLine("Error: " + e.Message);
        }
    }
   public static string numeroAleatorio() {
        Random rnd = new Random();
        return rnd.Next(9) + "" + rnd.Next(9) + "" + rnd.Next(9) + "" + rnd.Next(9) + "" + rnd.Next(9) + "" + rnd.Next(9)
            + "" + rnd.Next(9) + "" + rnd.Next(9) + "" + rnd.Next(9);
    } 
}
