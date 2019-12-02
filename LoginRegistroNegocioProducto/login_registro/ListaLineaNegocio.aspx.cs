using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaLineaNegocio : System.Web.UI.Page
{
    int empresaId = 0;
    int userId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                userId = Convert.ToInt32(Session["UserId"].ToString());
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["EmpresaId"] != null)
            {
                empresaId = Convert.ToInt32(Session["EmpresaId"].ToString());
            }
            else
            {
                Response.Redirect("ListaEmpresa.aspx");
            }


            CargarLineaNegocios(empresaId);


        }
    }

    private void CargarLineaNegocios(int idEmpresa)
    {
        try
        {
            List<LineaNegocioDAO> negocios = LineaNegocioDto.GetLineaNegociosByIdEmpresa(idEmpresa);
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
                CargarLineaNegocios(empresaId);
            }
            catch (Exception ex)
            {

            }
        }
    }
}