<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Productos.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>
    </h2>
        <br />
        Descripción:<asp:TextBox ID="descripcion" runat="server"></asp:TextBox>
            <asp:Button ID="btnAlta" runat="server" OnClick="btnAlta_Click" Text="Crear" />
        <br />
            <asp:Label ID="lblAviso" CssClass="text-danger" runat="server"></asp:Label>
        <br />
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="productosDs">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="productosDs" runat="server" ConnectionString="<%$ ConnectionStrings:IssdConnectionString %>" DeleteCommand="DELETE FROM [Productos] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Productos] ([Descripcion]) VALUES (@Descripcion)" SelectCommand="SELECT * FROM [Productos]" UpdateCommand="UPDATE [Productos] SET [Descripcion] = @Descripcion WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Descripcion" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </main>
</asp:Content>
