using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            } else
            {
                int userId = Convert.ToInt32(Session["UserId"].ToString());
                UsuarioDAO obj = UsuarioDto.getUsuarioID(userId);
                if (obj != null)
                {
                    NombreUserLabel.Text = obj.Nombre;
                } else
                {
                    Session["UserId"] = null;
                    Response.Redirect("Login.aspx");
                }

                if (Session["EmpresaLinea"] != null)
                {
                    int empresaId = Convert.ToInt32(Session["EmpresaLinea"].ToString());
                    if (empresaId <= 0)
                    {
                        Response.Redirect("ListaEmpresa.aspx");
                    }
                    NombreEmpresa.InnerText = EmpresaDto.GetEmpresaById(empresaId).nombre;                    

                } else
                {
                    NombreEmpresa.InnerText = "Seleccione una Empresa";
                    
                }
            }
        }        
    }

    protected void cerrar_Click(object sender, EventArgs e)
    {
        Session["UserId"] = null;
        Response.Redirect("Login.aspx");
    }
}
