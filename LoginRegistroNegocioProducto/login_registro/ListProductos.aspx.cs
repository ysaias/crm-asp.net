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
            if (Session["NegocioProducto"] != null && Session["EmpresaLinea"] != null)
            {
                int empresaId = Convert.ToInt32(Session["EmpresaLinea"].ToString());
                if (empresaId <= 0)
                    Response.Redirect("ListaEmpresa.aspx");


                EmpresaDAO objEmp = EmpresaDto.GetEmpresaById(empresaId);
                if (objEmp == null)
                    Response.Redirect("ListaEmpresa.aspx");

                EmpresaIdHD.Value = empresaId.ToString();

                int negocioId = Convert.ToInt32(Session["NegocioProducto"].ToString());
                if (negocioId <= 0)
                    Response.Redirect("ListaEmpresa.aspx");

                LineaNegocioDAO objNeg = LineaNegocioDto.GetLineaNegocioById(negocioId);
                if (objNeg == null)
                    Response.Redirect("ListaEmpresa.aspx");

                NegocioIdHD.Value = negocioId.ToString();

                NegocioEmpresa.InnerText = objNeg.nombre.ToUpper() + " - " + objEmp.nombre;                
                CargarProductos();
            }
            else
            {
                Response.Redirect("ListaEmpresa.aspx");
            }
        }
    }

    private void CargarProductos()
    {
        try
        {
            List<ProductoDAO> productos = ProductoDto.GetProductosByLineaNegocio(Convert.ToInt32(NegocioIdHD.Value));
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

    protected void btnRegistrarProducto_Click(object sender, EventArgs e)
    {
        Session["EmpresaLinea"] = EmpresaIdHD.Value;
        Session["NegocioProducto"] = NegocioIdHD.Value;
        Response.Redirect("RegistroProducto.aspx");
    }
}