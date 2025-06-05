<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ECommerece_App.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <h1 style="color:cornflowerblue;text-align:center;padding-bottom:2px;border:3px solid blue;font-style:italic;background-color:yellow ">Add Products</h1>   
    <div style="width:30%;padding:40px;border:5px solid  blue;position:absolute;left:35%; background-color: #FFFF00;">
        <div class="form-group">
        <label for="exampleInputEmail1">Product Name</label>
         <asp:TextBox ID="TextBox1" class="form-control" runat="server" PlaceHolder="Product Name"></asp:TextBox>
     </div>

    <div class="form-group">
         <label for="exampleInputEmail1">Product Catagory</label>
        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
            <asp:ListItem>Electronic</asp:ListItem>
            <asp:ListItem>Foods</asp:ListItem>
            <asp:ListItem>Clothes</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
         </asp:DropDownList> 
    </div>

    <div class="form-group">
        <label for="exampleInputEmail1">Product Price</label>
         <asp:TextBox ID="TextBox2" class="form-control" runat="server" PlaceHolder=""></asp:TextBox>
    </div>

    <div class="form-group">
      <label for="exampleInputEmail1">Product Picture</label>
       <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
    </div>
  
    <asp:Button ID="Button1" runat="server" class="btn btn-sm btn-info" Text="Add" OnClick="Button1_Click" />
 </div>
       
</asp:Content>
