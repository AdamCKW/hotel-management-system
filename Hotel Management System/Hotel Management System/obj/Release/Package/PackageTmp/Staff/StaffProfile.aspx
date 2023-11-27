<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StaffProfile.aspx.cs" Inherits="Hotel_Management_System.Staff.StaffProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 mx-auto">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="/imgs/generaluser.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>Staff Profile</h3>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <%-- First Row --%>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>First Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="firstName" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Last Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="lastName" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%-- Second Row --%>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="dateOfBirth" runat="server" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="contactNumber" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                             <%-- Third Row --%>
                            <div class="row mb-3">
                                
                                <div class="col-md-6">
                                    <label>Current Email</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="emailText" runat="server" TextMode="Email" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="newEmailLabel" runat="server" Text="New Email" Visible="False"></asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="newEmail" runat="server" TextMode="Email" Visible="False"></asp:TextBox>
                                    </div>
                                </div>
                                
                            </div>

                            <%-- Fourth Row --%>
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="stateTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="cityTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Zip Code</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="zipTextBox" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                             <%-- Fifth Row --%>
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="addressTextBox" runat="server" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                       
                            <%-- Pill Badge --%>
                            <div class="row mb-3">
                                <div class="col">
                                    <center>
                                    <span class="badge rounded-pill bg-info text-dark">Login Credential</span>
                                    </center>
                                </div>
                            </div>

                            <%-- Fifth Row --%>
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label>Staff Login ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="staffID" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%-- Sixth Row --%>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Current Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="staffPassword" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="newPasswordLabel" runat="server" Text="New Password" Visible="False"></asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="newPassword" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--Sign UP Button--%>
                            <div class="row mb-3">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success col-12 btn-lg" ID="editButton" runat="server" Text="Edit Profile" OnClick="editButton_Click" />
                                        <asp:Button class="btn btn-warning col-12 btn-lg" ID="updateButton" runat="server" Text="Update Profile" Visible="False" OnClick="updateButton_Click" Enabled="False" />
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
