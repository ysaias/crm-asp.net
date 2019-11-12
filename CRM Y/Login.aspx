<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="estilo/css/style.css">
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
         <a class="nav-item nav-link" href="RegistroOportunidad.aspx">Oportunidad </a>
         <div class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Productos
             </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="LineaNegocio.aspx">Negocio</a>
                  <a class="dropdown-item" href="RegistroProducto.aspx">Producto</a>
                </div>
         </div>
         <a class="nav-item nav-link" href="Registro.aspx">Registo </a>
         <a class="nav-item nav-link" href="Login.aspx">Login </a>   

        </div>
          </div>
    </nav>
    </div>

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
                <label id="Label1" 
                    style="
                      padding-bottom: 0px;
                      padding-left: 120px;">
                    <a href="Registro.aspx">Registro</a>
                </label>
                <br/>
                <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
            </form>
        </div>
        
           <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    </body>
</html>