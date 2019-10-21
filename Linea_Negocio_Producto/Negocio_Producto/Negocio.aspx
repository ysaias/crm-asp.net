<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Negocio.aspx.cs" Inherits="Negocio" %>

<!DOCTYPE html>
<script runat="server">

    protected void registrarUsuario(object sender, EventArgs e)
    {

    }
</script>


<html>
<head>
        <meta charset='utf-8'>
        <title>Login</title>
        <link rel="stylesheet" href="estilo/css/style2.css">
   
    </head>
<body>
    <div class="registroLogin">
            <h1 id="titulo">Linea de Negocio</h1>
            <form id="formLogin" runat="server" method="post">
                <label>Codigo:</label>
                <asp:TextBox ID="codigoTxt" cssClass="texto" name="user" runat="server" Height="40px" Width="443px"></asp:TextBox>
                <label>Nombre:</label>
                <asp:TextBox ID="nombreTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese Nombre de Linea de Negocio" Height="40px" Width="443px"></asp:TextBox>
                <label>Descripcion:</label>
                <asp:TextBox ID="descripcionTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese un Descripcon realacionada a la Linea de Negocio" Height="131px" Width="443px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="crearBtn" CssClass="btn" type="submit" runat="server" Text="CREAR" OnClick="crearNegocio" />
                 &nbsp;</form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>
</body>
</html>
