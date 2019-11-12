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

        LineaNegocioDAO lineaNegocioDAO = new LineaNegocioDAO();
        lineaNegocioDAO.idNegocio = row.idLineaNegocio;
        lineaNegocioDAO.nombre = row.nombre;
        lineaNegocioDAO.descripcion = row.descripcion;
        lineaNegocioDAO.empresaId = row.empresaId;

        return lineaNegocioDAO;
    }

    public static void InsertLineaNegocio(LineaNegocioDAO theLineanegocio)
    {
        LineaNegocioDSTableAdapters.LineaNegocioDAOTableAdapter adapter = new LineaNegocioDSTableAdapters.LineaNegocioDAOTableAdapter();
        adapter.pr_InsertLineaNegocio(theLineanegocio.nombre, theLineanegocio.descripcion, theLineanegocio.empresaId);
    }


}