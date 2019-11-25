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


    private static LineaNegocioDAO CargarObjecto(LineaNegocioDS.tblLineaNegocioDaoRow row)
    {

        LineaNegocioDAO negocio = new LineaNegocioDAO();
        negocio.idLineaNegocio = row.idLineaNegocio;
        negocio.nombre = row.nombre;
        negocio.descripcion = row.descripcion;
        negocio.empresaId = row.empresaId;

        return negocio;
    }

    public static LineaNegocioDAO GetLineaNegocioById(int negocioId)
    {
        if (negocioId <= 0)
            throw new ArgumentException("El idNegocio no puede ser menor o igual que cero");

        LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter adapter = new LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter();
        LineaNegocioDS.tblLineaNegocioDaoDataTable table = adapter.pr_GetLineaNegocioById(negocioId);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table obtenida no tiene el numero correcto de filas");
        }
        LineaNegocioDAO obj = GetLineaNegocioFromRow(table[0]);
        return obj;
    }



    public static void InsertProducto(LineaNegocioDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.descripcion))
            throw new ArgumentException("La descripcion no puede ser nulo o vacio");

        if (obj.empresaId < 0)
            throw new ArgumentException("EL campo empresa no puede ser negativo");


        LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter adapter = new LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter();
        adapter.pr_InsertLineaNegocio(obj.nombre, obj.descripcion, obj.empresaId);


    }

    public static void UpdateProducto(LineaNegocioDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (obj.idLineaNegocio <= 0)
            throw new ArgumentException("El idNegocio no puede ser menor o igual que cero");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.descripcion))
            throw new ArgumentException("La descripcion no puede ser nulo o vacio");

        if (obj.empresaId < 0)
            throw new ArgumentException("El Negocio no puede ser negativo");

        LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter adapter = new LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter();
        adapter.pr_updateLineaNegocio(obj.idLineaNegocio, obj.nombre, obj.descripcion, obj.empresaId);
    }




    public static List<LineaNegocioDAO> GetLineaNegocios()
    {
        LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter adapter = new LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter();
        LineaNegocioDS.tblLineaNegocioDaoDataTable table = adapter.pr_SelectLineaNegocio();

        List<LineaNegocioDAO> list = new List<LineaNegocioDAO>();
        foreach (var row in table)
        {
            LineaNegocioDAO obj = GetLineaNegocioFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static List<LineaNegocioDAO> GetLineaNegociosByIdEmpresa(int empreaId)
    {
        LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter adapter = new LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter();
        LineaNegocioDS.tblLineaNegocioDaoDataTable table = adapter.Pr_SelectLineaNegocioByIdEmpresa(empreaId);

        List<LineaNegocioDAO> list = new List<LineaNegocioDAO>();
        foreach (var row in table)
        {
            LineaNegocioDAO obj = GetLineaNegocioFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteLineaNegocio(int negocioId)
    {
        if (negocioId <= 0)
            throw new ArgumentException("El negocioId no puede ser menor o igual que cero");

        LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter adapter = new LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter();
        adapter.pr_deletedLineaNegocio(negocioId);
    }

    private static LineaNegocioDAO GetLineaNegocioFromRow(LineaNegocioDS.tblLineaNegocioDaoRow row)
    {
        return new LineaNegocioDAO()
        {
            idLineaNegocio = row.idLineaNegocio,
            nombre = row.nombre,
            descripcion = row.descripcion,
            empresaId = row.empresaId
        };
    }


}