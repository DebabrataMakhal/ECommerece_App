<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="ECommerece_App.AllProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div>
        <asp:Button ID="Button2" style="position:absolute;left:50%; top: 69px;" class="btn btn-success" runat="server" Text="Low To High" OnClick="Button2_Click" />    
        <asp:Button ID="Button3" style="position:absolute;left:39%; top: 68px;"  class="btn btn-info" runat="server" Text="High To Low" OnClick="Button3_Click" />
    </div>
         
    <br />

    <asp:DataList ID="DataList1" runat="server" Height="387px" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>

            <div class="card" style="width: 18rem;">
              <img class="card-img-top" height="200" width="60" src=<%#Eval("pic") %> alt="Card image cap">            
              <div class="card-body">
                <h5 class="card-title"><%#Eval("pname") %></h5>
              </div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item"><b>Category :</b><%#Eval("pcat") %></li>
                <li class="list-group-item"><b>Price :</b><%#Eval("price") %></li>
                  <li class="list-group-item"><b>Quantity </b>
                  <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                 </asp:DropDownList></li>
                
              </ul>
              <div class="card-body">
                  <asp:Button ID="Button1" class="btn btn-sm btn-info" runat="server" CommandName="AddToCart" CommandArgument='<%#Eval("pid") %>' Text="ADD TO CART" />
              </div>
            </div>

        </ItemTemplate>
    </asp:DataList>
   
</asp:Content>


