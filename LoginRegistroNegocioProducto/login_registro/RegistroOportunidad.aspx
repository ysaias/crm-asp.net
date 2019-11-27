<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroOportunidad.aspx.cs" Inherits="RegistroOportunidad" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <title>Registro Oportunidad</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



    <link rel="stylesheet" href="estilo/css/style2.css">
    <link rel="stylesheet" href="estilo/css/StyleOportunidad.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://weareoutman.github.io/clockpicker/dist/bootstrap-clockpicker.min.css">
    <link rel="stylesheet" href="style.css">
    <script src="http://code.jquery.com/jquery-2.2.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://weareoutman.github.io/clockpicker/dist/bootstrap-clockpicker.min.js"></script>
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
                    <a class="nav-item nav-link" href="#" aria-disabled="true">Oportunidad </a>
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Registrar
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

    <form runat="server">
        <div class="row">
                  <div class="col-12">
                        <h1>
                            <asp:Literal runat="server" ID="LabelTitle"></asp:Literal>
                            Producto
                        </h1>            
                        <asp:HyperLink runat="server" NavigateUrl="ListCliente.aspx">
                            Volver a la Lista de Productos
                        </asp:HyperLink>

                        <asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
                            <asp:Literal ID="MsgLiteral" runat="server"></asp:Literal>
                        </asp:Panel>
                    </div>
                </div>
        <div class="row mb-3">
            <div class="col-md-6 themed-grid-col">
                <asp:Button ID="guardarBtn" CssClass="btn" type="submit" runat="server"  OnClick="SaveButton_Click" Text="GUARDAR" />
            </div>
            <div class="col-md-6 themed-grid-col"></div>
            <div class="col-md-6 themed-grid-col">
                <div class="registroOportunidad">
                    <h1 id="tituloOportunidad">Registro Cliente</h1>
                    <div id="formOportunidad">

                        <label>Nombre Completo:</label>
                        <asp:TextBox ID="nombreTxt" CssClass="texto" name="user" runat="server" placeholder="Ingrese Nombre completo"></asp:TextBox>
                        <label>Correo:</label>
                        <asp:TextBox ID="correoTxt" CssClass="texto" name="user" runat="server" placeholder="Ingrese un correo"></asp:TextBox>
                        <label>Telefono:</label>
                        <asp:TextBox ID="telefonoTxt" CssClass="texto" name="user" runat="server" placeholder="Ingrese un telefono"></asp:TextBox>
                        <label>Celular:</label>
                        <asp:TextBox ID="celTxt" CssClass="texto" name="user" runat="server" placeholder="Ingrese un celular"></asp:TextBox>
                        <label>Direccion:</label>
                        <asp:TextBox ID="dirTxt" CssClass="texto" name="user" runat="server" placeholder="Ingrese una Direccion"></asp:TextBox>
                        <label>Ciudad  :</label>
                        <asp:DropDownList ID="DropDownList4" CssClass="texto listas" runat="server"
                            placeholder="Ingrese la una Ciudad " DataSourceID="ObjectDataSource4"
                            DataTextField="nombre" DataValueField="idCiudad" Height="46px" OnSelectedIndexChanged="ListaCiudad_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="pr_SelectCiudad" TypeName="CiudadDSTableAdapters.pr_SelectCiudadTableAdapter"
                            OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>
                       
                    </div>

                </div>
            </div>
            <div class="col-md-6 themed-grid-col">
                <div class="registroOportunidad2">
                    <h1 id="titulo">Registro Oportunidad</h1>
                    <div id="formOportunidad2">

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
                        <label>Ejecutivo:</label>
                        <asp:DropDownList ID="ListEjecutivo" CssClass="texto listas" runat="server"
                            placeholder="Ingrese la Emprea " DataSourceID="ObjectDataSource3"
                            DataTextField="Usuario" DataValueField="idUsuario" Height="46px" OnSelectedIndexChanged="ListUsuario_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="pr_SelectUsuario" TypeName="UsuarioDSTableAdapters.pr_verificacionUsuariosTableAdapter"
                            OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>
                        <label>Origen   :</label>
                        <asp:DropDownList ID="DropDownList2" CssClass="texto listas" runat="server" placeholder="Ingrese la Linea De Negocio " DataTextField="nombre" DataValueField="idLineaNegocio"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Nota:</label>
                        <asp:TextBox ID="TextBox3" CssClass="texto" name="user" runat="server" placeholder="Describa el Prospecto"></asp:TextBox>

                    </div>
                </div>
            </div>
            <div class="col-md-6 themed-grid-col">
                <div class="registroOportunidad">
                    <h1 id="tituloActividad">Actividad</h1>
                    <div id="formOportunidad3">

                        <div class="input-group clock">
                            <input type="text" class="form-control" value="" placeholder="Ahora">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>

                        <label>Fecha:</label>
                        <asp:TextBox ID="datepicker" class="form-control fecha" type="text" runat="server"></asp:TextBox>
                        <label>Hora:</label>
                        <asp:TextBox ID="hora" class="form-control fecha .clockpicker" type="text" data-autoclose="true" runat="server">
                        </asp:TextBox>
                        <label>Motivo:</label>
                        <asp:DropDownList ID="DropDownList1" CssClass="texto listas" runat="server" placeholder="Ingrese la Linea De Negocio " DataTextField="nombre" DataValueField="idLineaNegocio"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Tipo:</label>
                        <asp:DropDownList ID="DropDownList3" CssClass="texto listas" runat="server" placeholder="Ingrese la Linea De Negocio " DataTextField="nombre" DataValueField="idLineaNegocio"></asp:DropDownList>
                        <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Nota:</label>
                        <asp:TextBox ID="TextBox10" CssClass="texto" name="user" runat="server" placeholder="Descripcion de lo que se debe hacer"></asp:TextBox>


                    </div>
                </div>
            </div>
            <div class="col-md-6 themed-grid-col"></div>
            <div class="col-md-6 themed-grid-col">
                <asp:Button ID="Button1" CssClass="btn" type="submit" runat="server" Text="GUARDAR" />
            </div>
            <div class="col-md-6 themed-grid-col"></div>
            
           </div>
        <asp:HiddenField ID="RegistroOportunidadIdHiddenField" runat="server" Value="0" />
    </form>

    <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script>
        $(function () {
            $("#datepicker").datepicker();
        });



    </script>

    <script src="estilo/Script.js">
         $('input').clockpicker();
    </script>

</body>
</html>
