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

    private static ProductoDAO CargarObjecto(ProductoDS.tblProductoRow row)
    {

        ProductoDAO producto = new ProductoDAO();
        producto.idProducto = row.idProducto;
        producto.nombre = row.nombre;
        producto.descripcion = row.descripcion;
        producto.LineaNegocio_Producto = row.lineaNegocioId;

        return producto;
    }

    public static ProductoDAO GetProductoById(int productoId)
    {
        if (productoId <= 0)
            throw new ArgumentException("El idProducto no puede ser menor o igual que cero");

        ProductoDSTableAdapters.tblProductoTableAdapter adapter = new ProductoDSTableAdapters.tblProductoTableAdapter();
        ProductoDS.tblProductoDataTable table = adapter.pr_GetProductoById(productoId);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table obtenida no tiene el numero correcto de filas");
        }
        ProductoDAO obj = GetProductoFromRow(table[0]);
        return obj;
    }


    

    public static void InsertProducto(ProductoDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.descripcion))
            throw new ArgumentException("La descripcion no puede ser nulo o vacio");

        if (obj.LineaNegocio_Producto < 0)
            throw new ArgumentException("El Negocio no puede ser negativo");

        
        ProductoDSTableAdapters.tblProductoTableAdapter adapter = new ProductoDSTableAdapters.tblProductoTableAdapter();
        adapter.pr_insertarProducto(obj.nombre, obj.descripcion, obj.LineaNegocio_Producto);

        
    }

    public static void UpdateProducto(ProductoDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (obj.idProducto <= 0)
            throw new ArgumentException("El idProducto no puede ser menor o igual que cero");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.descripcion))
            throw new ArgumentException("La descripcion no puede ser nulo o vacio");

        if (obj.LineaNegocio_Producto < 0)
            throw new ArgumentException("El Negocio no puede ser negativo");

        ProductoDSTableAdapters.tblProductoTableAdapter adapter = new ProductoDSTableAdapters.tblProductoTableAdapter();
        adapter.pr_updateProducto(obj.idProducto, obj.nombre, obj.descripcion, obj.LineaNegocio_Producto);
    }




    public static List<ProductoDAO> GetProductos()
    {
        ProductoDSTableAdapters.tblProductoTableAdapter adapter = new ProductoDSTableAdapters.tblProductoTableAdapter();
        ProductoDS.tblProductoDataTable table = adapter.pr_SelectProducto();

        List<ProductoDAO> list = new List<ProductoDAO>();
        foreach (var row in table)
        {
            ProductoDAO obj = GetProductoFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static List<ProductoDAO> GetProductosByIdEMpresa(int empresaId)
    {
        ProductoDSTableAdapters.tblProductoTableAdapter adapter = new ProductoDSTableAdapters.tblProductoTableAdapter();
        ProductoDS.tblProductoDataTable table = adapter.pr_SelectProductoByIdEmpresa(empresaId);

        List<ProductoDAO> list = new List<ProductoDAO>();
        foreach (var row in table)
        {
            ProductoDAO obj = GetProductoFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteProducto(int productoId)
    {
        if (productoId <= 0)
            throw new ArgumentException("El productoId no puede ser menor o igual que cero");

        ProductoDSTableAdapters.tblProductoTableAdapter adapter = new ProductoDSTableAdapters.tblProductoTableAdapter();
        adapter.pr_deletedProducto(productoId);
    }

    private static ProductoDAO GetProductoFromRow(ProductoDS.tblProductoRow row)
    {
        return new ProductoDAO()
        {
            idProducto = row.idProducto,
            nombre = row.nombre,
            descripcion = row.descripcion,
            LineaNegocio_Producto = row.lineaNegocioId
        };
    }


}