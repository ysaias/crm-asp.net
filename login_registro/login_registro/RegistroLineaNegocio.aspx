<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroLineaNegocio.aspx.cs" Inherits="RegistroLineaNegocio" %>

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
            <h1 id="titulo">Registro Linea Negocio</h1>
            <form id="formLogin" runat="server" method="post">
          
                <asp:TextBox ID="nombreTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese Nombre de la Linea Negocio"></asp:TextBox>
               
                <asp:TextBox ID="descripcionTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese la descripcion"></asp:TextBox>
                <label>Linea Negocio:</label>
                <asp:DropDownList ID="LineaNegocio_ProductoTxt" CssClass="texto"  runat="server" placeholder="Ingrese la Empresa " DataSourceID="EmpresaEnlace" DataTextField="Nombre" DataValueField="idEmpresa" Height="46px" Width="274px"></asp:DropDownList>
                <asp:SqlDataSource ID="EmpresaEnlace" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" SelectCommand="SELECT [idEmpresa], [Nombre] FROM [tblEmpresa]"></asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllEmpresa" TypeName="EmpresaDSTableAdapters.GetAllEmpresaTableAdapter"></asp:ObjectDataSource>
                <asp:Button ID="guardarBtn" CssClass="btn" type="submit" runat="server" Text="GUARDAR" OnClick="registrarLineaNegocio" />
              
                
              
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>
</body>
</html>
