using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ActividadDto
/// </summary>
public class ActividadDto
{
    public ActividadDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private static ActividadDAO CargarObjeto(ActividadDS.tblActividadRow row)
    {

        ActividadDAO actividad = new ActividadDAO();
        actividad.idActivdad = row.idActividad;
        actividad.fecha = row.Fecha.ToString();
        actividad.hora = row.Hora.ToString();
        actividad.descripcion = row.Descripcion;
        actividad.idMedio = row.idMedio;
        actividad.idOportunidad = row.idOportunidad;

        return actividad;
    }

    public static ActividadDAO GetActividadById(int idActividad)
    {
        if (idActividad <= 0)
            throw new ArgumentException("El idCliente no puede ser menor o igual que cero");

        ActividadDSTableAdapters.tblActividadTableAdapter adapter = new ActividadDSTableAdapters.tblActividadTableAdapter();
        ActividadDS.tblActividadDataTable table = adapter.pr_GetActividadById(idActividad);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table Cliente obtenida no tiene el numero correcto de filas");
        }
        ActividadDAO obj = GetActividadFromRow(table[0]);
        return obj;
    }


    public static void InsertActividad(ActividadDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");


        if (obj.idActivdad < 0)
            throw new ArgumentException("EL campo Actividad no puede ser negativo");

        if (string.IsNullOrEmpty(obj.fecha))
            throw new ArgumentException("La fecha no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.hora))
            throw new ArgumentException("La Hora no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.descripcion))
            throw new ArgumentException("La Descripcion no puede ser nulo o vacio");

        if (obj.idMedio < 0)
            throw new ArgumentException("EL campo MedioId no puede ser negativo");

        if (obj.idOportunidad < 0)
            throw new ArgumentException("EL campo Oportunidad no puede ser negativo");


        ActividadDSTableAdapters.tblActividadTableAdapter adapter = new ActividadDSTableAdapters.tblActividadTableAdapter();
        adapter.pr_InsertarActividad(Convert.ToDateTime(obj.fecha), Convert.ToDateTime(obj.hora), obj.descripcion, obj.idMedio, obj.idOportunidad);


    }

    public static void UpdateActividad(ActividadDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");


        if (obj.idActivdad < 0)
            throw new ArgumentException("EL campo Actividad no puede ser negativo");

        if (string.IsNullOrEmpty(obj.fecha))
            throw new ArgumentException("La fecha no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.hora))
            throw new ArgumentException("La Hora no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.descripcion))
            throw new ArgumentException("La Descripcion no puede ser nulo o vacio");

        if (obj.idMedio < 0)
            throw new ArgumentException("EL campo MedioId no puede ser negativo");

        if (obj.idOportunidad < 0)
            throw new ArgumentException("EL campo Oportunidad no puede ser negativo");


        ActividadDSTableAdapters.tblActividadTableAdapter adapter = new ActividadDSTableAdapters.tblActividadTableAdapter();
        adapter.pr_updateActividad(obj.idActivdad, Convert.ToDateTime(obj.fecha), Convert.ToDateTime(obj.hora), obj.descripcion, obj.idMedio, obj.idOportunidad);
    }



    public static List<ActividadDAO> GetOportunidad()
    {
        ActividadDSTableAdapters.tblActividadTableAdapter adapter = new ActividadDSTableAdapters.tblActividadTableAdapter();
        ActividadDS.tblActividadDataTable table = adapter.pr_GetSelectMedio();

        List<ActividadDAO> list = new List<ActividadDAO>();
        foreach (var row in table)
        {
            ActividadDAO obj = GetActividadFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteActvidad(int actividadId)
    {
        if (actividadId <= 0)
            throw new ArgumentException("El idCliente no puede ser menor o igual que cero");

        ActividadDSTableAdapters.tblActividadTableAdapter adapter = new ActividadDSTableAdapters.tblActividadTableAdapter();
        adapter.pr_deletedActividad(actividadId);
    }

    private static ActividadDAO GetActividadFromRow(ActividadDS.tblActividadRow row)
    {
        return new ActividadDAO()
        {
            idActivdad = row.idActividad,
            fecha = row.Fecha.ToString(),
            hora = row.Hora.ToString(),
            descripcion = row.Descripcion,
            idMedio = row.idMedio,
            idOportunidad = row.idOportunidad
        };
    }


}