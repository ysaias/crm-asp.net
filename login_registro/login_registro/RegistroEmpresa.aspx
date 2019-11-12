<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroEmpresa.aspx.cs" Inherits="RegistroEmpresa" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html>
<head>
        <meta charset='utf-8'>
        <title>Registro Empresa</title>
        <link rel="stylesheet" href="estilo/css/style2.css">
   
        <style type="text/css">
            #formLogin {
                height: 330px;
            }
        </style>
   
    </head>
<body>
    <div class="registroLogin">
            <h1 id="titulo">Registro Empresa</h1>
            <form id="formLogin" runat="server" method="post">
          
                <asp:TextBox ID="nombreTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese Nombre de la empresa"></asp:TextBox>
               
                <asp:TextBox ID="descripcionTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese la descripcion"></asp:TextBox>
                <label>Usuario:</label>
                <asp:DropDownList ID="LineaNegocio_ProductoTxt" CssClass="texto"  runat="server" placeholder="Ingrese el usuario " DataSourceID="UsuarioEnlace" DataTextField="Nombre" DataValueField="idUsuario" Height="46px" Width="274px"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllUsuarios" TypeName="Usuario2DSxsdTableAdapters.UsuarioDAOTableAdapter"></asp:ObjectDataSource>
                <asp:SqlDataSource ID="UsuarioEnlace" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" SelectCommand="SELECT [Nombre], [idUsuario] FROM [tblUsuario]"></asp:SqlDataSource>
                <asp:Button ID="guardarBtn" CssClass="btn" type="submit" runat="server" Text="GUARDAR" OnClick="registrarEmpresa" />
              
                
              
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>
</body>
</html>
