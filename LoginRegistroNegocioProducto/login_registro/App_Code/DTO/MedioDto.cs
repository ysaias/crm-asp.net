using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de MedioDto
/// </summary>
public class MedioDto
{
    public MedioDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private static MedioDAO CargarObjecto(MedioDS.tblMedioRow row)
    {
        MedioDAO medio = new MedioDAO();
        medio.idMedio = row.idMedio;
        medio.Nombre = row.Nombre;

        return medio;
    }

    public static MedioDAO GetMedioById(int medioId)
    {
        if (medioId <= 0)
            throw new ArgumentException("La ciudadId no puede ser menor o igual que cero");

        MedioDSTableAdapters.tblMedioTableAdapter adapter = new MedioDSTableAdapters.tblMedioTableAdapter();
        MedioDS.tblMedioDataTable table = adapter.pr_GetMedioById(medioId);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table obtenida no tiene el numero correcto de filas");
        }
        MedioDAO obj = GetMedioFromRow(table[0]);
        return obj;
    }




    public static void InsertMedio(MedioDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.Nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");



        MedioDSTableAdapters.tblMedioTableAdapter adapter = new MedioDSTableAdapters.tblMedioTableAdapter();
        adapter.pr_insertarMedio(obj.Nombre);


    }

    public static void UpdateMedio(MedioDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (obj.idMedio <= 0)
            throw new ArgumentException("El idProducto no puede ser menor o igual que cero");

        if (string.IsNullOrEmpty(obj.Nombre))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");


        MedioDSTableAdapters.tblMedioTableAdapter adapter = new MedioDSTableAdapters.tblMedioTableAdapter();
        adapter.pr_updateMedio(obj.idMedio, obj.Nombre);
    }




    public static List<MedioDAO> GetMedioList()
    {
        MedioDSTableAdapters.tblMedioTableAdapter adapter = new MedioDSTableAdapters.tblMedioTableAdapter();
        MedioDS.tblMedioDataTable table = adapter.pr_getSelectMedio();

        List<MedioDAO> list = new List<MedioDAO>();
        foreach (var row in table)
        {
            MedioDAO obj = GetMedioFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteMedio(int medioId)
    {
        if (medioId <= 0)
            throw new ArgumentException("El idMedio no puede ser menor o igual que cero");

        MedioDSTableAdapters.tblMedioTableAdapter adapter = new MedioDSTableAdapters.tblMedioTableAdapter();
        adapter.pr_deletedMedio(medioId);
    }

    private static MedioDAO GetMedioFromRow(MedioDS.tblMedioRow row)
    {
        return new MedioDAO()
        {
            idMedio = row.idMedio,
            Nombre = row.Nombre
        };
    }


}