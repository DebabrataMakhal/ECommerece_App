<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="ECommerece_App.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
          <style>
            .myclass{
                visibility:hidden;

            }
              .auto-style1 {
                  position: absolute;
                  top: 20%;
                  left: 0px;
              }
          </style>
    </head>
    <br />
     <div style="position:relative;left:35%">
               From <asp:TextBox ID="TextBox1" runat="server"  TextMode="Date"></asp:TextBox>
               To <asp:TextBox ID="TextBox2" runat="server"  TextMode="Date"></asp:TextBox>
              &nbsp <asp:Button ID="Button1" runat="server" Text="Filter" Width="94px" OnClick="Button1_Click" BackColor="Black" Font-Bold="True" ForeColor="White"  />
             </div>
            <br />
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="5" Width="100%" Height="598px" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="pid" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
                    <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname" />
                    <asp:BoundField DataField="pcat" HeaderText="Category" SortExpression="pcat" />
                    <asp:BoundField DataField="perprice" HeaderText="perprice" SortExpression="perprice" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
                    <asp:BoundField DataField="suser" HeaderText="Customer Name" SortExpression="suser" />
                    <asp:BoundField DataField="dt" HeaderText="Date" SortExpression="dt" />
                    <asp:BoundField DataField="pstatus" HeaderText="Product Status" SortExpression="pstatus" />
                      <asp:TemplateField HeaderText="Deliver">
                          <ItemTemplate>
                              <asp:Button ID="Button2" class="btn btn-success" CommandName="status" CommandArgument='<%#Eval("pid") %>' runat="server"  Text="Approved" />
                          </ItemTemplate>
                      </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [placeorder]"></asp:SqlDataSource>

     <asp:GridView ID="GridView2" runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="pid"  GridLines="Horizontal" Height="100%" HorizontalAlign="Justify"  Width="100%" OnRowCommand="GridView2_RowCommand" CssClass="auto-style1">
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
                <asp:TemplateField HeaderText="Deliver">
                    <ItemTemplate>
                        <asp:Button ID="Button2" class="btn btn-success" CommandName="status" CommandArgument='<%#Eval("pid") %>' runat="server"  Text="Approved" />
                    </ItemTemplate>
                </asp:TemplateField>
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

</asp:Content>
