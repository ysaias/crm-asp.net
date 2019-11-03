<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

<!DOCTYPE html>
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    </script>


<html>
<head>
        <meta charset='utf-8'>
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
        <link rel="stylesheet" href="estilo/css/style2.css">
   
    </head>
<body>
    <div class="container">
    <nav class="navbar sticky-top navbar-expand-md navbar-dark bg-primary">
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
                 <label id="Label1">
                 <a href="Login.aspx">Iniciar Sesion</a>
                 </label>
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>

           <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>
</html>
