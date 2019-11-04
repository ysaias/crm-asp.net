<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroOportunidad.aspx.cs" Inherits="RegistroOportunidad" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
        <title>Registro Cliente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="clockpicker-gh-pages/dist/bootstrap-clockpicker.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="estilo/css/style2.css">
        <link rel="stylesheet" href="estilo/css/StyleOportunidad.css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
    
    <form runat="server">
           
           <div class="row mb-3">
              <div class="col-md-6 themed-grid-col">
                  <asp:Button ID="guardarBtn" CssClass="btn" type="submit" runat="server" Text="GUARDAR"  />
              </div>
              <div class="col-md-6 themed-grid-col">   </div>
              <div class="col-md-6 themed-grid-col">
                <div class="registroOportunidad">
                 <h1 id="tituloOportunidad">Oportunidad</h1>
                  <div id="formOportunidad" >
          
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
                        
                    
                  </div>
                </div>
               </div>
              <div class="col-md-6 themed-grid-col">
               <div class="registroOportunidad2">
                 <h1 id="titulo">Registro Oportunidad</h1>
                  <div id="formOportunidad2" >
          
                        <label>Negocio  :</label>
                        <asp:DropDownList ID="ListNegocio" CssClass="texto listas"  runat="server" placeholder="Ingrese la Linea De Negocio "  DataTextField="nombre" DataValueField="idLineaNegocio"  ></asp:DropDownList>
                        <asp:ObjectDataSource  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Producto :</label>
                        <asp:DropDownList ID="ListProducto" CssClass="texto listas"  runat="server" placeholder="Ingrese la Linea De Negocio "  DataTextField="nombre" DataValueField="idLineaNegocio"  ></asp:DropDownList>
                        <asp:ObjectDataSource  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Ejecutivo:</label>
                        <asp:DropDownList ID="ListEjecutivo" CssClass="texto listas"  runat="server" placeholder="Ingrese la Linea De Negocio "  DataTextField="nombre" DataValueField="idLineaNegocio"  ></asp:DropDownList>
                        <asp:ObjectDataSource  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Origen   :</label>
                        <asp:DropDownList ID="DropDownList2" CssClass="texto listas"  runat="server" placeholder="Ingrese la Linea De Negocio "  DataTextField="nombre" DataValueField="idLineaNegocio"  ></asp:DropDownList>
                        <asp:ObjectDataSource  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Nota:</label>
                        <asp:TextBox ID="TextBox3" cssClass="texto" name="user" runat="server"  placeholder="Describa el Prospecto"></asp:TextBox>
                        
                  </div>
                </div>
              </div>
               <div class="col-md-6 themed-grid-col">
                  <div class="registroOportunidad">
                 <h1 id="tituloActividad">Actividad</h1>
                  <div id="formOportunidad3" >
          
                        <label>Fecha:</label>
                        <asp:TextBox  id="datepicker" class="form-control fecha" type="text" runat="server"></asp:TextBox>
                        <label>Hora:</label>
                        <asp:TextBox id="hora" class="form-control fecha" type="text" data-autoclose="true" runat="server">
                        </asp:TextBox>
                        <label>Motivo:</label>
                        <asp:DropDownList ID="DropDownList1" CssClass="texto listas"  runat="server" placeholder="Ingrese la Linea De Negocio "  DataTextField="nombre" DataValueField="idLineaNegocio"  ></asp:DropDownList>
                        <asp:ObjectDataSource  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Tipo:</label>
                        <asp:DropDownList ID="DropDownList3" CssClass="texto listas"  runat="server" placeholder="Ingrese la Linea De Negocio "  DataTextField="nombre" DataValueField="idLineaNegocio"  ></asp:DropDownList>
                        <asp:ObjectDataSource  runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllLineaNegocio" TypeName="LineaNegocioDSTableAdapters.GetAllLineaNegocioTableAdapter"></asp:ObjectDataSource>
                        <label>Nota:</label>
                        <asp:TextBox ID="TextBox10" cssClass="texto" name="user" runat="server"  placeholder="Descripcion de lo que se debe hacer"></asp:TextBox>
                        
                    
                  </div>
                </div>
              </div>
              <div class="col-md-6 themed-grid-col">   </div>
              <div class="col-md-6 themed-grid-col">
                  <asp:Button ID="Button1" CssClass="btn" type="submit" runat="server" Text="GUARDAR"  />
              </div>
              <div class="col-md-6 themed-grid-col">   </div>  
           </div>
        </form>

        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
    

         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
         <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
         <script src="https://code.jquery.com/jquery-1.12.4.js"></script>   
         <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         
   
         <script>
           $( function() {
           $( "#datepicker" ).datepicker();
             });

           $('.clockpicker').clockpicker();

         </script>   
</body>
</html>
