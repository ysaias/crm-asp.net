<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistroEmpresa.aspx.cs" Inherits="RegistroEmpresa" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset='utf-8'>
        <title>Empresa</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <link rel="stylesheet" href="estilo/css/style2.css">
        <link rel ="stylesheet" href="estilo/css/StyleLineaNegocio.css" > 

        
</head><body>
    
    <div class="registroLineaNegocio">
            <form id="registroLineaNegocio" runat="server" method="post">
           
                <div class="row">
                  <div class="col-12">
                        <h1>
                            <asp:Literal runat="server" ID="LabelTitle"></asp:Literal>
                            Empresa
                        </h1>            
                        <asp:HyperLink runat="server" NavigateUrl="~/ListaEmpresa.aspx">
                            Volver a la Lista de Empresas
                        </asp:HyperLink>

                        <asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="alert alert-danger" role="alert">
                            <asp:Literal ID="MsgLiteral" runat="server"></asp:Literal>
                        </asp:Panel>
                    </div>
                </div>
                

                
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="NombreTextBox">Nombre</asp:Label>
                            <asp:TextBox ID="NombreTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="text-danger">
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                    ErrorMessage="Debe ingresar el nombre"
                                    ValidationGroup="Producto"
                                    ControlToValidate="NombreTextBox">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
            

                        <div class="form-group">
                            <label>Descripcion</label>
                            <asp:TextBox ID="descripcionTextBox"  runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="text-danger">
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                    ErrorMessage="Debe ingresar el la descripcion de la Empresa"
                                    ValidationGroup="Producto"
                                    ControlToValidate="descripcionTextBox">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                         <div class="form-group">
                            <label>Telefono</label>
                            <asp:TextBox ID="telefonoTextBox"  runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="text-danger">
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                    ErrorMessage="Debe ingresar el número de telefon de la Empresa"
                                    ValidationGroup="Producto"
                                    ControlToValidate="telefonoTextBox">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                         <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="emailTextBox"  runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="text-danger">
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                                    ErrorMessage="Debe ingresar el email de la Empresa"
                                    ValidationGroup="Producto"
                                    ControlToValidate="emailTextBox">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                          <div class="form-group">
                        <label>Usuarios:</label>
                        <asp:DropDownList ID="usuariosTxt" CssClass="texto"  runat="server" 
                        placeholder="Ingrese el Usuario " DataSourceID="ObjectDataSource1" Enabled="false"
                        DataTextField="Nombre" DataValueField="idUsuario" Height="46px" >
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="pr_SelectUsuario" TypeName="UsuarioDSTableAdapters.pr_verificacionUsuariosTableAdapter" 
                        OnSelecting="ObjectDataSource1_Selecting">
                        </asp:ObjectDataSource>
                        </div>

                                                                     
                        <div class="form-group">
                            <asp:LinkButton ID="SaveButton" runat="server" OnClick="SaveButton_Click"
                                CssClass="btn btn-primary"
                                ValidationGroup="Producto">
                                Guardar
                            </asp:LinkButton>
                            <asp:HyperLink runat="server" NavigateUrl="ListaEmpresa.aspx" CssClass="btn">
                                Cancelar
                            </asp:HyperLink>
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="EmpresaIdHiddenField" runat="server" Value="0" />
            </form>
        <asp:Label ID="msgError" runat="server" BorderColor="White"></asp:Label>
     </div>


           <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
           <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
