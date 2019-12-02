<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaMedio.aspx.cs" Inherits="ListaMedio" %>

<!DOCTYPE html>

<html>
<head>
 <meta charset='utf-8'>
        <title>Lista Medios</title>
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
            <h2>Lista Medios</h2>
            <asp:HyperLink runat="server" NavigateUrl="~/RegistroMedio.aspx" CssClass="btn btn-primary">
                Nuevo Medio
            </asp:HyperLink>
            <br /><br />
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            
            <asp:GridView ID="paisGridView" runat="server" CssClass="table" 
                GridLines="None" AutoGenerateColumns="false"
                OnRowCommand="paisGridView_RowCommand"> 
                <Columns>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditBtn" runat="server" CommandName="Editar"
                                CommandArgument='<%# Eval("idMedio") %>'>
                                <i class="fas fa-edit"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Eliminar"
                                OnClientClick="return confirm('¿Esta seguro que desea eliminar este producto?')"
                                CommandArgument='<%# Eval("idMedio") %>'>
                                <i class="fas fa-trash-alt text-danger"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Nombre" DataField="nombre" />
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

