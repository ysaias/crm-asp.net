using System;

public partial class Usuarios_ConfirmarCuenta : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
        {
           ProcesarParametros();
        }
    }

    private void ProcesarParametros()
    {
        bool esCodigoCorrecto = false;
        if (Request.QueryString["code"] != null && !string.IsNullOrEmpty(Request.QueryString["code"]))
        {
            try
            {
                string code = Request.QueryString["code"].ToString();
                esCodigoCorrecto = UsuarioDto.validarCodigo(code);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
        if (esCodigoCorrecto)
        {
            ConfirmacionLabel.Text = "Felicidades tu cuenta esta activada";
        }
        else
        {
            ConfirmacionLabel.Text = "Codigo incorrecto";
            RediresctLinkButton.Visible = false;
        }

    }

}