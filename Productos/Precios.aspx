<%@ Page Title="Precios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Precios.aspx.cs" Inherits="Productos.Precios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <asp:Label ID="lblProducto" runat="server" Text="Producto"></asp:Label>
            <asp:DropDownList ID="ddlProductos" runat="server" DataSourceID="productosDs" DataTextField="Descripcion" DataValueField="Id">
            </asp:DropDownList>
            
            <br />
            <asp:Label ID="lblPrecio" runat="server" Text="Monto $"></asp:Label>
            <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number"></asp:TextBox>
        
            <br />

            <asp:Label ID="lblFecha" runat="server" Text="Vigencia"></asp:Label>
            <asp:Calendar ID="clndVigencia" runat="server"></asp:Calendar>

            <br />

            <asp:Button ID="btnAlta" runat="server" Text="Cargar precio" OnClick="btnAlta_Click" />
        <br />
            <asp:SqlDataSource ID="productosDs" runat="server" ConnectionString="<%$ ConnectionStrings:IssdConnectionString %>" SelectCommand="SELECT * FROM [Productos]"></asp:SqlDataSource>
        
    <asp:Label ID="lblAviso" runat="server" CssClass="text-danger"></asp:Label>
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="preciosDs">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" DataFormatString="${0}" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" SortExpression="Descripcion" />
        </Columns>
    </asp:GridView>
        
    </main>
    <asp:SqlDataSource ID="preciosDs" runat="server" ConnectionString="<%$ ConnectionStrings:IssdConnectionString %>" DeleteCommand="DELETE FROM [Precios] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Precios] ([Fecha], [Monto], [idProducto]) VALUES (@Fecha, @Monto, @idProducto)" SelectCommand="SELECT pr.Id,pr.Fecha,pr.Monto,pr.idProducto, p.Descripcion FROM [Precios] pr
INNER JOIN [Productos] p on pr.idProducto=p.Id
" UpdateCommand="UPDATE [Precios] SET [Fecha] = @Fecha, [Monto] = @Monto WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Fecha" />
            <asp:Parameter Name="Monto" Type="Int32" />
            <asp:Parameter Name="idProducto" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Fecha" />
            <asp:Parameter Name="Monto" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
