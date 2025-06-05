<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="ECommerece_App.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <head>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    </head>
    <br />
    <div style="position:absolute;left:47%;top:10%">
        <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Download Invoice" OnClick="Button1_Click" />
    </div>
    <br />
    <div style="position:absolute;left:35%;top:10%">
        <asp:Button ID="Button2" class="btn btn-success" runat="server" Text="Payment" Width="150px" />
    </div>
    
    <br />
   
    <asp:Panel ID="Panel1" runat="server" Height="503px">
        <p align="center"style="color:blue; font-family: 'Informal Roman';">Hey ! Thank You For Shopping From Flipcart<br />Have A Nice Day </p>
        <br />
        <h1 align="center" style="color:yellow"><em><strong><b>Flipcart</b></strong></em><strong><br /><br /><span style="text-decoration: underline ;color:blue">Product Details</span></strong></h1>
       
        <table border="1" cellspacing="4" cellpadding="5" class="w-100"  height: "216px" >
            <tr>
                <td style="border-style: solid; border-width: medium; width: 791px; "><strong>Order Id : </strong>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td style="border-style: solid; border-width: medium; "><strong>Email Id : </strong><em>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    </em>
                    <br />
                    <br />
                    <strong>Contact No :</strong>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td style=" border-style: solid; border-width: medium; width: 791px; height: 20px;"><span style="text-decoration: underline"><strong>Seller Address : </strong></span>
                    <br />
                    <br />
                    Uluberia-II , Bazar Market , Shop No - 07.<br /> Uluberia , Howrah , Westbengal .
                    <br />
                </td>
                <td style=" border-style: solid; border-width: medium; height: 20px;"><span style="text-decoration: underline"><strong>Buyer Address : </strong></span>
                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100%; height: 305px;" >
                  
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"   DataKeyNames="pid" DataSourceID="SqlDataSource2" Width="100%"  >
                        <Columns>
                            <asp:BoundField DataField="pid" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
                            <asp:BoundField DataField="pname" HeaderText="Product Name " SortExpression="pname" />
                            <asp:BoundField DataField="pcat" HeaderText="Product Category" SortExpression="pcat" />
                            <asp:BoundField DataField="perprice" HeaderText="per price" SortExpression="perprice" />
                            <asp:BoundField DataField="qty" HeaderText="Product Quantity" SortExpression="qty" />
                            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                            <asp:BoundField DataField="dt" HeaderText="Order Date " SortExpression="dt" />
                        </Columns>
                        
                        
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [placeorder] WHERE ([suser] = @suser)">
                        <SelectParameters>
                            <asp:SessionParameter Name="suser" SessionField="myuser" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                  
                </td>
              
            </tr>
            <tr>

                <td colspan="2" style="width: 260px; height: 62px; " ><strong><em>
                     Grand Total : </em><asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                     <br />
                    </strong></td>
            </tr>
        </table>
    </asp:Panel>
  

</asp:Content>
