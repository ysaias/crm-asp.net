using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class RegistroOportunidad : System.Web.UI.Page
{

   public int ClienteId
    {
        set { RegistroOportunidadIdHiddenField.Value = value.ToString(); }
        get
        {
            int clienteId = 0;
            try
            {
                clienteId = Convert.ToInt32(RegistroOportunidadIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return clienteId;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ProcesarParametros();
        }
    }

    private void ProcesarParametros()
    {
        if (Request.QueryString["idCliente"] != null && !string.IsNullOrEmpty(Request.QueryString["idCliente"]))
        {
            try
            {
                ClienteId = Convert.ToInt32(Request.QueryString["idCliente"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (ClienteId > 0)
        {
            System.Diagnostics.Debug.WriteLine("Entro aqui "+ ClienteId );
            LabelTitle.Text = "Editar";
            CargarDatos(ClienteId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int productoId)
    {
        try
        {
            ClienteDAO obj = ClienteDto.GetClienteById(productoId);
            nombreTxt.Text = obj.NombreCompleto;
            correoTxt.Text = obj.correo;
            telefonoTxt.Text = obj.Telefono.ToString();
            celTxt.Text = obj.celular.ToString();
            dirTxt.Text = dirTxt.Text;

        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener el Cliente";
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;
        
            msgError.Text = "";
            string patterCorreo = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$";
            string patterCelular = "\\+[0-9]+";
            string patterTelefono = "[0-9]+";
            string patterNombreCompleto = "[a-zA-Z]+";

        try
        {

            string nombreCompleto = (nombreTxt.Text).Trim();
                string correo = (correoTxt.Text).Trim();
                string telefono = (telefonoTxt.Text).Trim();
                string celular = (celTxt.Text).Trim();
                string direccion = (dirTxt.Text).Trim();
                if (nombreCompleto.Equals("") || correo.Equals("")
                    || telefono.Equals("") || celular.Equals("") 
                    || direccion.Equals("") || direccion.Equals(""))
                {
                    msgError.Text = "Ingrese todos los campos";
                    return;
                }
                if (nombreCompleto.Equals(""))
                {
                    msgError.Text = "Ingrese un Nombre";
                    return;

                }
               
                if (correo.Equals(""))
                {
                    msgError.Text = "Ingrese un Correo";
                    return;

                }
                
                if (telefono.Equals(""))
                {
                    msgError.Text = "Ingrese un Telefono";
                    return;

                }
                if (celular.Equals(""))
                {
                    msgError.Text = "Ingrese un número de celular";
                    return;

                }

                if (direccion.Equals(""))
                {
                    msgError.Text = "Ingrese la Direccion";
                    return;

                }
            if (!Regex.IsMatch(correo, patterCorreo))
                {
                    msgError.Text = "Ingrese un correo valido example@gmail.com o example2@tudominio.net";
                    return;
                }
                if (!Regex.IsMatch(celular, patterCelular) && celular.Length >= 7)
                {
                    msgError.Text = "Ingrese un numero de celular valido ";
                    return;
                }
                if (!Regex.IsMatch(telefono, patterTelefono) && celular.Length >= 7)
                {
                    msgError.Text = "Ingrese un numero de telefono valido";
                    return;
                }
                if (!Regex.IsMatch(nombreCompleto, patterNombreCompleto))
                {
                    msgError.Text = "el nombre solo puede contener letras";
                    return;
                }
               



                int clienteId = this.ClienteId;
               ClienteDAO obj = new ClienteDAO()
            {
                idCliente = clienteId,
                NombreCompleto = nombreCompleto,
                correo = correo,
                Telefono = Convert.ToInt32(telefono),
                celular = Convert.ToInt32(celular),
                Direccion = direccion
                
            };

            if (clienteId > 0)
            {
                ClienteDto.Updatecliente(obj);
            }
                
            else
                ClienteDto.InsertCliente(obj);
        }
        catch (Exception ex)
        {

           

            msgError.Text = "Error al optener los datos" + ex.Message;
        
        MsgLiteral.Text = "Error al guardar el cliente";
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListCliente.aspx");

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


    protected void ListaCiudad_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}