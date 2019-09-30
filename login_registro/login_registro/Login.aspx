<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <title>Login</title>
        <link rel="stylesheet" href="estilo/css/style.css">
    </head>

<body>
        <div class="login">
          
            <h1 id="titulo">CRM</h1>
            <form id="formLogin" runat="server" method="post">
                <!--onsubmit="onLogin()"-->
                <!-- usuario-->
                <label for="username">Username:</label>
                <asp:TextBox ID="userTxt" cssClass="texto" name="user" runat="server"  placeholder="Correo o Usuario"></asp:TextBox>
                <!-- Password-->
                <label for="password">
                Password:</label>
                <asp:TextBox ID="passTxt" cssClass="texto" name="pass" runat="server" type="password"  placeholder="Password"></asp:TextBox>
                <asp:Button ID="loginBtn" type="submit"  CssClass="btn" runat="server" Text="Iniciar Sesion" OnClick="BtnIngresar_Click"/>
                <label id="Label1" style="
    padding-bottom: 0px;
    padding-left: 120px;
"><a href="Registro.aspx">Registro</a></label>
                <br/>
                <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
            </form>
        </div>
        
    </body>
</html>