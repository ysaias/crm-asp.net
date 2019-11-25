using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaEmpresa : System.Web.UI.Page
{
    int userId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                userId = Convert.ToInt32(Session["UserId"].ToString());
            }
            CargarListaEmpresas();
        }
    }

    private void CargarListaEmpresas()
    {
        try
        {
            List<EmpresaDAO> empresas = EmpresaDto.GetEmpresasByIdUsuario(userId);
            EmpresasGridView.DataSource = empresas;
            EmpresasGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void EmpresascioGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int empresaId = 0;
        try
        {
            empresaId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (empresaId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroEmpresa.aspx?empresaId=" + empresaId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                EmpresaDto.DeleteEmpresa(empresaId);
                CargarListaEmpresas();
            }
            catch (Exception ex)
            {

            }
        }
    }
}