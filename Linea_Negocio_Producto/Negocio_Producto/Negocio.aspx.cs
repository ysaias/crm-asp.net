using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Negocio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void crearNegocio(object sender, EventArgs e) {
        msgError.Text = "";
        string patterCodigo = "[a-zA-Z0-9_\\-]";
        string patterNombre = "[a-zA-Z]+";
        string patterDescripcion = "[a-zA-Z]+";

        try
        {
            string nombre = (nombreTxt.Text).Trim();
            string codigo = (codigoTxt.Text).Trim();
            string descripcion=(descripcionTxt.Text).Trim();
           
            if (nombre.Equals("") || codigo.Equals("") || descripcion.Equals("") ) {
                msgError.Text = "Ingrese todos los campos";
                return;
            }
            if (nombre.Equals("")) {
                msgError.Text = "Ingrese un Nombre";
                return;

            }
            if (codigo.Equals(""))
            {
                msgError.Text = "Ingrese un Nombre";
                return;

            }
            if (descripcion.Equals(""))
            {
                msgError.Text = "Ingrese un Nombre";
                return;

            }
            
            
            if (descripcion.Length < 7) {
                msgError.Text = "La descripcion debe ser mayor a 15 digitos";
                return;
            }
           
            if (!Regex.IsMatch(nombre, patterNombre) ) {
                msgError.Text = "el nombre solo puede contener letras";
                return;
            }
           
            //NegocioDAO usuario = new UsuarioDAO();
            //usuario.Nombre = nombre;
           
            //usuario.codigoConfirmacion = UsuarioDto.numeroAleatorio();
            //usuario.activa = false;
           
            //vaciar();
            //UsuarioDto.insertCorreo(usuario);
            //Response.Redirect("Pagina_Inicial");


        }
        catch (Exception E) {
            
            msgError.Text = "Error al optener los datos";
        }
    }
    public void vaciar() {
        nombreTxt.Text = "";
        codigoTxt.Text = "";
        descripcionTxt.Text = "";
       
        msgError.Text = "";
    }
}