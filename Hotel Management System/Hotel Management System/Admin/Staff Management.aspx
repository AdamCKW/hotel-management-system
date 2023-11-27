<%@ Page Title="Account Management" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Staff Management.aspx.cs" Inherits="Hotel_Management_System.Admin.Staff_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body" style="font-size:20px; font-family:Arial; font-weight:bold;">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight:bold">Staff Details</h2>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="/imgs/generaluser.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <%--First Row--%>
                  <div class="row mb-3">

                      <%--Staff ID--%>
                     <div class="col-md-4">
                        <label>Staff ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="idTextBox" runat="server"></asp:TextBox>
                              <asp:LinkButton class="btn btn-light" ID="getButton" runat="server" OnClick="getButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>

                     <%--First Name--%>
                     <div class="col-md-4">
                            <label>First Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="firstName" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                     </div>

                     <%--Last Name--%>
                     <div class="col-md-4">
                            <label>Last Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="lastName" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                    </div>
                  </div>

                  <%--Second Row--%>
                  <div class="row mb-3">

                     <%--Date Of Birth--%>
                     <div class="col-md-3">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="dobTextBox" runat="server"  ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                     <%--Contact No--%>
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="contactTextBox" runat="server"  ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                     <%--Email--%>
                     <div class="col-md-5">
                        <label>Email</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="emailTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <%--Third Row--%>
                  <div class="row mb-3">

                     <%--State--%>
                     <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="stateTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                     <%--City--%>
                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="cityTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                     <%--Zip Code--%>
                     <div class="col-md-4">
                        <label>Zip Code</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="zipTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <%--Fourth Row--%>
                  <div class="row mb-3">

                     <%--Full Address--%>
                     <div class="col-12">
                        <label>Full Postal Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="addressTextBox" runat="server" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <%--Button Row--%>
                  <div class="row mb-3">
                     <div class="col-8 mx-auto">
                        <asp:Button ID="deleteButton" class="btn btn-lg col-12 btn-danger" runat="server" Text="Delete User Permanently" OnClick="deleteButton_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <br>
         </div>

         <%--Data Table--%>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight:bold">Staff List</h2>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">

                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT * FROM [staff_tbl]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StaffID" DataSourceID="SqlDataSource1" emptydatatext="Sorry! There Are No User Accounts.">
                            <Columns>
                                <asp:BoundField DataField="StaffID" HeaderText="Staff ID" InsertVisible="False" ReadOnly="True" SortExpression="StaffID" />
                                <asp:BoundField DataField="LoginID" HeaderText="Login ID" SortExpression="LoginID" />
                                <asp:BoundField DataField="FirstName" HeaderText="F_Name" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="L_Name" SortExpression="LastName" />
                                <asp:BoundField DataField="DoB" HeaderText="DoB" SortExpression="DoB" />
                                <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

</asp:Content>
