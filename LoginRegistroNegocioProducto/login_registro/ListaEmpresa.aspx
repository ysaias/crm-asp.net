<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListaEmpresa.aspx.cs" Inherits="ListaEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <div class="row">
            <div class="col-12">
                <h1>Lista Empresas</h1>
                <asp:HyperLink runat="server" NavigateUrl="~/RegistroEmpresa.aspx" CssClass="">
                Nueva Empresa
                </asp:HyperLink>
                <br />
                <br />
                <asp:GridView ID="EmpresasGridView" runat="server" CssClass="table"
                    GridLines="None" AutoGenerateColumns="false"
                    OnRowCommand="EmpresascioGridView_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Ver Negocios" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="VerLineaBtn" runat="server" CommandName="VerLinea"
                                    CommandArgument='<%# Eval("empresaId") %>'>
                                <i class="fas fa-eye"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Editar" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditBtn" runat="server" CommandName="Editar"
                                    CommandArgument='<%# Eval("empresaId") %>'>
                                <i class="fas fa-edit"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Eliminar"
                                    OnClientClick="return confirm('¿Esta seguro que desea eliminar esta empresa')"
                                    CommandArgument='<%# Eval("empresaId") %>'>
                                <i class="fas fa-trash-alt text-danger"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:BoundField HeaderText="Telefono" DataField="telefono" />
                        <asp:BoundField HeaderText="Email" DataField="email" />                        
                    </Columns>
                </asp:GridView>


            </div>
        </div>


    </div>
</asp:Content>

