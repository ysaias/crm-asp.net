<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListProductos.aspx.cs" Inherits="ListProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col-12">
                <h1>Lista de Productos</h1>
                <h3 runat="server" id="NegocioEmpresa"></h3>
                <asp:LinkButton runat="server" OnClick="btnRegistrarProducto_Click" ID="btnRegistrarProducto" >
                Nuevo Producto
                </asp:LinkButton>                
                <br />
                <br />
            </div>
        </div>
        <div class="row">
            <div class="col-12">

                <asp:GridView ID="ProductosGridView" runat="server" CssClass="table"
                    GridLines="None" AutoGenerateColumns="false"
                    OnRowCommand="ProductosGridView_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditBtn" runat="server" CommandName="Editar"
                                    CommandArgument='<%# Eval("idProducto") %>'>
                                <i class="fas fa-edit"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Eliminar"
                                    OnClientClick="return confirm('¿Esta seguro que desea eliminar este producto?')"
                                    CommandArgument='<%# Eval("idProducto") %>'>
                                <i class="fas fa-trash-alt text-danger"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />                        
                    </Columns>
                </asp:GridView>


            </div>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="NegocioIdHD" />
    <asp:HiddenField runat="server" ID="EmpresaIdHD"/>

</asp:Content>

