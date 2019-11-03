using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EmpresaDAO
/// </summary>
public class EmpresaDAO
{
    public int empresaId { get; set; }
    public string nombre { get; set; }
    public string Descripcion { get; set; }
    public int UsuarioId { get; set; }

    public EmpresaDAO()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}