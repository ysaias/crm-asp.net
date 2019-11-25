using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaCiudad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarCiudad();


        }
    }

    private void CargarCiudad()
    {
        try
        {
            List<CiudadDAO> ciudad = CiudadDto.GetCiudad();
            ciudadGridView.DataSource = ciudad;
            ciudadGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void ciudadGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int ciudadId = 0;
        try
        {
            ciudadId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (ciudadId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroCiudad.aspx?idCiudad=" + ciudadId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                CiudadDto.DeleteCiudad(ciudadId);
                CargarCiudad();
            }
            catch (Exception ex)
            {

            }
        }
    }
}