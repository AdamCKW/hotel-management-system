<%@ Page Title="Staff Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="Hotel_Management_System.Staff.StaffLogin" %>
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
                                   <h2 style="font-weight:bold">Staff Login</h2>
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
                                <label>Staff ID</label>
                                <div class="mb-3">
                                   <asp:TextBox CssClass="form-control" ID="staffIDTextBox" runat="server"></asp:TextBox>
                                </div>
                             </div>
                          </div>
                           <div class="row">
                                <div class="col">
                                    <label>Password</label>
                                    <div class="mb-3">
                                       <asp:TextBox CssClass="form-control" ID="staffPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                           <div class="row">
                                <div class="col wrap">
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
