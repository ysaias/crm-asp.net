﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistroProducto : System.Web.UI.Page
{
    public int ProductoId
    {
        set { ProductoIdHiddenField.Value = value.ToString(); }
        get
        {
            int productoId = 0;
            try
            {
                productoId = Convert.ToInt32(ProductoIdHiddenField.Value);
            }
            catch (Exception ex)
            {

            }
            return productoId;
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
        if (Request.QueryString["idProducto"] != null && !string.IsNullOrEmpty(Request.QueryString["idProducto"]))
        {
            try
            {
                ProductoId = Convert.ToInt32(Request.QueryString["idProducto"]);
            }
            catch (Exception ex)
            {

            }
        }
        if (ProductoId > 0)
        {
            System.Diagnostics.Debug.WriteLine("Entro aqui "+ ProductoId );
            LabelTitle.Text = "Editar";
            CargarDatos(ProductoId);
        }
        else
            LabelTitle.Text = "Nuevo";
    }

    private void CargarDatos(int productoId)
    {
        try
        {
            ProductoDAO obj = ProductoDto.GetProductoById(productoId);
            NombreTextBox.Text = obj.nombre;
            descripcionTextBox.Text = obj.descripcion;
            negocioTextBox.Text = obj.LineaNegocio_Producto.ToString();
           

        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al obtener el Producto";
            PanelError.Visible = true;
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        PanelError.Visible = false;
        try
        {
            int negocio = Convert.ToInt32(negocioTextBox.Text);

            int productoId = this.ProductoId;
            ProductoDAO obj = new ProductoDAO()
            {
                idProducto = productoId,
                nombre = NombreTextBox.Text,
                descripcion = descripcionTextBox.Text,
                LineaNegocio_Producto = negocio
            };

            if (productoId > 0)
                ProductoDto.UpdateProducto(obj);
            else
                ProductoDto.InsertProducto(obj);
        }
        catch (Exception ex)
        {
            MsgLiteral.Text = "Error al guardar el producto";
            PanelError.Visible = true;
            return;
        }

        Response.Redirect("ListProductos.aspx");

    }
}