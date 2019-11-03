using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LineaNegocio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void registrarNegocio(object sender, EventArgs e)
    {
        msgError.Text = "";


        try
        {
            string nombre = (nombreTxt.Text).Trim();
            string descripcion = (descripcionTxt.Text).Trim();


            /*Se necestita crear este campo en la pagina html 
             * 
            / string empresa = (empresaTxt.Text).Trim();
            */



             if (nombre.Equals(""))
             {
                 msgError.Text = "Ingrese un Nombre Negocio";
                 return;

             }
             if (descripcion.Equals(""))
             {
                 msgError.Text = "Ingrese la descripcion del Negocio";
                 return;

             }

             if (descripcion.Length < 15)
             {
                 msgError.Text = "la descripcion tiene que ser mayor a 15 ";
                 return;
             }

            /*
             *Se necestita crear este campo en la pagina html 
             * 
             * if (empresaTxt.Equals(""))
             {
                 msgError.Text = "Debe Seleccionar la Empresa";
                 return;
             }*/


            LineaNegocioDAO negocioDAO = new LineaNegocioDAO();
            negocioDAO.nombre = nombre;
            negocioDAO.descripcion = descripcion;


            LineaNegocioDto.InsertLineaNegocio(negocioDAO);
            Response.Redirect("index.aspx");


        }
        catch (Exception E)
        {

            msgError.Text = "Error al optener los datos" + E.Message;
        }
    }
    public void vaciar()
    {
        nombreTxt.Text = "";
        descripcionTxt.Text = "";

        msgError.Text = "";
    }
}