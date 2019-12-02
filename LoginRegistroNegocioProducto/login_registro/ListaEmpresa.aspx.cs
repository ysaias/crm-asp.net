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
            CargarListaEmpresas();
        }
    }

    private void CargarListaEmpresas()
    {
        try
        {
            userId = Convert.ToInt32(Session["UserId"]);
            List<EmpresaDAO> empresas = EmpresaDto.GetEmpresasByIdUsuario(userId);
            if (empresas.Count <= 0)
            {
                Response.Redirect("RegistroEmpresa.aspx");
            }
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
        else if (e.CommandName == "VerLinea")
        {
            Session["EmpresaLinea"] = empresaId.ToString();
            Response.Redirect("ListaLineaNegocio.aspx");
            return;
        }
        else if (e.CommandName == "Eliminar")
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