using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaLineaNegocio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarLineaNegocios();


        }
    }

    private void CargarLineaNegocios()
    {
        try
        {
            List<LineaNegocioDAO> negocios = LineaNegocioDto.GetLineaNegocios();
            NegociosGridView.DataSource = negocios;
            NegociosGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void LineaNegocioGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int negocioId = 0;
        try
        {
            negocioId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (negocioId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroLineaNegocio.aspx?idLineaNegocio=" + negocioId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                LineaNegocioDto.DeleteLineaNegocio(negocioId);
                CargarLineaNegocios();
            }
            catch (Exception ex)
            {

            }
        }
    }
}