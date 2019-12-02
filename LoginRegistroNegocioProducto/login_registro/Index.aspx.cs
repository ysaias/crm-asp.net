﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            Response.Redirect("ListaEmpresa.aspx");
        }
        
           
    }


    protected void cerrar_Click(object sender, EventArgs e)
    {
        Session["UserId"] = null;
        Response.Redirect("Login.aspx");
    }
}