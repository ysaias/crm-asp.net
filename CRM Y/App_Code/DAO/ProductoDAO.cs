using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ProductoDAO
/// </summary>
public class ProductoDAO
{


    public int idProducto { get; set; }
    public string nombre { get; set; }
    public string descripcion { get; set; }
    public int LineaNegocio_Producto { get; set; }

    public ProductoDAO()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}