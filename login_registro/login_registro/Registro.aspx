<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset='utf-8'>
        <title>Login</title>
        <link rel="stylesheet" href="estilo/css/style2.css">
   
    </head>
<body>
    <div class="registroLogin">
            <h1 id="titulo">Registro</h1>
            <form id="formLogin" runat="server" method="post">
                <label>Nombre Completo:</label>
                <asp:TextBox ID="nombreTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese Nombre completo"></asp:TextBox>
                <label>Correo:</label>
                <asp:TextBox ID="correoTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese un correo"></asp:TextBox>
                <label>Telefono:</label>
                <asp:TextBox ID="telefonoTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese un telefono"></asp:TextBox>
                <label>Celular:</label>
                <asp:TextBox ID="celTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese un celular"></asp:TextBox>
                <label>Direccion:</label>
                <asp:TextBox ID="dirTxt" cssClass="texto" name="user" runat="server"  placeholder="Ingrese una Direccion"></asp:TextBox>
                <label>Usuario:</label>
                <asp:TextBox ID="userTxt" cssClass="texto" name="pass" runat="server" type="text"  placeholder="Ingrese Nombre usuario"></asp:TextBox>
                
                <label>Password:</label>
                <asp:TextBox ID="passText" cssClass="texto" type="password" name="user" runat="server"  placeholder="Ingrese su contraseña"></asp:TextBox>
                <asp:Button ID="guardarBtn" CssClass="btn" type="submit" runat="server" Text="GUARDAR" OnClick="registrarUsuario" />
                 <label id="Label1" style="
    padding-bottom: 0px;
    padding-left: 120px;
"><a href="Login.aspx">Iniciar Sesion</a></label>
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>
</body>
</html>
