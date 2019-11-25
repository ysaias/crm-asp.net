using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClienteDAO
/// </summary>
public class ClienteDAO
{
    public int idCliente { get; set; }
    public string NombreCompleto { get; set; }
    public string correo { get; set; }
    public int Telefono { get; set; }
    public int celular { get; set; }
    public string Direccion { get; set; }
    public int idCiudad { get; set; }

    public ClienteDAO()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}