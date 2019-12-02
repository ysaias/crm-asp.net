using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListOportunidad : System.Web.UI.Page
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
            List<OportunidadDAO> productos = OportunidadDto.GetOportunidadList();
            oportunidadGridView.DataSource = productos;
            oportunidadGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void oportunidadGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int oportunidadId = 0;
        try
        {
            oportunidadId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (oportunidadId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroOportunidad.aspx?idOportunidad=" + oportunidadId);
            return;
        }

        if (e.CommandName == "Usar")
        {
            Session["OportunidadId"] = oportunidadId;
            Response.Redirect("RegistroActividad.aspx");

        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                OportunidadDto.DeleteOportunidad(oportunidadId);
                CargarProductos();
            }
            catch (Exception ex)
            {

            }
        }
    }
}