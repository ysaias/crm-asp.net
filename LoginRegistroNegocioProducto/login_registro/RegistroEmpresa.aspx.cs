using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroEmpresa : System.Web.UI.Page
{
    

    public int EmpresaId
    {

        set { EmpresaIdHiddenField.Value = value.ToString(); }
        get
        {
            int empresaId = 0;
            try
            {
                empresaId = Convert.ToInt32(EmpresaIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return empresaId;
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
        if (Request.QueryString["empresaId"] != null && !string.IsNullOrEmpty(Request.QueryString["empresaId"]))
        {
            try
            {
                EmpresaId = Convert.ToInt32(Request.QueryString["empresaId"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (EmpresaId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(EmpresaId);
        }
        else
           
            LabelTitle.Text = "Nueva";
    }

    private void CargarDatos(int empresaId)
    {
        try
        {
            EmpresaDAO obj = EmpresaDto.GetEmpresaById(empresaId);
            NombreTextBox.Text = obj.nombre;
            descripcionTextBox.Text = obj.Descripcion;
            telefonoTextBox.Text = obj.telefono.ToString();
            emailTextBox.Text = obj.email;

            

        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener la empresa";
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;
        try
        {

            
            int usuarioID = Convert.ToInt32(Session["UserId"]);

            int empresaId = this.EmpresaId;
            EmpresaDAO obj = new EmpresaDAO()
            {
                empresaId = empresaId,
                nombre = NombreTextBox.Text,
                Descripcion = descripcionTextBox.Text,
                telefono = Convert.ToInt32(telefonoTextBox.Text),
                email = emailTextBox.Text,
                UsuarioId = usuarioID
            };

            if (empresaId > 0)
                EmpresaDto.UpdateEmpresa(obj);
            else
                EmpresaDto.InsertEmpresa(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar la mepresa" + ex;
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListaEmpresa.aspx");

    }

    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}