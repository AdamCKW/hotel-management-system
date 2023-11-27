<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GuestProfile.aspx.cs" Inherits="Hotel_Management_System.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid" style="font-size:20px; font-family:Arial; font-weight:bold;">
      <div class="row">
         <div class="col-md-5">
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
                           <h2 style="font-weight:bold">User Profile</h2>
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

                        <%--First Row--%>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label>First Name</label>
                                 <asp:TextBox CssClass="form-control" ID="firstName" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                                <label>Last Name</label>
                                <asp:TextBox CssClass="form-control" ID="lastName" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>

                        <%--Second Row--%>
                        <div class="row mb-3">
                            <div class="col-md-12">
                            <label>Phone Number</label>
                               <asp:TextBox CssClass="form-control" ID="phoneNumber" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>

                         <%--Third Row--%>
                        <div class="row mb-3">
                            
                            <div class="col-md-6">
                            <label>Current Email</label>
                               <asp:TextBox CssClass="form-control" ID="userEmail" runat="server" TextMode="Email" ReadOnly="True"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                            <asp:Label ID="newEmailLabel" runat="server" Text="New Email" Visible="False"></asp:Label>
                               <asp:TextBox CssClass="form-control" ID="newEmail" runat="server"  TextMode="Email" Visible="False"></asp:TextBox>
                            </div>

                        </div>

                         <%--Fourth Row--%>
                        <div class="row mb-3">
                            
                            <div class="col-md-6">
                            <label>Current Password</label>
                               <asp:TextBox CssClass="form-control" ID="userPassword" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                            <asp:Label ID="newPasswordLabel" runat="server" Text="New Password" Visible="False"></asp:Label>
                               <asp:TextBox CssClass="form-control" ID="newPassword" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                            </div>

                        </div>
                        <%--Button Row--%>
                        <div class="row mb-3">
                            <div class="mb-3">
                                <asp:Button class="btn btn-success col-12 btn-lg" ID="editButton" runat="server" Text="Edit Profile" />
                                <asp:Button class="btn btn-warning col-12 btn-lg" ID="Button1" runat="server" Text="Update Profile" Visible="False" />
                            </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

          <div class="col-md-7">
                <div class="card">
                   <div class="card-body">
                      <div class="row">
                         <div class="col">
                            <center>
                               <img width="100" src="imgs/books1.png"/>
                            </center>
                         </div>
                      </div>
                      <div class="row">
                         <div class="col">
                            <center>
                               <h2 style="font-weight:bold">Your Reserved Rooms</h2>
                               <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="your books info"></asp:Label>
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
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                         </div>
                      </div>
                   </div>
                </div>
             </div>

      </div>
            
   </div>
    <br />
</asp:Content>
