using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroPais : System.Web.UI.Page
{
    public int PaisId
    {
        set { paisIdHiddenField.Value = value.ToString(); }
        get
        {
            int paisId = 0;
            try
            {
                paisId = Convert.ToInt32(paisIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return paisId;
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
        if (Request.QueryString["paisId"] != null && !string.IsNullOrEmpty(Request.QueryString["paisId"]))
        {
            try
            {
                PaisId = Convert.ToInt32(Request.QueryString["paisId"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (PaisId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(PaisId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int paisId)
    {
        try
        {
            PaisDAO obj = PaisDto.GetPaisById(paisId);
            NombreTextBox.Text = obj.nombre;
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

            int paisId = this.PaisId;
            PaisDAO obj = new PaisDAO()
            {
                paisId = paisId,
                nombre = NombreTextBox.Text
            };

            if (paisId > 0)
                PaisDto.UpdatePais(obj);
            else
                PaisDto.InsertPais(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar el Negocio "+ ex.Message;
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListaPais.aspx");

    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}