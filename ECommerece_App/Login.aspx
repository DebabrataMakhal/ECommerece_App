<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECommerece_App.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>

    </title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <video autoplay muted loop id="myVideo" style="width:100%; height: 100%; background-repeat: no-repeat; background-attachment: scroll;" >
         <source src="https://videos.pexels.com/video-files/5889074/5889074-uhd_2560_1440_25fps.mp4"  type="video/mp4">
     </video>
   
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
    
    <form id="form1" runat="server">   
        <h1 style="position:absolute;left:2%; top:3% ; color:blue; font-style: italic; bottom: 0px;">Flipcart</h1>
        <div style="padding:20px; width:30%; height:36%;position:absolute;left:35%;top:35%; background-attachment: fixed;">    
           
              <div class="form-group">
                <label for="exampleInputEmail1" style="font-weight: bolder; text-decoration: blink;"></label>
               <asp:TextBox ID="TextBox1" class="form-control" style="background:none; color:white;" placeholder="Enter Email Id" runat="server"  Wrap="False" Font-Bold="True"></asp:TextBox>
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1"></label>
                  <asp:TextBox ID="TextBox2" class="form-control" style="background:none;color:white;" placeholder="Enter your Password" runat="server" Font-Bold="True" TextMode="Password"></asp:TextBox>
              </div>
               <asp:Button ID="Button1" class="btn btn-info" runat="server" style="width:100%" Text="Login"  ValidateRequestMode="Disabled" OnClick="Button1_Click" /><br />
               <a href="#" runat="server" data-toggle="modal" data-target="#exampleModal" style="background:none ;color:whitesmoke;border:none ;position:absolute;left:33%;bottom:15px ;text-decoration:underline ;outline:none">Create New Account  </a>
            
            </div>




       
<!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"  aria-labelledby="exampleModalLabel" aria-hidden="true" >
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registration</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">

              <div>    
               <div class="form-group">
                 <label for="exampleInputEmail1" ">User Name</label>
                <asp:TextBox ID="TextBox3" class="form-control"  placeholder="Enter User Name" runat="server"  Wrap="False" ></asp:TextBox>
               </div>
               <div class="form-group">
                 <label for="exampleInputPassword1">Email Id</label>
                   <asp:TextBox ID="TextBox4" class="form-control"  placeholder="Enter  Email Id" runat="server"  TextMode="Email"></asp:TextBox>
               </div>

                <div class="form-group">
                  <label for="exampleInputEmail1" ">Password</label>
                 <asp:TextBox ID="TextBox5" class="form-control"  placeholder="Enter Password" runat="server"   TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                <label for="exampleInputEmail1" ">Profile</label>
                    <asp:FileUpload ID="FileUpload1" class="form-control" runat="server"  /> 
                </div>

                <asp:Button ID="Button2" class="btn btn-primary" runat="server" style="width:100%" Text="Sign Up"  ValidateRequestMode="Disabled" OnClick="Button2_Click" /><br />

            </div>

              </div>
             
            </div>
          </div>
        </div>




    </form>
</body>
</html>
