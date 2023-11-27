<%@ Page Title="Staff Sign Up" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="StaffSignUp.aspx.cs" Inherits="Hotel_Management_System.Staff.StaffSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container" style="font-size:20px; font-family:Arial; font-weight:bold;">
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
                                        <h2 style="font-weight:bold">Add Staff Account</h2>
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
                                        <asp:TextBox CssClass="form-control" ID="firstName" placeholder="e.g. John" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Last Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="lastName" placeholder="e.g. Doe" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%-- Second Row --%>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="dateOfBirth" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="contactNumber" runat="server" placeholder="e.g. 010-999-9999" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                             <%-- Third Row --%>
                            <div class="row mb-3">
                                
                                <div class="col-md-6">
                                    <label>Email</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="emailText" runat="server" placeholder="e.g. example@company.com" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Confirm Email</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="confirmEmail" runat="server" placeholder="e.g. example@company.com" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                                
                            </div>

                            <%-- Fourth Row --%>
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="Select" Value="Select" />
                                            <asp:ListItem Text="Johor" Value="Johor" />
                                            <asp:ListItem Text="Kedah" Value="Kedah" />
                                            <asp:ListItem Text="Kelantan" Value="Kelantan" />
                                            <asp:ListItem Text="Melaka" Value="Melaka" />
                                            <asp:ListItem Text="Negeri Sembilan" Value="Negeri Sembilan" />
                                            <asp:ListItem Text="Pahang" Value="Pahang" />
                                            <asp:ListItem Text="Penang" Value="Penang" />
                                            <asp:ListItem Text="Perak" Value="Perak" />
                                            <asp:ListItem Text="Perlis" Value="Perlis" />
                                            <asp:ListItem Text="Sabah" Value="Sabah" />
                                            <asp:ListItem Text="Sarawak" Value="Sarawak" />
                                            <asp:ListItem Text="Selangor" Value="Selangor" />
                                            <asp:ListItem Text="Terengganu" Value="Terengganu" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="cityTextBox" runat="server" placeholder="e.g. Klang"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Zip Code</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="zipTextBox" runat="server" placeholder="101010" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                             <%-- Fifth Row --%>
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="addressTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                                    <label>Login ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="staffID" runat="server" placeholder="e.g. JohnDoe123"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%-- Sixth Row --%>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="staffPassword" runat="server" placeholder="min. 8 chars" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Confirm Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="confirmPassword" runat="server" placeholder="min. 8 chars" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--Sign UP Button--%>
                            <div class="row mb-3">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success col-12 btn-lg" ID="signUpButton" runat="server" Text="Add User" OnClick="signUpButton_Click" />
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
