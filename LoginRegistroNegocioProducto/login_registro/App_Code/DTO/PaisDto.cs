using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de PaisDto
/// </summary>
public class PaisDto
{
    public PaisDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private static PaisDAO CargarObjecto(PaisDS.tblPaisRow row)
    {
        PaisDAO pais = new PaisDAO();
        pais.paisId = row.idPais;
        pais.nombre = row.nombre;

        return pais;
    }

    public static PaisDAO GetPaisById(int paisId)
    {
        if (paisId <= 0)
            throw new ArgumentException("El paisId no puede ser menor o igual que cero");

        PaisDSTableAdapters.tblPaisTableAdapter adapter = new PaisDSTableAdapters.tblPaisTableAdapter();
        PaisDS.tblPaisDataTable table = adapter.pr_getPaisById(paisId);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table obtenida no tiene el numero correcto de filas");
        }
        PaisDAO obj = GetPaisFromRow(table[0]);
        return obj;
    }




    public static void InsertPais(PaisDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");



        PaisDSTableAdapters.tblPaisTableAdapter adapter = new PaisDSTableAdapters.tblPaisTableAdapter();
        adapter.pr_insertarPais(obj.nombre);


    }

    public static void UpdatePais(PaisDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (obj.paisId <= 0)
            throw new ArgumentException("El idProducto no puede ser menor o igual que cero");

        if (string.IsNullOrEmpty(obj.nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");


        PaisDSTableAdapters.tblPaisTableAdapter adapter = new PaisDSTableAdapters.tblPaisTableAdapter();
        adapter.pr_updatePais(obj.paisId, obj.nombre);
    }




    public static List<PaisDAO> GetPais()
    {
        PaisDSTableAdapters.tblPaisTableAdapter adapter = new PaisDSTableAdapters.tblPaisTableAdapter();
        PaisDS.tblPaisDataTable table = adapter.pr_SelectPais();

        List<PaisDAO> list = new List<PaisDAO>();
        foreach (var row in table)
        {
            PaisDAO obj = GetPaisFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeletePais(int paisId)
    {
        if (paisId <= 0)
            throw new ArgumentException("El paisId no puede ser menor o igual que cero");

        PaisDSTableAdapters.tblPaisTableAdapter adapter = new PaisDSTableAdapters.tblPaisTableAdapter();
        adapter.pr_deletedPais(paisId);
    }

    private static PaisDAO GetPaisFromRow(PaisDS.tblPaisRow row)
    {
        return new PaisDAO()
        {
            paisId = row.idPais,
            nombre = row.nombre
        };
    }


}