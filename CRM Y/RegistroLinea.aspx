﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroLinea.aspx.cs" Inherits="RegistroProducto" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html>
<head>
        <meta charset='utf-8'>
        <title>Registro Producto</title>
        <link rel="stylesheet" href="estilo/css/style2.css">
   
        <style type="text/css">
            #formLogin {
                height: 330px;
            }
        </style>
   
    </head>
<body>
    <div class="registroLogin">
            <h1 id="titulo">Registro Producto</h1>
            <form id="formLogin" runat="server" method="post">
          
                <asp:TextBox ID="nombreTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese Nombre del Producto"></asp:TextBox>
               
                <asp:TextBox ID="descripcionTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese la descripcion"></asp:TextBox>
                <label>Linea Negocio:</label>
                <asp:DropDownList ID="LineaNegocio_ProductoTxt" CssClass="texto"  runat="server" placeholder="Ingrese la Linea De Negocio " DataSourceID="ObjectDataSource1" DataTextField="nombre" DataValueField="empresaId" Height="46px" Width="274px"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmpresaDSTableAdapters.EmpresaDaoTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_empresaId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nombre" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="UsuarioId" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nombre" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="UsuarioId" Type="Int32" />
                        <asp:Parameter Name="Original_empresaId" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:Button ID="guardarBtn" CssClass="btn" type="submit" runat="server" Text="GUARDAR" OnClick="registrarProducto" />
              
                
              
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>
</body>
</html>
