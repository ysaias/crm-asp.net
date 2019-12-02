<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListaLineaNegocio.aspx.cs" Inherits="ListaLineaNegocio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>


        <div class="row">
            <div class="col-12">
                <h1>Lista Linea Negocios</h1>
                <h3 runat="server" id="EmpresaNombre"></h3>
                <asp:LinkButton runat="server" OnClick="btnRegistrarNuevo_Click" ID="btnRegistrarNuevo" >
                Nuevo Negocio
                </asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div class="row">
            <div class="col-12">

                <asp:GridView ID="NegociosGridView" runat="server" CssClass="table"
                    GridLines="None" AutoGenerateColumns="false"
                    OnRowCommand="LineaNegocioGridView_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Ver Productos" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="VerLineaBtn" runat="server" CommandName="VerProducto"
                                    CommandArgument='<%# Eval("idLineaNegocio") %>'>
                                <i class="fas fa-eye"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditBtn" runat="server" CommandName="Editar"
                                    CommandArgument='<%# Eval("idLineaNegocio") %>'>
                                <i class="fas fa-edit"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Eliminar"
                                    OnClientClick="return confirm('¿Esta seguro que desea eliminar este producto?')"
                                    CommandArgument='<%# Eval("idLineaNegocio") %>'>
                                <i class="fas fa-trash-alt text-danger"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:BoundField HeaderText="Descripcion" DataField="descripcion" />
                        
                    </Columns>
                </asp:GridView>


            </div>
        </div>


    </div>

    <asp:HiddenField runat="server" ID="EmpresaIdHD"/>
</asp:Content>

