using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroLineaNegocio : System.Web.UI.Page
{
    public int NegocioId
    {
        set { NegocioIdHiddenField.Value = value.ToString(); }
        get
        {
            int negocioId = 0;
            try
            {
                negocioId = Convert.ToInt32(NegocioIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return negocioId;
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
        if (Request.QueryString["idLineaNegocio"] != null && !string.IsNullOrEmpty(Request.QueryString["idLineaNegocio"]))
        {
            try
            {
                NegocioId = Convert.ToInt32(Request.QueryString["idLineaNegocio"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (NegocioId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(NegocioId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int productoId)
    {
        try
        {
            LineaNegocioDAO obj = LineaNegocioDto.GetProductoById(productoId);
            NombreTextBox.Text = obj.nombre;
            descripcionTextBox.Text = obj.descripcion;
            empresa_LineaNegocioTxt.Text = obj.empresaId.ToString();
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener el Negocio";
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;
        try
        {
            int empresa = Convert.ToInt32(empresa_LineaNegocioTxt.Text);

            int negocioId = this.NegocioId;
            LineaNegocioDAO obj = new LineaNegocioDAO()
            {
                idLineaNegocio = negocioId,
                nombre = NombreTextBox.Text,
                descripcion = descripcionTextBox.Text,
                empresaId = empresa
            };

            if (negocioId > 0)
                LineaNegocioDto.UpdateProducto(obj);
            else
                LineaNegocioDto.InsertProducto(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar el Negocio";
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListaLineaNegocio.aspx");

    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}