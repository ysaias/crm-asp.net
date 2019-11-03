using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EmpresaDto
/// </summary>
public class EmpresaDto
{
    public EmpresaDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private static EmpresaDAO CargarObjecto(EmpresaDS.EmpresaDaoRow row)
    {

        EmpresaDAO empresaDao = new EmpresaDAO();
        empresaDao.empresaId = row.empresaId;
        empresaDao.nombre = row.nombre;
        empresaDao.Descripcion = row.Descripcion;
        empresaDao.UsuarioId = row.UsuarioId;

        return empresaDao;
    }

    public static void InsertEmpresa(EmpresaDAO theEmpresa)
    {
        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        adapter.pr_insertarEmpresa(theEmpresa.nombre, theEmpresa.Descripcion, theEmpresa.UsuarioId);
    }


}