<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="ConfirmarCuenta.aspx.cs" Inherits="Usuarios_ConfirmarCuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
     <link rel="stylesheet" type="text/css" href="../Assets/css/B.style.css"/>
    <title>Inicia Sesion</title>
    <link rel="icon" href="../Assets/Imagenes/favicon.png" type="image/png"/>
     <style>
        body {
            background: url(estilo/img/fondito.jpg)
        }
    </style>
</head>
<body class="signin text-center">
    <form id="form1" runat="server" class="form-signin">
       
        <h3 style="color:white">
        <asp:Label ID="ConfirmacionLabel" Text="prueba" runat="server" /></h3>
         <asp:HyperLink id="RediresctLinkButton"  style="background-color:#8AC53F"   CssClass="btn btn-lg  btn-success btn-block"
            NavigateUrl="~/Login.aspx" Text="Inicia Sesion" runat="server"/> 
        
    </form>
</body>
</html>