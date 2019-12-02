using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroMedio : System.Web.UI.Page
{
    public int MedioId
    {
        set { ciudadIdHiddenField.Value = value.ToString(); }
        get
        {
            int medioId = 0;
            try
            {
                medioId = Convert.ToInt32(ciudadIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return medioId;
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
        if (Request.QueryString["idMedio"] != null && !string.IsNullOrEmpty(Request.QueryString["idMedio"]))
        {
            try
            {
                MedioId = Convert.ToInt32(Request.QueryString["idMedio"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (MedioId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(MedioId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int medioId)
    {
        try
        {
            MedioDAO obj = MedioDto.GetMedioById(medioId);
            NombreTextBox.Text = obj.Nombre;
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener el Negocio " + ex.Message;
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;
        try
        {

            int medioId = this.MedioId;
            MedioDAO obj = new MedioDAO()
            {
                idMedio = medioId,
                Nombre = NombreTextBox.Text
            };

            if (medioId > 0)
                MedioDto.UpdateMedio(obj);
            else
                MedioDto.InsertMedio(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar el Negocio " + ex.Message;
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListaMedio.aspx");

    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}