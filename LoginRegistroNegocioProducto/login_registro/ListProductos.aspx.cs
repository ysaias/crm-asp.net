using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListProductos : System.Web.UI.Page
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
            List<ProductoDAO> productos = ProductoDto.GetProductos();
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
                CargarProductos();
            }
            catch (Exception ex)
            {

            }
        }
    }
}