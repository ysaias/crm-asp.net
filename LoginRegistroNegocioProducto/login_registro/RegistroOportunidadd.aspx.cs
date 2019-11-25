using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class RegistroCliente : System.Web.UI.Page
{
    public int OportunidadId
    {
        set { RegistroClienteIdHiddenField.Value = value.ToString(); }
        get
        {
            int oportunidadId = 0;
            try
            {
                oportunidadId = Convert.ToInt32(RegistroClienteIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return oportunidadId;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                int userId = Convert.ToInt32(Session["UserId"].ToString());
                ListEjecutivo.SelectedValue = userId.ToString();

            }

            ProcesarParametros();
        }
    }

    private void ProcesarParametros()
    {
        if (Request.QueryString["idOportnidad"] != null && !string.IsNullOrEmpty(Request.QueryString["idOportnidad"]))
        {
            try
            {
                OportunidadId = Convert.ToInt32(Request.QueryString["idOportnidad"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (OportunidadId > 0)
        {
            System.Diagnostics.Debug.WriteLine("Entro aqui " + OportunidadId);
            LabelTitle.Text = "Editar";
            CargarDatos(OportunidadId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int oportunidadId)
    {
        try
        {
            OportunidadDAO obj = OportunidadDto.GetOportunidadById(oportunidadId);
            ListNegocio.Text = obj.idLineadeNegocio.ToString();
            ListProducto.Text = obj.idProducto.ToString();
            descripcionTxt.Text = obj.Descripcion;
            fechaHoraTxt.Text = obj.fechaHora.ToString();
            origenList.Text = obj.idOrigen.ToString();
            clienteList.Text = obj.idCliente.ToString();
            ListEjecutivo.Text = obj.idUsuario.ToString();

        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener la Oportunidad " + ex.Message;
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;

        msgError.Text = "";

        try
        {

            string LineaNegocio = (ListNegocio.Text).Trim();
            string Producto = (ListProducto.Text).Trim();
            string descripcion = (descripcionTxt.Text).Trim();
            string fechaHora = (fechaHoraTxt.Text).Trim();
            string Origen = (origenList.Text).Trim();
            string Cliente = (ListEjecutivo.Text).Trim();
            string Usuario = (clienteList.Text).Trim();
            if (LineaNegocio.Equals("") || Producto.Equals("")
                || descripcion.Equals("") || fechaHora.Equals("")
                || Origen.Equals("") || Cliente.Equals("") || Usuario.Equals(""))
            {
                msgError.Text = "Ingrese todos los campos";
                return;
            }
            if (LineaNegocio.Equals(""))
            {
                msgError.Text = "Ingrese un Nombre";
                return;

            }

            if (Producto.Equals(""))
            {
                msgError.Text = "Ingrese un producto";
                return;

            }

            if (descripcion.Equals(""))
            {
                msgError.Text = "Ingrese una descripcion";
                return;

            }
            if (fechaHora.Equals(""))
            {
                msgError.Text = "Ingrese la fecha";
                return;

            }

            if (Origen.Equals(""))
            {
                msgError.Text = "Ingrese el Origen";
                return;

            }

            if (Cliente.Equals(""))
            {
                msgError.Text = "Ingrese el Cliente";
                return;

            }
            if (Usuario.Equals(""))
            {
                msgError.Text = "Ingrese el Usuario";
                return;

            }
           
            int oportunidadId = this.OportunidadId;
            OportunidadDAO obj = new OportunidadDAO()
            {
                idLineadeNegocio = Convert.ToInt32(LineaNegocio),
                idOportunidad = Convert.ToInt32(Producto),
                Descripcion = descripcion,
                fechaHora = Convert.ToDateTime(fechaHora),
                idOrigen = Convert.ToInt32(Origen),
                idCliente = Convert.ToInt32(Cliente),
                idUsuario = Convert.ToInt32(Usuario)

            };

            if (oportunidadId > 0)
            {
                OportunidadDto.UpdateOportunidad(obj);
            }

            else
                OportunidadDto.InsertOportunidad(obj);
        }
        catch (Exception ex)
        {
            msgError.Text = "Error al optener los datos" + ex.Message;

            MsgLiteral.Text = "Error al guardar el cliente";
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListOportunidad.aspx");

    }

    



    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }

    protected void ListNegocio_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }

    protected void ListProducto_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ListUsuario_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}