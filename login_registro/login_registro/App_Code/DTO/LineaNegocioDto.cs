using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de LineaNegocioDto
/// </summary>
public class LineaNegocioDto
{
    public LineaNegocioDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    private static LineaNegocioDAO CargarObjecto(LineaNegocioDS.LineaNegocioDAORow row)
    {

        LineaNegocioDAO lineanegocio = new LineaNegocioDAO();
        lineanegocio.idLineaNegocio = row.idLineaNegocio;
        lineanegocio.nombre = row.nombre;
        lineanegocio.descripcion = row.descripcion;
        lineanegocio.Empresa_LineaNegocio = row.Empresa_LineaNegocio;

        return lineanegocio;
    }


    public static void InsertLineaNegocio(LineaNegocioDAO theLinea)
    {
        LineaNegocioDSTableAdapters.LineaNegocioDAOTableAdapter adapter = new LineaNegocioDSTableAdapters.LineaNegocioDAOTableAdapter();
        adapter.pr_insertarLineaNegocio(theLinea.nombre, theLinea.descripcion, theLinea.Empresa_LineaNegocio);
    }

}