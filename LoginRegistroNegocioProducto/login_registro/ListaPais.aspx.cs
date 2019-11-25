using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaPais : System.Web.UI.Page
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
            List<PaisDAO> pasis = PaisDto.GetPais();
            paisGridView.DataSource = pasis;
            paisGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void paisGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int paisId = 0;
        try
        {
            paisId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (paisId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroPais.aspx?paisId=" + paisId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                PaisDto.DeletePais(paisId);
                CargarProductos();
            }
            catch (Exception ex)
            {

            }
        }
    }
}