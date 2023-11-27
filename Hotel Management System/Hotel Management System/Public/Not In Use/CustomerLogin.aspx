<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Hotel_Management_System.CustomerLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="imgs/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>Guest Login</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">

                        <label>User Email</label>
                        <div class="mb-3">
                           <asp:TextBox CssClass="form-control" ID="userEmail" runat="server" TextMode="Email"></asp:TextBox>
                        </div>

                        <label>Password</label>
                        <div class="mb-3">
                           <asp:TextBox CssClass="form-control" ID="userPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <center>
                           <asp:Button class="btn btn-success col-6 btn-lg" ID="loginButton" runat="server" Text="Login" />
                            </center>
                        </div>

                        <div class="mb-3">
                            <center>
                           <asp:Button class="btn btn-info col-6 btn-lg" ID="signUpButton" runat="server" Text="Sign Up" />
                            </center>
                        </div>

                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <br />
</asp:Content>
