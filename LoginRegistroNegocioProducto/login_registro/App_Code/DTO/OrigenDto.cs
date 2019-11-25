using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de OrigenDto
/// </summary>
public class OrigenDto
{
    public OrigenDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private static OrigenDAO CargarObjecto(OrigenDS.tblOrigenRow row)
    {
        OrigenDAO origen = new OrigenDAO();
        origen.idOrigen = row.idOrigen;
        origen.Nombre = row.Nombre;

        return origen;
    }

    public static OrigenDAO GetPaisById(int origenId)
    {
        if (origenId <= 0)
            throw new ArgumentException("El origenId no puede ser menor o igual que cero");

        OrigenDSTableAdapters.tblOrigenTableAdapter adapter = new OrigenDSTableAdapters.tblOrigenTableAdapter();
        OrigenDS.tblOrigenDataTable table = adapter.pr_GetOrigenById(origenId);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table obtenida no tiene el numero correcto de filas");
        }
        OrigenDAO obj = GetOrigenFromRow(table[0]);
        return obj;
    }




    public static void InsertOrigen(OrigenDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.Nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");



        OrigenDSTableAdapters.tblOrigenTableAdapter adapter = new OrigenDSTableAdapters.tblOrigenTableAdapter();
        adapter.pr_InsertarOrigen(obj.Nombre);


    }

    public static void UpdateOrigen(OrigenDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (obj.idOrigen <= 0)
            throw new ArgumentException("El idProducto no puede ser menor o igual que cero");

        if (string.IsNullOrEmpty(obj.Nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");


        OrigenDSTableAdapters.tblOrigenTableAdapter adapter = new OrigenDSTableAdapters.tblOrigenTableAdapter();
        adapter.pr_updateOrigen(obj.idOrigen, obj.Nombre);
    }




    public static List<OrigenDAO> GetOrigen()
    {
        OrigenDSTableAdapters.tblOrigenTableAdapter adapter = new OrigenDSTableAdapters.tblOrigenTableAdapter();
        OrigenDS.tblOrigenDataTable table = adapter.pr_SelectOrigen();

        List<OrigenDAO> list = new List<OrigenDAO>();
        foreach (var row in table)
        {
            OrigenDAO obj = GetOrigenFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteOrigen(int origenId)
    {
        if (origenId <= 0)
            throw new ArgumentException("El origenId no puede ser menor o igual que cero");

        OrigenDSTableAdapters.tblOrigenTableAdapter adapter = new OrigenDSTableAdapters.tblOrigenTableAdapter();
        adapter.pr_deletedOrigen(origenId);
    }

    private static OrigenDAO GetOrigenFromRow(OrigenDS.tblOrigenRow row)
    {
        return new OrigenDAO()
        {
            idOrigen = row.idOrigen,
            Nombre = row.Nombre
        };
    }


}