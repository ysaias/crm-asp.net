using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClienteDto
/// </summary>
public class ClienteDto
{
    public ClienteDto()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    private static ClienteDAO CargarObjeto(ClienteDS.tblClienteRow row)
    {

        ClienteDAO cliente = new ClienteDAO();
        cliente.idCliente = row.idCliente;
        cliente.NombreCompleto = row.NombreCompleto;
        cliente.correo = row.correo;
        cliente.Telefono = row.Telefono;
        cliente.celular = row.celular;
        cliente.Direccion = row.Direccion;
        cliente.idCiudad = row.idCiudad;

        return cliente;
    }

    public static ClienteDAO GetClienteById(int idcliente)
    {
        if (idcliente <= 0)
            throw new ArgumentException("El idCliente no puede ser menor o igual que cero");

        ClienteDSTableAdapters.tblClienteTableAdapter adapter = new ClienteDSTableAdapters.tblClienteTableAdapter();
         ClienteDS.tblClienteDataTable table = adapter.pr_GetClienteById(idcliente);

        if (table == null || table.Rows.Count != 1)
        {
            throw new Exception("La table Cliente obtenida no tiene el numero correcto de filas");
        }
        ClienteDAO obj = GetClienteFromRow(table[0]);
        return obj;
    }


    public static void InsertCliente(ClienteDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.NombreCompleto))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.correo))
            throw new ArgumentException("El correo no puede ser nulo o vacio");

        if (obj.Telefono < 0)
            throw new ArgumentException("EL campo no puede ser negativo");

        if (obj.celular < 0)
            throw new ArgumentException("EL campo no puede ser negativo");

        if (string.IsNullOrEmpty(obj.Direccion))
            throw new ArgumentException("La direccion no puede ser nulo o vacio");

        if (obj.idCiudad < 0)
            throw new ArgumentException("EL campo no puede ser negativo");



        ClienteDSTableAdapters.tblClienteTableAdapter adapter = new ClienteDSTableAdapters.tblClienteTableAdapter();
        adapter.pr_insertarCliente(obj.NombreCompleto, obj.correo, obj.Telefono, obj.celular, obj.Direccion, obj.idCiudad);


    }

    public static void Updatecliente(ClienteDAO obj)
    {
        if (obj == null)
            throw new ArgumentException("El objeto a insertar no puede ser nulo");

        if (string.IsNullOrEmpty(obj.NombreCompleto))
            throw new ArgumentException("El nombre no puede ser nulo o vacio");

        if (string.IsNullOrEmpty(obj.correo))
            throw new ArgumentException("El correo no puede ser nulo o vacio");

        if (obj.Telefono < 0)
            throw new ArgumentException("EL campo no puede ser negativo");

        if (obj.celular < 0)
            throw new ArgumentException("EL campo no puede ser negativo");

        if (string.IsNullOrEmpty(obj.Direccion))
            throw new ArgumentException("La direccion no puede ser nulo o vacio");

        if (obj.idCiudad < 0)
            throw new ArgumentException("EL campo no puede ser negativo");



        ClienteDSTableAdapters.tblClienteTableAdapter adapter = new ClienteDSTableAdapters.tblClienteTableAdapter();
        adapter.pr_updateCliente(obj.idCliente, obj.NombreCompleto, obj.correo, obj.Telefono, obj.celular, obj.Direccion, obj.idCiudad);
    }



    public static List<ClienteDAO> GetCliente()
    {
        ClienteDSTableAdapters.tblClienteTableAdapter adapter = new ClienteDSTableAdapters.tblClienteTableAdapter();
        ClienteDS.tblClienteDataTable table = adapter.pr_SelectCliente();

        List<ClienteDAO> list = new List<ClienteDAO>();
        foreach (var row in table)
        {
            ClienteDAO obj = GetClienteFromRow(row);
            list.Add(obj);
        }
        return list;
    }

    public static void DeleteEmpresa(int empresaId)
    {
        if (empresaId <= 0)
            throw new ArgumentException("El idCliente no puede ser menor o igual que cero");

        EmpresaDSTableAdapters.EmpresaDaoTableAdapter adapter = new EmpresaDSTableAdapters.EmpresaDaoTableAdapter();
        adapter.pr_deletedEmpresa(empresaId);
    }

    private static ClienteDAO GetClienteFromRow(ClienteDS.tblClienteRow row)
    {
        return new ClienteDAO()
        {
            idCliente  = row.idCliente,
            NombreCompleto = row.NombreCompleto,
            correo = row.correo,
            Telefono = row.Telefono,
            celular = row.celular,
            Direccion = row.Direccion,
            idCiudad = row.idCiudad
        };
    }


}