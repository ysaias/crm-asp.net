﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroProducto.aspx.cs" Inherits="RegistroProducto" %>

<!DOCTYPE html>

<html>
<head>

        <meta charset='utf-8'>
        <title>Registro Producto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilo/css/style2.css">
        <link rel ="stylesheet" href="estilo/css/StyleRegistroProducto.css" > 

        
</head>
<body>
    <div class="container">
    <nav class="navbar navbar-expand-md navbar-dark bg-primary sticky-top">
        <a class="navbar-brand" href="Index.aspx">
        <img src="/estilo/img/LogoCrm.svg" width="30" height="30" class="d-inline-block align-top" alt="Logo CRM ALL">
        CRM ALL
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo01">

        <div class="navbar-nav mr-auto ml-auto text-center">
         <a class="nav-item nav-link active" href="index.aspx">Inicio </a>
         <a class="nav-item nav-link" href="RegistroOportunidadd.aspx">Oportunidad </a>
         <div class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 Registrar
             </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="RegistroLineaNegocio.aspx">Negocio</a>
                  <a class="dropdown-item" href="RegistroProducto.aspx">Producto</a>
                  <a class="dropdown-item" href="RegistroEmpresa.aspx">Empresa</a>
      
                </div>
         </div>
         <a class="nav-item nav-link" href="Registro.aspx">Registo </a>
         <a class="nav-item nav-link" href="Login.aspx">Login </a>   
        </div>
          </div>
    </nav>
    </div>
    <div class="registroProducto">
           
            <form id="registroProducto" runat="server" method="post">
          
                <div class="row">
                  <div class="col-12">
                        <h1>
                            <asp:Literal runat="server" ID="LabelTitle"></asp:Literal>
                            Producto
                        </h1>            
                        <asp:HyperLink runat="server" NavigateUrl="ListProductos.aspx">
                            Volver a la Lista de Productos
                        </asp:HyperLink>

                        <asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
                            <asp:Literal ID="MsgLiteral" runat="server"></asp:Literal>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="NombreTextBox">Nombre</asp:Label>
                            <asp:TextBox ID="NombreTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="text-danger">
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                    ErrorMessage="Debe ingresar el nombre"
                                    ValidationGroup="Producto"
                                    ControlToValidate="NombreTextBox">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
            

                        <div class="form-group">
                            <label>Descripcion</label>
                            <asp:TextBox ID="descripcionTextBox"  runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="text-danger">
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                    ErrorMessage="Debe ingresar el la descripcion del producto"
                                    ValidationGroup="Producto"
                                    ControlToValidate="descripcionTextBox">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

            
                        <div class="form-group">
                        <label>Linea Negocio:</label>
                        <asp:DropDownList ID="LineaNegocio_ProductoTxt" CssClass="texto"  runat="server" 
                        placeholder="Ingrese la Linea De Negocio " DataSourceID="ObjectDataSource1"
                        DataTextField="nombre" DataValueField="idLineaNegocio" Height="46px" >
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="pr_SelectLineaNegocio" TypeName="LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter" 
                        OnSelecting="ObjectDataSource1_Selecting">
                        </asp:ObjectDataSource>
                        </div>


                        <div class="form-group">
                            <asp:LinkButton ID="SaveButton" runat="server" OnClick="SaveButton_Click"
                                CssClass="btn btn-primary"
                                ValidationGroup="Producto">
                                Guardar
                            </asp:LinkButton>
                            <asp:HyperLink runat="server" NavigateUrl="ListProductos.aspx" CssClass="btn">
                                Cancelar
                            </asp:HyperLink>
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="ProductoIdHiddenField" runat="server" Value="0" />
                        </form>
                        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
                 </div>


           <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
