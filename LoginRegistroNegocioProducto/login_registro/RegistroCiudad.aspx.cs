using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroCiudad : System.Web.UI.Page
{
    public int CiudadId
    {
        set { ciudadIdHiddenField.Value = value.ToString(); }
        get
        {
            int ciudadId = 0;
            try
            {
                ciudadId = Convert.ToInt32(ciudadIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return ciudadId;
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
        if (Request.QueryString["idCiudad"] != null && !string.IsNullOrEmpty(Request.QueryString["idCiudad"]))
        {
            try
            {
                CiudadId = Convert.ToInt32(Request.QueryString["idCiudad"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (CiudadId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(CiudadId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int ciudadId)
    {
        try
        {
            CiudadDAO obj = CiudadDto.GetCiudadById(ciudadId);
            NombreTextBox.Text = obj.nombre;
            empresa_LineaNegocioTxt.Text = obj.idPais.ToString();
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
            int pais = Convert.ToInt32(empresa_LineaNegocioTxt.Text);

            int ciudadId = this.CiudadId;
            CiudadDAO obj = new CiudadDAO()
            {
                idCiudad = ciudadId,
                nombre = NombreTextBox.Text,
                idPais = pais
            };

            if (ciudadId > 0)
                CiudadDto.UpdateCiudad(obj);
            else
                CiudadDto.InsertCiudad(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar el Negocio " + ex.Message;
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListaCiudad.aspx");

    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}