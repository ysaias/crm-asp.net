using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Usuario
/// </summary>
public class OportunidadDAO{

    public int idOportunidad { get; set; }
    public int idLineadeNegocio { get; set; }
    public int idProducto { get; set; }
    public string Descripcion { get; set; }
    public DateTime fechaHora { get; set; }
    public int idOrigen { get; set; }
    public int idCliente { get; set; }
    public int idUsuario { get; set; }


    public OportunidadDAO()
    {

    }
}