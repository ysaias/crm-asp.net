using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaMedio : System.Web.UI.Page
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
            List<MedioDAO> medios = MedioDto.GetMedioList();
            paisGridView.DataSource = medios;
            paisGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void paisGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int medioId = 0;
        try
        {
            medioId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (medioId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroMedio.aspx?idMedio=" + medioId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                MedioDto.DeleteMedio(medioId);
                CargarProductos();
            }
            catch (Exception ex)
            {

            }
        }
    }
}