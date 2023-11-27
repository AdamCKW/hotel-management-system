<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerSignUp.aspx.cs" Inherits="Hotel_Management_System.CustomerSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
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
                           <h3>Guest Sign Up</h3>
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
                                 <asp:TextBox CssClass="form-control" ID="firstName" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                                <label>Last Name</label>
                                <asp:TextBox CssClass="form-control" ID="lastName" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <%--Second Row--%>
                        <div class="row mb-3">
                            <div class="col-md-12">
                            <label>Phone Number</label>
                               <asp:TextBox CssClass="form-control" ID="phoneNumber" runat="server" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>

                         <%--Third Row--%>
                        <div class="row mb-3">
                            
                            <div class="col-md-6">
                            <label>Email</label>
                               <asp:TextBox CssClass="form-control" ID="userEmail" runat="server" TextMode="Email"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                            <label>Confirm Email</label>
                               <asp:TextBox CssClass="form-control" ID="confirmEmail" runat="server" TextMode="Email"></asp:TextBox>
                            </div>

                        </div>

                         <%--Fourth Row--%>
                        <div class="row mb-3">
                            
                            <div class="col-md-6">
                            <label>Password</label>
                               <asp:TextBox CssClass="form-control" ID="userPassword" runat="server" TextMode="Password"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                            <label>Confirm Password</label>
                               <asp:TextBox CssClass="form-control" ID="confirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            </div>

                        </div>
                        <%--Button Row--%>
                        <div class="row mb-3">
                            <div class="mb-3">
                                <asp:Button class="btn btn-success col-12 btn-lg" ID="signUpButton" runat="server" Text="Sign Up" />
                            </div>
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
