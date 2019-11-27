<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroOportunidadd.aspx.cs" Inherits="RegistroCliente" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset='utf-8'>
        <title>Empresa</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
         <link rel="stylesheet" href="estilo/css/style2.css">
         <link rel ="stylesheet" href="estilo/css/StyleCliente.css" > 

        
</head><body>
    <div class="container">
    <nav class="navbar sticky-top navbar-expand-md navbar-dark bg-dark">
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
             <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLinkOportunidad" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Oportunidad 
             </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="RegistroCliente.aspx">Cliente</a>
                  <a class="dropdown-item" href="RegistroPais.aspx">Pais</a>      
                  <a class="dropdown-item" href="RegistroCiudad.aspx">Ciudad</a>
                </div>
         </div>
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
    <div class="registroOportunidadd">
            <form id="registroLineaNegocio2" runat="server" method="post">
           
                <div class="row">
                  <div class="col-12">
                        <h2>
                            <asp:Literal runat="server" ID="LabelTitle"></asp:Literal>
                            Oportunidad
                        </h2>            
                        <asp:HyperLink runat="server" NavigateUrl="~/ListaOportunidad.aspx">
                            Volver a la Lista de Oportunidad
                        </asp:HyperLink>

                        <asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
                            <asp:Literal ID="MsgLiteral" runat="server"></asp:Literal>
                        </asp:Panel>
                    </div>
                </div>
                

                
                <div class="row">
                      <div class="col-md-6 themed-grid-col">
                <div class="registroOportunidad">
                    <div id="formOportunidadd">

                        <label>Negocio  :</label>
                        <asp:DropDownList ID="ListNegocio" CssClass="texto listas" runat="server"
                            placeholder="Ingrese la Linea De Negocio " DataSourceID="ObjectDataSource1"
                            DataTextField="nombre" DataValueField="idLineaNegocio" Height="46px" OnSelectedIndexChanged="ListNegocio_SelectedIndexChanged1">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="pr_SelectLineaNegocio" TypeName="LineaNegocioDSTableAdapters.tblLineaNegocioDaoTableAdapter"
                            OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>
                        <label>Producto :</label>
                        <asp:DropDownList ID="ListProducto" CssClass="texto listas" runat="server"
                            placeholder="Ingrese la Emprea " DataSourceID="ObjectDataSource2"
                            DataTextField="nombre" DataValueField="idProducto" Height="46px" OnSelectedIndexChanged="ListProducto_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="pr_SelectProducto" TypeName="ProductoDSTableAdapters.tblProductoTableAdapter"
                            OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>
                        <label>Descripcion:</label>
                        <asp:TextBox ID="descripcionTxt" CssClass="texto" name="user" runat="server" placeholder="Describa el Prospecto"></asp:TextBox>
                        <label>Fecha Hora:</label>
                        <asp:TextBox ID="fechaHoraTxt" CssClass="texto" name="user" runat="server" placeholder="Fecha y Hora"></asp:TextBox>
                        
                        
                            
                        
                         <label>Origen :</label>
                        <asp:DropDownList ID="origenList" CssClass="texto listas" runat="server"
                            placeholder="Ingrese la Emprea " DataSourceID="ObjectDataSource2"
                            DataTextField="nombre" DataValueField="idProducto" Height="46px" OnSelectedIndexChanged="ListProducto_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="pr_SelectOrigen" TypeName="OrigenDSTableAdapters.tblOrigenTableAdapter"
                            OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>

                        <label>Ejecutivo:</label>
                        <asp:DropDownList ID="ListEjecutivo" CssClass="texto listas" runat="server"
                            placeholder="Ingrese la Emprea " DataSourceID="ObjectDataSource3"
                            DataTextField="Usuario" DataValueField="idUsuario" Height="46px" OnSelectedIndexChanged="ListUsuario_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="pr_SelectUsuario" TypeName="UsuarioDSTableAdapters.pr_verificacionUsuariosTableAdapter"
                            OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>
       
                        <label>Cliente :</label>
                        <asp:DropDownList ID="clienteList" CssClass="texto listas" runat="server"
                            placeholder="Ingrese la Emprea " DataSourceID="ObjectDataSource5"
                            DataTextField="NombreCompleto" DataValueField="idCliente" Height="46px" OnSelectedIndexChanged="ListProducto_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="pr_SelectCliente" TypeName="ClienteDSTableAdapters.tblClienteTableAdapter"
                            OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>

                         <div class="form-group">
                            <asp:LinkButton ID="guardarBtn" runat="server" OnClick="SaveButton_Click"
                                CssClass="btn btn-primary"
                                ValidationGroup="Producto">
                                Guardar
                            </asp:LinkButton>
                            <asp:HyperLink runat="server" NavigateUrl="ListCliente.aspx" CssClass="btn">
                                Cancelar
                            </asp:HyperLink>
                        </div>
                       
                    </div>

                  </div>
                 </div>
                </div>
                <asp:HiddenField ID="RegistroClienteIdHiddenField" runat="server" Value="0" />
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>


          
</body>
</html>
