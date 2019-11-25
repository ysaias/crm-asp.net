using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListCliente : System.Web.UI.Page
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
            List<ClienteDAO> productos = ClienteDto.GetCliente();
            ClienteGridView.DataSource = productos;
            ClienteGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void ClienteGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int clienteId = 0;
        try
        {
            clienteId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (clienteId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroCliente.aspx?idCliente=" + clienteId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                //ClienteDto.DeleteCliente(clienteId);
                CargarProductos();
            }
            catch (Exception ex)
            {

            }
        }
    }
}