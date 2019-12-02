using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListProductos : System.Web.UI.Page
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


            CargarProductos(empresaId);


        }
    }

    private void CargarProductos(int idEmpresa)
    {
        try
        {
            List<ProductoDAO> productos = ProductoDto.GetProductosByIdEMpresa(idEmpresa);
            ProductosGridView.DataSource = productos;
            ProductosGridView.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void ProductosGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int productoId = 0;
        try
        {
            productoId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (productoId <= 0)
            return;
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistroProducto.aspx?idProducto=" + productoId);
            return;
        }
        if (e.CommandName == "Eliminar")
        {
            try
            {
                ProductoDto.DeleteProducto(productoId);
                CargarProductos(empresaId);
            }
            catch (Exception ex)
            {

            }
        }
    }
}