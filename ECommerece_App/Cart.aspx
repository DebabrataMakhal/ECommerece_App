<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ECommerece_App.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Height="90%" Width="100%" OnRowDeleting="GridView1_RowDeleting" PageSize="7" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" Height="50" Width="50" ImageUrl='<%#Eval("pic") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Product Id">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%#Eval("pid") %>'></asp:Label>    
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("pname") %>'></asp:Label>    
                </ItemTemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="Category" >
                   <ItemTemplate>
                       <asp:Label ID="Label2" runat="server" Text='<%#Eval("pcat") %>'></asp:Label>    
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="Quantity">
                   <ItemTemplate>
                       <asp:Label ID="Label3" runat="server" Text='<%#Eval("qty") %>'></asp:Label>    
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="Per Iteam Price">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("perprice") %>'></asp:Label>    
                    </ItemTemplate>
                </asp:TemplateField>


               <asp:TemplateField HeaderText="Total Price">
                   <ItemTemplate>
                       <asp:Label ID="Label5" runat="server" Text='<%#Eval("price") %>'></asp:Label>    
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="Date">
                   <ItemTemplate>
                       <asp:Label ID="Label6" runat="server" Text='<%#Eval("dt") %>'></asp:Label>    
                   </ItemTemplate>
               </asp:TemplateField>

              <asp:TemplateField HeaderText="User Email Id">
                  <ItemTemplate>
                      <asp:Label ID="Label7" runat="server" Text='<%#Eval("suser") %>'></asp:Label>    
                  </ItemTemplate>
              </asp:TemplateField>

             <asp:TemplateField HeaderText="Action">
                 <ItemTemplate>
                     <div>
                    <i class="fa fa-trash" style="color:black;position:relative;left:35px"></i> <asp:Button ID="Button1" style="border-radius:50px;background-color:red;width:50px;cursor:pointer"  CommandName="Delete"   runat="server"  />      
                     </div>
                 </ItemTemplate>
                 <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
             </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    
    <br />
    <div style="background-color:#CCCCCC"> 
          <div style="border-style: solid; border-color: #000000; padding: 5px; width:30%; height: 150px; position:relative; left:33%; background-color: #808080; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-weight: bold; font-style: italic; color: #FFFFFF;" >
                Address :<asp:TextBox ID="TextBox3" class="form-control" runat="server" placeholder="Enter Your Address"></asp:TextBox> 
                Contact No :<asp:TextBox ID="TextBox4" class="form-control" runat="server" placeholder="Contact Number"></asp:TextBox>
                <br />
                <span style="position:relative;left:40%;top:12%">
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" Text="Place Order" OnClick="Button2_Click" />
                </span>
           </div>
   
          
    <br />

     <div style="background:#000000; border:5px solid Grey;height:50px;width:248px;position:absolute;left:83%; padding:7px; color: #FFFFFF; font-weight: bold;border-radius:29px;bottom:7%">Grand Total :
         <asp:Label ID="Label9" runat="server"></asp:Label> Rs
     </div>

    &nbsp &nbsp<a href="AllProduct.aspx"><button type="button" class="btn btn-info"><i class="fa fa-arrow-left" style="color: white; font-size:20px" ></i> Continue Shopping</button></a>
    
   &nbsp &nbsp 
        <br />
 </div>
</asp:Content>
