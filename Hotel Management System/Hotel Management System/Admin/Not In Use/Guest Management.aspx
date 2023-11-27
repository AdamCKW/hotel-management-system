<%@ Page Title="Guest Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Guest Management.aspx.cs" Inherits="Hotel_Management_System.Guest_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Customer Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/generaluser.png" />
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
                     <div class="col-md-12">
                        <label>Customer Email</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="emailTextBox" runat="server"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="getButton" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>

                     
                  </div>

                  <%--Second Row--%>
                  <div class="row mb-3">

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

                     <%--Contact No--%>
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="contactTextBox" runat="server"  ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                  </div>


                  <%--Button Row--%>
                  <div class="row mb-3">
                     <div class="col-8 mx-auto">
                        <asp:Button ID="deleteButton" class="btn btn-lg col-12 btn-danger" runat="server" Text="Delete Guest Data" />
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
                           <h4>Customer Account List</h4>
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

</asp:Content>
