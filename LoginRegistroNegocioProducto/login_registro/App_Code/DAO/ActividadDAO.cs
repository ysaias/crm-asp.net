using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ActividadDAO
/// </summary>
public class ActividadDAO
{
    public int idActivdad { get; set; }
    public string fecha { get; set; }
    public string hora { get; set; }
    public string descripcion { get; set; }
    public int idMedio { get; set; }
    public int idOportunidad { get; set; }



    public ActividadDAO()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}