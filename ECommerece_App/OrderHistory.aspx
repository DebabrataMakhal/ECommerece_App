<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ECommerece_App.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div style="position:relative;left:35%">
          From <asp:TextBox ID="TextBox1" runat="server"  TextMode="Date"></asp:TextBox>
          To <asp:TextBox ID="TextBox2" runat="server"  TextMode="Date"></asp:TextBox>

         &nbsp <asp:Button ID="Button1" runat="server" Text="Search" Width="94px" OnClick="Button1_Click1" />
    </div>
    <head>
        <style>
            .myclass{
                visibility:hidden;

            }
        </style>
    </head>
  
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="pid" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="100%" HorizontalAlign="Justify" PageSize="5" Width="100%">
    <Columns>
        <asp:ImageField DataImageUrlField="pic" HeaderText="Image">
            <ControlStyle Height="100px" Width="100px" />
        </asp:ImageField>
        <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
        <asp:BoundField DataField="pname" HeaderText="p_name" SortExpression="pname" />
        <asp:BoundField DataField="pcat" HeaderText="p_category" SortExpression="pcat" />
        <asp:BoundField DataField="qty" HeaderText="p_Qantity" SortExpression="qty" />
        <asp:BoundField DataField="perprice" HeaderText="perprice Item Price" SortExpression="perprice" />
        <asp:BoundField DataField="price" HeaderText="Total_price" SortExpression="price" />
        <asp:BoundField DataField="dt" HeaderText="Date" SortExpression="dt" />
        <asp:BoundField DataField="suser" HeaderText="User Id" SortExpression="suser" />
        <asp:BoundField DataField="pstatus" HeaderText="Product Status" SortExpression="pstatus" />
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [placeorder] WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([dt] = @original_dt) OR ([dt] IS NULL AND @original_dt IS NULL)) AND (([suser] = @original_suser) OR ([suser] IS NULL AND @original_suser IS NULL)) AND (([perprice] = @original_perprice) OR ([perprice] IS NULL AND @original_perprice IS NULL))" InsertCommand="INSERT INTO [placeorder] ([pname], [pcat], [price], [qty], [pic], [dt], [suser], [perprice]) VALUES (@pname, @pcat, @price, @qty, @pic, @dt, @suser, @perprice)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [placeorder] WHERE ([suser] = @suser)" UpdateCommand="UPDATE [placeorder] SET [pname] = @pname, [pcat] = @pcat, [price] = @price, [qty] = @qty, [pic] = @pic, [dt] = @dt, [suser] = @suser, [perprice] = @perprice WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([dt] = @original_dt) OR ([dt] IS NULL AND @original_dt IS NULL)) AND (([suser] = @original_suser) OR ([suser] IS NULL AND @original_suser IS NULL)) AND (([perprice] = @original_perprice) OR ([perprice] IS NULL AND @original_perprice IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_pid" Type="Int32" />
        <asp:Parameter Name="original_pname" Type="String" />
        <asp:Parameter Name="original_pcat" Type="String" />
        <asp:Parameter Name="original_price" Type="Decimal" />
        <asp:Parameter Name="original_qty" Type="Int32" />
        <asp:Parameter Name="original_pic" Type="String" />
        <asp:Parameter Name="original_dt" Type="String" />
        <asp:Parameter Name="original_suser" Type="String" />
        <asp:Parameter Name="original_perprice" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="pname" Type="String" />
        <asp:Parameter Name="pcat" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="qty" Type="Int32" />
        <asp:Parameter Name="pic" Type="String" />
        <asp:Parameter Name="dt" Type="String" />
        <asp:Parameter Name="suser" Type="String" />
        <asp:Parameter Name="perprice" Type="Decimal" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="suser" SessionField="myuser" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="pname" Type="String" />
        <asp:Parameter Name="pcat" Type="String" />
        <asp:Parameter Name="price" Type="Decimal" />
        <asp:Parameter Name="qty" Type="Int32" />
        <asp:Parameter Name="pic" Type="String" />
        <asp:Parameter Name="dt" Type="String" />
        <asp:Parameter Name="suser" Type="String" />
        <asp:Parameter Name="perprice" Type="Decimal" />
        <asp:Parameter Name="original_pid" Type="Int32" />
        <asp:Parameter Name="original_pname" Type="String" />
        <asp:Parameter Name="original_pcat" Type="String" />
        <asp:Parameter Name="original_price" Type="Decimal" />
        <asp:Parameter Name="original_qty" Type="Int32" />
        <asp:Parameter Name="original_pic" Type="String" />
        <asp:Parameter Name="original_dt" Type="String" />
        <asp:Parameter Name="original_suser" Type="String" />
        <asp:Parameter Name="original_perprice" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" style="position:absolute;top: 20%;"  AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="pid"  GridLines="Horizontal" Height="100%" HorizontalAlign="Justify"  Width="100%" PageSize="5">
            <Columns>
        <asp:ImageField DataImageUrlField="pic" HeaderText="Image">
            <ControlStyle Height="100px" Width="100px" />
        </asp:ImageField>
        <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
        <asp:BoundField DataField="pname" HeaderText="p_name" SortExpression="pname" />
        <asp:BoundField DataField="pcat" HeaderText="p_category" SortExpression="pcat" />
        <asp:BoundField DataField="qty" HeaderText="p_Qantity" SortExpression="qty" />
        <asp:BoundField DataField="perprice" HeaderText="perprice Item Price" SortExpression="perprice" />
        <asp:BoundField DataField="price" HeaderText="Total_price" SortExpression="price" />
        <asp:BoundField DataField="dt" HeaderText="Date" SortExpression="dt" />
        <asp:BoundField DataField="suser" HeaderText="User Id" SortExpression="suser" />
        <asp:BoundField DataField="pstatus" HeaderText="Product Status" SortExpression="pstatus" />
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
    <PagerStyle BackColor="#FFFF66" ForeColor="#99CCFF" HorizontalAlign="Center" BorderStyle="Solid" />
    <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>

</asp:Content>
