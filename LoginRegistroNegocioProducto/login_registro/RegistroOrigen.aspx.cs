using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroOrigen : System.Web.UI.Page
{
    public int OrigenId
    {
        set { origenIdHiddenField.Value = value.ToString(); }
        get
        {
            int origenId = 0;
            try
            {
                origenId = Convert.ToInt32(origenIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return origenId;
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
        if (Request.QueryString["idOrigen"] != null && !string.IsNullOrEmpty(Request.QueryString["idOrigen"]))
        {
            try
            {
                OrigenId = Convert.ToInt32(Request.QueryString["idOrigen"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (OrigenId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(OrigenId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int origenId)
    {
        try
        {
            OrigenDAO obj = OrigenDto.GetPaisById(origenId);
            NombreTextBox.Text = obj.Nombre;
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener el Origen " + ex.Message;
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;
        try
        {

            int origenId = this.OrigenId;
            OrigenDAO obj = new OrigenDAO()
            {
                idOrigen = origenId,
                Nombre = NombreTextBox.Text
            };

            if (origenId > 0)
                OrigenDto.UpdateOrigen(obj);
            else
                OrigenDto.InsertOrigen(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar el Origen "+ ex.Message;
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListaOrigen.aspx");

    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}