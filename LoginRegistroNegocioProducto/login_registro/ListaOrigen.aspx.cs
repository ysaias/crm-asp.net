using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaOrigen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarProductos();


        }
    }

    private void CargarProductos()
    {
        try
        {
            List<OrigenDAO> origenObj = OrigenDto.GetOrigen();
            origenGridView.DataSource = origenObj;
            origenGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void origenGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int origenId = 0;
        try
        {
            origenId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (origenId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroOrigen.aspx?idOrigen=" + origenId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                OrigenDto.DeleteOrigen(origenId);
                CargarProductos();
            }
            catch (Exception ex)
            {

            }
        }
    }
}