<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListOportunidad.aspx.cs" Inherits="ListOportunidad" %>

<!DOCTYPE html>

<html>
<head>
 <meta charset='utf-8'>
        <title>Lista Cliente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
        <link href="../App_Themes/Default/A.bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link href="../App_Themes/Default/B.style.css" type="text/css" rel="stylesheet" />
        <link href="../App_Themes/Default/css/fontawesome-all.min.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>

            
    <div class="row">
        <div class="col-12">
            <h1>Lista de Oportunidad</h1>
            <asp:HyperLink runat="server" NavigateUrl="~/RegistroOportunidadd.aspx" CssClass="btn btn-primary">
                Nueva Oportunidad
            </asp:HyperLink>
            <br /><br />
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            
            <asp:GridView ID="oportunidadGridView" runat="server" CssClass="table" 
                GridLines="None" AutoGenerateColumns="false"
                OnRowCommand="oportunidadGridView_RowCommand"> 
                <Columns>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditBtn" runat="server" CommandName="Editar"
                                CommandArgument='<%# Eval("idOportunidad") %>'>
                                <i class="fas fa-edit"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Usar">
                        <ItemTemplate>
                            <asp:LinkButton ID="UsarBtn" runat="server" CommandName="Usar"
                                OnClientClick="return confirm('Estas por crear una Actividad')"
                                CommandArgument='<%# Eval("idOportunidad") %>'>
                                <i class="fas fa-check-circle"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Eliminar"
                                OnClientClick="return confirm('¿Esta seguro que desea eliminar este Cliente?')"
                                CommandArgument='<%# Eval("idOportunidad") %>'>
                                <i class="fas fa-trash-alt text-danger"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Negocio" DataField="idLineadeNegocio" />
                    <asp:BoundField HeaderText="Producto" DataField="idProducto" />
                    <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Fecha" DataField="fechaHora" />
                    <asp:BoundField HeaderText="Origen" DataField="idOrigen" />
                    <asp:BoundField HeaderText="Cliente" DataField="idCliente" />
                    <asp:BoundField HeaderText="Usuario" DataField="idUsuario" />
                    
                </Columns>
            </asp:GridView>


        </div>
    </div>


        </div>
    </form>

     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>
</html>
