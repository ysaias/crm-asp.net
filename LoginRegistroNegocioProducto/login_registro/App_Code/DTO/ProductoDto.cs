using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ProductoDto
/// </summary>
public class ProductoDto
{
    public ProductoDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    private static ProductoDAO CargarObjecto(ProductoDS.ProductoDAORow row)
    {

        ProductoDAO producto = new ProductoDAO();
        producto.idProducto = row.idProducto;
        producto.nombre = row.nombre;
        producto.descripcion = row.descripcion;
        producto.LineaNegocio_Producto = row.LineaNegocio_Producto;

        return producto;
    }

    public static void InsertProducto(ProductoDAO theProducto)
    {
        ProductoDSTableAdapters.ProductoDAOTableAdapter adapter = new ProductoDSTableAdapters.ProductoDAOTableAdapter();
        adapter.pr_insertarProducto(theProducto.nombre, theProducto.descripcion,theProducto.LineaNegocio_Producto);
    }


}