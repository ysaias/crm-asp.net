using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class RegistroActividad : System.Web.UI.Page
{
    public int ActividadId
    {
        set { RegistroActividadIdHiddenField.Value = value.ToString(); }
        get
        {
            int actividadId = 0;
            try
            {
                actividadId = Convert.ToInt32(RegistroActividadIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return actividadId;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null && Session["EmpresaId"] != null )
            {
                int userId = Convert.ToInt32(Session["UserId"].ToString());
                int empresaId = Convert.ToInt32(Session["EmpresaId"].ToString());
                int oportunidadId = Convert.ToInt32(Session["OportunidadId"].ToString());
                //ListEjecutivo.SelectedValue = userId.ToString();
                //medio_Txt.DataSource = MedioDto.GetMedioList();
                //medio_Txt.DataBind();
                OportunidadidLabel.Text = oportunidadId.ToString();


            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            

            ProcesarParametros();
        }
    }

    private void ProcesarParametros()
    {
        if (Request.QueryString["idActividad"] != null && !string.IsNullOrEmpty(Request.QueryString["idActividad"]))
        {
            try
            {
                ActividadId = Convert.ToInt32(Request.QueryString["idActividad"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (ActividadId > 0)
        {
            LabelTitle.Text = "Editar";
            CargarDatos(ActividadId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int actividadId)
    {
        try
        {
            ActividadDAO obj = ActividadDto.GetActividadById(actividadId);
            from_date.Text = obj.fecha.ToString();
            from_time.Text = obj.hora.ToString();
            descripcionTxt.Text = obj.descripcion;
            medio_Txt.Text = obj.idMedio.ToString();
            OportunidadidLabel.Text = obj.idOportunidad.ToString();

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

            string fecha = (from_date.Text).Trim();
            string hora = (from_time.Text).Trim();
            string descripcion = (descripcionTxt.Text).Trim();
            string medio = (medio_Txt.Text).Trim();
            string oportunidad = (OportunidadidLabel.Text).Trim();
            if (fecha.Equals("") || hora.Equals("")
                || descripcion.Equals("")
                || medio.Equals("") || oportunidad.Equals("") )
            {
                msgError.Text = "Ingrese todos los campos";
                return;
            }
            if (fecha.Equals(""))
            {
                msgError.Text = "Ingrese la Fecha Correctamente";
                return;

            }

            if (hora.Equals(""))
            {
                msgError.Text = "Ingrese la Hora Correctamente";
                return;

            }

            if (descripcion.Equals(""))
            {
                msgError.Text = "Ingrese una descripcion";
                return;

            }
            if (medio.Equals(""))
            {
                msgError.Text = "Ingrese el medio";
                return;

            }

            if (oportunidad.Equals(""))
            {
                msgError.Text = "Ingrese la oportunidad";
                return;

            }
            
            int actividadID = this.ActividadId;
            ActividadDAO obj = new ActividadDAO()
            {
                idActivdad = ActividadId,
                fecha = fecha,
                hora = hora,
                descripcion = descripcion,                
                idMedio = Convert.ToInt32(medio),
                idOportunidad = Convert.ToInt32(oportunidad)

            };

            if (actividadID > 0)
            {
                ActividadDto.UpdateActividad(obj);
            }

            else
                ActividadDto.InsertActividad(obj);
        }
        catch (Exception ex)
        {
            msgError.Text = "Error al optener los datos" + ex.Message;

            MsgLiteral.Text = "Error al guardar la oportunidad";
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListActividad.aspx");

    }

   
    

    protected void ObjectDataSource1_Selecting1(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}