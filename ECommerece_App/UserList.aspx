<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="ECommerece_App.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
   
    <div  style="">
        <br />
    <asp:GridView Id="GridView1" runat="server" AutoGenerateColumns="False" Hight="100" Width="100%" OnRowDeleting="GridView1_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" >
        

        <AlternatingRowStyle BackColor="White" />
        

        <columns >
            <asp:TemplateField HeaderText="Profile">
                <ItemTemplate>
                    <asp:Image runat="server" height="100" width="100" Imageurl='<%#Eval("acc_profile")%>'></asp:Image>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label Id="Label4" runat="server" Text='<%#Eval("id")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label Id="Lablel1" runat="server" Text='<%#Eval("acc_user")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label Id="Lablel2" runat="server" Text='<%#Eval("acc_email")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Role">
            <ItemTemplate>
                <asp:Label Id="Lablel3" runat="server" Text='<%#Eval("acc_role")%>'></asp:Label>
            </ItemTemplate>
           </asp:TemplateField>

             <asp:TemplateField HeaderText="Action">
             <ItemTemplate>
                 <asp:Button Id="Button1" runat="server" class="btn btn-sm btn-danger" CommandName="Delete" CommandArgument='<%#Eval("id") %>' Text="Delete" /> 
             </ItemTemplate>
            </asp:TemplateField>

        </columns>

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
    
</div>
</asp:Content>
