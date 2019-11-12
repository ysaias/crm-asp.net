using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EmpresaDto
/// </summary>
public class EmpresaDto
{

    private static EmpresaDAO CargarObjecto(EmpresaDS.EmpresaDAORow row)
    {

        EmpresaDAO empresa = new EmpresaDAO();
        empresa.idEmpresa = row.idEmpresa;
        empresa.nombre = row.Nombre;
        empresa.descripcion = row.Descripcion;
        empresa.Usuario_Empresa = row.Usuario_Empresa;

        return empresa;
    }


    public static void InsertEmpresa(EmpresaDAO theLinea)
    {
        EmpresaDSTableAdapters.EmpresaDAOTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDAOTableAdapter();
        adapter.pr_insertarEmpresa(theLinea.nombre, theLinea.descripcion, theLinea.Usuario_Empresa);
    }
    public EmpresaDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
}