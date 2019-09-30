using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Usuario
/// </summary>
public class UsuarioDAO
{
    public int idUsuario { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Direccion { get; set; }
    public int Telefono { get; set; }
    public string Celular { get; set; }
    public string Usuario { get; set; }
    public string Contrasena { get; set; }
    public string codigoConfirmacion { get; set; }
    public bool activa { get; set; }
    public string correo { get; set; }
    public UsuarioDAO()
    {

    }
}