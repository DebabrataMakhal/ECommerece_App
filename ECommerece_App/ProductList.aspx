<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ECommerece_App.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="SqlDataSource1"  HorizontalAlign="Center" PageSize="5"  BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Height="713px" Width="100%" >
        <Columns>
            <asp:ImageField DataImageUrlField="pic" HeaderText="Image">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
            <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
            <asp:BoundField DataField="pcat" HeaderText="pcat" SortExpression="pcat" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="mdt" HeaderText="mdt" SortExpression="mdt" />
            <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True">
            <ControlStyle BackColor="Black" BorderColor="White" BorderStyle="Solid" BorderWidth="3px" ForeColor="White" Height="28px" Width="80px" />
            <FooterStyle Font-Underline="False" />
            <HeaderStyle BackColor="Black" ForeColor="White" />
            <ItemStyle Font-Underline="False" HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Underline="True" ForeColor="White" HorizontalAlign="Center" Font-Bold="True" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
        
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [product] WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([mdt] = @original_mdt) OR ([mdt] IS NULL AND @original_mdt IS NULL))" InsertCommand="INSERT INTO [product] ([pname], [pcat], [pic], [price], [mdt]) VALUES (@pname, @pcat, @pic, @price, @mdt)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [product]" UpdateCommand="UPDATE [product] SET [pname] = @pname, [pcat] = @pcat, [pic] = @pic, [price] = @price, [mdt] = @mdt WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([mdt] = @original_mdt) OR ([mdt] IS NULL AND @original_mdt IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_pid" Type="Int32" />
        <asp:Parameter Name="original_pname" Type="String" />
        <asp:Parameter Name="original_pcat" Type="String" />
        <asp:Parameter Name="original_pic" Type="String" />
        <asp:Parameter Name="original_price" Type="Decimal" />
        <asp:Parameter Name="original_mdt" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="pname" Type="String" />
        <asp:Parameter Name="pcat" Type="String" />
        <asp:Parameter Name="pic" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="mdt" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="pname" Type="String" />
        <asp:Parameter Name="pcat" Type="String" />
        <asp:Parameter Name="pic" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="mdt" Type="String" />
        <asp:Parameter Name="original_pid" Type="Int32" />
        <asp:Parameter Name="original_pname" Type="String" />
        <asp:Parameter Name="original_pcat" Type="String" />
        <asp:Parameter Name="original_pic" Type="String" />
        <asp:Parameter Name="original_price" Type="Decimal" />
        <asp:Parameter Name="original_mdt" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
