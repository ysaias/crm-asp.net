<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroActividad.aspx.cs" Inherits="RegistroActividad" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset='utf-8'>
        <title>Actividad</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" > 
         <link rel="stylesheet" href="estilo/css/style2.css">
         <link rel ="stylesheet" href="estilo/css/StyleLineaNegocio.css" > 
         <link href="../estilo/css/StyleActividad.css" rel="stylesheet"/>

        
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
         
            <div class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLinkActividad" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                OPORTUNIDAD 
             </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="RegistroCliente.aspx">Cliente</a>
                  <a class="dropdown-item" href="RegistroOportunidadd.aspx">Oportunidad </a>
                </div>
         </div>
            <div class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLinkOportunidad" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Registar Cliente 
             </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  
                  <a class="dropdown-item" href="RegistroPais.aspx">Pais</a>      
                  <a class="dropdown-item" href="RegistroCiudad.aspx">Ciudad</a>                  
                  <a class="dropdown-item" href="RegistroMedio.aspx">Medio</a>
                  <a class="dropdown-item" href="RegistroOrigen.aspx">Origen</a>
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
    <div class="registroLineaNegocio">
            <form id="registroLineaNegocio" runat="server" method="post">
           
                <div class="row">
                  <div class="col-12">
                        <h2>
                            <asp:Literal runat="server" ID="LabelTitle"></asp:Literal>
                           Actividad
                        </h2>            
                        <asp:HyperLink runat="server" NavigateUrl="~/ListaOportunidad.aspx">
                            Volver a la Lista de Actividades
                        </asp:HyperLink>

                        <asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
                            <asp:Literal ID="MsgLiteral" runat="server"></asp:Literal>
                        </asp:Panel>
                    </div>
                </div>
                

                
                 <div class="row">
                    <div class="col-6">
                        <div class="form-group">

                        <label>Fecha:</label>
                         
                             <div class="row">
                                  <div class="fecha">
                                    <asp:TextBox ID="from_date" runat="server" placeholder="From" type="date" value="2019-12-01"
                                    min="2018-01-01" max="2030-12-31"></asp:TextBox>
                                  </div>
                             </div>   
                         </div>
                         <div class="form-group">
                        <label>Hora:</label>
                            <div class="row">
                                <div class="hora">
                                     <asp:TextBox ID="from_time" type="time" name="hora" runat="server"
                                     value="09:45:00" max="22:30:00" min="07:00:00" step="1"></asp:TextBox>
                                </div>
                             </div>   
                         </div> 
                        <div class="form-group">
                        <label>Medio:</label>
                        <div class="row">
                        <asp:DropDownList ID="medio_Txt" CssClass="texto"  runat="server" 
                        placeholder="Ingrese la Emprea " DataSourceID="ObjectDataSource1"
                        DataTextField="Nombre" DataValueField="idMedio" Height="46px" >
                        </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="pr_getSelectMedio" 
                                TypeName="MedioDSTableAdapters.tblMedioTableAdapter" OnSelecting="ObjectDataSource1_Selecting1">
                            </asp:ObjectDataSource>
                        </div>
                        </div>
                       
                        <div class="form-group">
                        <label>Oportunidad:</label>
                        <div class="row">
                        <asp:Label ID="OportunidadidLabel" runat="server" Text="Cliente Oportunidad"></asp:Label>
                        </div>
                        </div>

                         <div class="form-group">
                        <label>Nota:</label>
                        <asp:TextBox ID="descripcionTxt" CssClass="texto" name="user" runat="server" placeholder="Descripcion de lo que se debe hacer"></asp:TextBox>
                        </div>
                
                     

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

                       </div> <!--termina formActividad  -->  
                     
                </div>
                <asp:HiddenField ID="RegistroActividadIdHiddenField" runat="server" Value="0" />
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>

      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
      
          
</body>
</html>
