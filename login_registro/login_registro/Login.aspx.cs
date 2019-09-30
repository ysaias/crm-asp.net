using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            Response.Redirect("Index.aspx");
        }
    }
    protected void BtnIngresar_Click(object sender, EventArgs e)
    {
        msgError.Text = "";
        try
        {
            string user = (userTxt.Text).Trim();
            string pass = (passTxt.Text).Trim();
            if (user.Equals("") || pass.Equals(""))
            {
                msgError.Text = "Ingrese todos los datos";
                return;
            }
            UsuarioDAO usuario = UsuarioDto.login(user, pass);
            if (usuario == null)
            {
                msgError.Text = "user/password incorrectos";
                return;
            }
            userTxt.Text = "";
            passTxt.Text = "";
            msgError.Text = "";
            Session["UserId"] = usuario.idUsuario;
            Response.Redirect("Index.aspx");
            
        }
        catch (Exception E) {
            msgError.Text = "No activa";
            return;
        }
    }

}