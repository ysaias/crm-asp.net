using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de OportunidadDto
/// </summary>
public class OportunidadDto
{
    public OportunidadDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    private static OportunidadDAO CargarObjeto(OportunidadDS.tblOportunidadRow row)
    {

        OportunidadDAO oportunidad = new OportunidadDAO();
        oportunidad.idOportunidad = row.idOportunidad;
        oportunidad.idLineadeNegocio = row.idLineadeNegocio;
        oportunidad.idOportunidad = row.idOportunidad;
        oportunidad.Descripcion = row.Descripcion;
        oportunidad.fechaHora = row.fechaHora;
        oportunidad.idOrigen = row.idOrigen;
        oportunidad.idCliente = row.idCliente;
        oportunidad.idUsuario = row.idUsuario;

        return oportunidad;
    }

    public static OportunidadDAO GetOportunidadById(int idOportunidad)
    {
        if (idOportunidad <= 0)
            throw new ArgumentException("El idCliente no puede ser menor o igual que cero");

        OportunidadDSTableAdapters.tblOportunidadTableAdapter adapter = new OportunidadDSTableAdapters.tblOportunidadTableAdapter();
        OportunidadDS.tblOportunidadDataTable table = adapter.pr_GetOportunidadById(idOportunidad);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table Cliente obtenida no tiene el numero correcto de filas");
        }
        OportunidadDAO obj = GetOportunidadFromRow(table[0]);
        return obj;
    }


    public static void InsertOportunidad(OportunidadDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");


        if (obj.idOportunidad < 0)
            throw new ArgumentException("EL campo Oportunidad no puede ser negativo");

        if (obj.idLineadeNegocio < 0)
            throw new ArgumentException("EL campo Linea de Negocio no puede ser negativo");

        if (obj.idProducto < 0)
            throw new ArgumentException("EL campo Producto no puede ser negativo");

        if (string.IsNullOrEmpty(obj.Descripcion))
            throw new ArgumentException("La Descripcion no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.fechaHora.ToString()))
            throw new ArgumentException("La Hora no puede ser nulo o vacio");

        if (obj.idOrigen < 0)
            throw new ArgumentException("EL Origen no puede ser negativo");

        if (obj.idCliente < 0)
            throw new ArgumentException("EL Cliente no puede ser negativo");

        if (obj.idUsuario < 0)
            throw new ArgumentException("EL Usuario no puede ser negativo");



        OportunidadDSTableAdapters.tblOportunidadTableAdapter adapter = new OportunidadDSTableAdapters.tblOportunidadTableAdapter();
        adapter.pr_InsertarOportunidad(obj.idLineadeNegocio, obj.idProducto, obj.Descripcion, obj.fechaHora, obj.idOrigen, obj.idCliente, obj.idUsuario);


    }

    public static void UpdateOportunidad(OportunidadDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");


        if (obj.idOportunidad < 0)
            throw new ArgumentException("EL campo Oportunidad no puede ser negativo");

        if (obj.idLineadeNegocio < 0)
            throw new ArgumentException("EL campo Linea de Negocio no puede ser negativo");

        if (obj.idProducto < 0)
            throw new ArgumentException("EL campo Producto no puede ser negativo");

        if (string.IsNullOrEmpty(obj.Descripcion))
            throw new ArgumentException("La Descripcion no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.fechaHora.ToString()))
            throw new ArgumentException("La Hora no puede ser nulo o vacio");

        if (obj.idOrigen < 0)
            throw new ArgumentException("EL Origen no puede ser negativo");

        if (obj.idCliente < 0)
            throw new ArgumentException("EL Cliente no puede ser negativo");

        if (obj.idUsuario < 0)
            throw new ArgumentException("EL Usuario no puede ser negativo");



        OportunidadDSTableAdapters.tblOportunidadTableAdapter adapter = new OportunidadDSTableAdapters.tblOportunidadTableAdapter();
        adapter.pr_updateOportunidad(obj.idOportunidad, obj.idLineadeNegocio, obj.idProducto, obj.Descripcion, obj.fechaHora, obj.idOrigen, obj.idCliente, obj.idUsuario);
    }



    public static List<OportunidadDAO> GetCliente()
    {
        OportunidadDSTableAdapters.tblOportunidadTableAdapter adapter = new OportunidadDSTableAdapters.tblOportunidadTableAdapter();
        OportunidadDS.tblOportunidadDataTable table = adapter.pr_SelectOportunidad();

        List<OportunidadDAO> list = new List<OportunidadDAO>();
        foreach (var row in table)
        {
            OportunidadDAO obj = GetOportunidadFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteOportunidad(int oportunidadId)
    {
        if (oportunidadId <= 0)
            throw new ArgumentException("El idCliente no puede ser menor o igual que cero");

        OportunidadDSTableAdapters.tblOportunidadTableAdapter adapter = new OportunidadDSTableAdapters.tblOportunidadTableAdapter();
        adapter.pr_deletedOportunidad(oportunidadId);
    }

    private static OportunidadDAO GetOportunidadFromRow(OportunidadDS.tblOportunidadRow row)
    {
        return new OportunidadDAO()
        {
            idOportunidad = row.idOportunidad,
            idLineadeNegocio = row.idLineadeNegocio,
            idProducto = row.idProducto,
            Descripcion = row.Descripcion,
            fechaHora = row.fechaHora,
            idOrigen = row.idOrigen,
            idCliente = row.idCliente,
            idUsuario = row.idUsuario
        };
    }


}