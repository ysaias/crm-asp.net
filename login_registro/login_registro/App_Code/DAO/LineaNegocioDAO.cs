using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de LineaNegocioDAO
/// </summary>
public class LineaNegocioDAO
{
    public int idLineaNegocio { get; set; }
    public string nombre { get; set; }
    public string descripcion { get; set; }
    public int Empresa_LineaNegocio { get; set; }

    public LineaNegocioDAO()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}