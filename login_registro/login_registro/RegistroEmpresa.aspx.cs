using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroEmpresa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void registrarEmpresa(object sender, EventArgs e) {
        msgError.Text = "";
   
     
        
        try
        {
            string nombre = (nombreTxt.Text).Trim();
            string descripcion = (descripcionTxt.Text).Trim();
            
            
           
            if (nombre.Equals("")) {
                msgError.Text = "Ingrese un Nombre";
                return;

            }
            if (descripcion.Equals(""))
            {
                msgError.Text = "Ingrese la descripcion";
                return;

            }
            if (LineaNegocio_ProductoTxt.Equals(""))
            {
                msgError.Text = "Ingrese una Emrpesa";
                return;

            }
            if (descripcion.Length < 15 ) {
                msgError.Text = "la descripcion tiene que ser mayor a 15 ";
                return;
            }
           
            
            EmpresaDAO empresa = new EmpresaDAO();
            empresa.nombre = nombre;
            empresa.descripcion = descripcion;
            empresa.Usuario_Empresa = Convert.ToInt32(LineaNegocio_ProductoTxt.SelectedValue);

           
            EmpresaDto.InsertEmpresa(empresa);
            Response.Redirect("index.aspx");


        }
        catch (Exception E) {
            
            msgError.Text = "Error al optener los datos";
        }
    }
    public void vaciar() {
        nombreTxt.Text = "";
        descripcionTxt.Text = "";
        LineaNegocio_ProductoTxt.Text = "";
      
        msgError.Text = "";
    }
}