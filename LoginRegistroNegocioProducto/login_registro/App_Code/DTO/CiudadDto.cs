using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de CiudadDto
/// </summary>
public class CiudadDto
{
    public CiudadDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private static CiudadDAO CargarObjecto(CiudadDS.tblCiudadRow row)
    {
        CiudadDAO ciudad = new CiudadDAO();
        ciudad.idCiudad = row.idCiudad;
        ciudad.nombre = row.nombre;
        ciudad.idPais = row.idPais;

        return ciudad;
    }

    public static CiudadDAO GetCiudadById(int ciudadId)
    {
        if (ciudadId <= 0)
            throw new ArgumentException("La ciudadId no puede ser menor o igual que cero");

        CiudadDSTableAdapters.tblCiudadTableAdapter adapter = new CiudadDSTableAdapters.tblCiudadTableAdapter();
        CiudadDS.tblCiudadDataTable table = adapter.pr_GetCiudadById(ciudadId);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table obtenida no tiene el numero correcto de filas");
        }
        CiudadDAO obj = GetCiudadFromRow(table[0]);
        return obj;
    }




    public static void InsertCiudad(CiudadDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (obj.idPais < 0)
            throw new ArgumentException("El paisId no puede ser negativo");



        CiudadDSTableAdapters.tblCiudadTableAdapter adapter = new CiudadDSTableAdapters.tblCiudadTableAdapter();
        adapter.pr_insertarCiudad(obj.nombre, obj.idPais);


    }

    public static void UpdateCiudad(CiudadDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (obj.idCiudad <= 0)
            throw new ArgumentException("El idProducto no puede ser menor o igual que cero");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");


        if (obj.idPais < 0)
            throw new ArgumentException("El idPais no puede ser negativo");


        CiudadDSTableAdapters.tblCiudadTableAdapter adapter = new CiudadDSTableAdapters.tblCiudadTableAdapter();
        adapter.pr_updateCiudad(obj.idCiudad, obj.nombre, obj.idPais);
    }




    public static List<CiudadDAO> GetCiudad()
    {
        CiudadDSTableAdapters.tblCiudadTableAdapter adapter = new CiudadDSTableAdapters.tblCiudadTableAdapter();
        CiudadDS.tblCiudadDataTable table = adapter.pr_SelectCiudad();

        List<CiudadDAO> list = new List<CiudadDAO>();
        foreach (var row in table)
        {
            CiudadDAO obj = GetCiudadFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteCiudad(int ciudadId)
    {
        if (ciudadId <= 0)
            throw new ArgumentException("El idCiudad no puede ser menor o igual que cero");

        CiudadDSTableAdapters.tblCiudadTableAdapter adapter = new CiudadDSTableAdapters.tblCiudadTableAdapter();
        adapter.pr_deletedCiudad(ciudadId);
    }

    private static CiudadDAO GetCiudadFromRow(CiudadDS.tblCiudadRow row)
    {
        return new CiudadDAO()
        {
            idCiudad = row.idCiudad,
            nombre = row.nombre,
            idPais = row.idPais
        };
    }


}