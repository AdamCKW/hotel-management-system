<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Hotel_Management_System.Admin.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="intro" class="bg-image shadow-2-strong">

        <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.8);">

            <div class="container" style="font-size:20px; font-family:Arial; font-weight:bold;">

              <div class="row justify-content-center">
                 <div class="col-xl-5 col-md-8">
                    <div class="card bg-white rounded-5 shadow-5-strong p-5">
                       <div class="card-body">
                          <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Admin Login</h2>
                                </center>
                             </div>
                          </div>
                          <div class="row">
                             <div class="col">
                                <hr>
                             </div>
                          </div>
                          <div class="row mb-3">
                             <div class="col">
                                <label>Admin ID</label>
                                <div class="form-outline">
                                   <asp:TextBox CssClass="form-control" ID="adminID" runat="server"></asp:TextBox>
                                </div>
                             </div>
                          </div>
                          <div class="row mb-3">
                              <div class="col">
                                   <label>Password</label>
                                   <div class="form-outline">
                                        <asp:TextBox CssClass="form-control" ID="adminPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                               </div>
                           </div>
                           <div class="row">
                               <div class="col">
                                   <asp:Button class="btn btn-primary col-12 btn-lg" ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" />
                               </div>
                           </div>
                       </div>
                    </div>
                 </div>
              </div>

           </div>

       </div>

   </div>
</asp:Content>
