<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="DeleteAccount.aspx.cs" Inherits="ECommerece_App.DeleteAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:DataList ID="DataList1" runat="server" Width="285px" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <div class="card" style="width: 18rem;">
              <img class="card-img-top" height="100%" width="150" src='<%#Eval("acc_profile")%>'  alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title"><%#Eval("acc_user")%></h5>
              </div>
              <ul class="list-group list-group-flush">   
                <li class="list-group-item"><b>Email Id </b><%#Eval("acc_email")%></li>
                <li class="list-group-item"><b>Role :</b><%#Eval("acc_Role")%></li>
              </ul>
              <div class="card-body">
                  <asp:Button Id="Button1" class="btn btn-sm btn-danger" runat="server" CommandName="Delete" CommandArgument='<%#Eval("id") %>' Text="Delete Account" />
              </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
  
</asp:Content>
