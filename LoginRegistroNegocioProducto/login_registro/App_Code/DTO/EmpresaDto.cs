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


    private static EmpresaDAO CargarObjeto(EmpresaDS.EmpresaDaoRow row)
    {

        EmpresaDAO empresa = new EmpresaDAO();
        empresa.empresaId = row.empresaId;
        empresa.nombre = row.nombre;
        empresa.Descripcion = row.Descripcion;
        empresa.telefono = row.telefono;
        empresa.email = row.email;
        empresa.UsuarioId = row.UsuarioId;

        return empresa;
    }

    public static EmpresaDAO GetEmpresaById(int empresaId)
    {
        if (empresaId <= 0)
            throw new ArgumentException("El idEmpresa no puede ser menor o igual que cero");

        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        EmpresaDS.EmpresaDaoDataTable table = adapter.pr_selectEmpresaById(empresaId);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table obtenida no tiene el numero correcto de filas");
        }
        EmpresaDAO obj = GetEmpresaFromRow(table[0]);
        return obj;
    }




    public static void InsertEmpresa(EmpresaDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.Descripcion))
            throw new ArgumentException("La descripcion no puede ser nulo o vacio");

        if (obj.telefono < 0)
            throw new ArgumentException("EL campo no puede ser negativo");

        if (string.IsNullOrEmpty(obj.email))
            throw new ArgumentException("El email no puede ser nulo o vacio");

        if (obj.UsuarioId < 0)
            throw new ArgumentException("EL campo Usuario no puede ser negativo");


        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        adapter.pr_insertarEmpresa(obj.nombre, obj.Descripcion, obj.telefono, obj.email, obj.UsuarioId);


    }

    public static void UpdateEmpresa(EmpresaDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (obj.empresaId <= 0)
            throw new ArgumentException("El idEmpresa no puede ser menor o igual que cero");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.Descripcion))
            throw new ArgumentException("La descripcion no puede ser nulo o vacio");

        if (obj.telefono < 0)
            throw new ArgumentException("EL campo no puede ser negativo");

        if (string.IsNullOrEmpty(obj.email))
            throw new ArgumentException("El email no puede ser nulo o vacio");

        if (obj.UsuarioId < 0)
            throw new ArgumentException("El idUsuario no puede ser negativo");

        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        adapter.pr_updateEmpresa(obj.empresaId, obj.nombre, obj.Descripcion, obj.telefono, obj.email, obj.UsuarioId);
    }




    public static List<EmpresaDAO> GetEmpresas()
    {
        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        EmpresaDS.EmpresaDaoDataTable table = adapter.pr_SelectEmpresa();

        List<EmpresaDAO> list = new List<EmpresaDAO>();
        foreach (var row in table)
        {
            EmpresaDAO obj = GetEmpresaFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static List<EmpresaDAO> GetEmpresasByIdUsuario(int idUsuario)
    {
        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        EmpresaDS.EmpresaDaoDataTable table = adapter.Pr_SelectEmpresaByIdUsuario(idUsuario);

        List<EmpresaDAO> list = new List<EmpresaDAO>();
        foreach (var row in table)
        {
            EmpresaDAO obj = GetEmpresaFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteEmpresa(int empresaId)
    {
        if (empresaId <= 0)
            throw new ArgumentException("El idEmpresa no puede ser menor o igual que cero");

        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        adapter.pr_deletedEmpresa(empresaId);
    }

    private static EmpresaDAO GetEmpresaFromRow(EmpresaDS.EmpresaDaoRow row)
    {
        return new EmpresaDAO()
        {
            empresaId   = row.empresaId,
            nombre = row.nombre,
            Descripcion = row.Descripcion,
            telefono = row.telefono,
            email = row.email,
            UsuarioId = row.UsuarioId            
        };
    }


}