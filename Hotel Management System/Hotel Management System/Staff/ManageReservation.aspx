<%@ Page Title="Manage Reservation" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageReservation.aspx.cs" Inherits="Hotel_Management_System.Staff.ManageReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="container-fluid" >
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body" style="font-size:20px; font-family:Arial; font-weight:bold;">

                  <%--Title Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight: bold;">Reservation Details</h2>
                        </center>
                     </div>
                  </div>

                  <%--Line Row--%>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <%--1st Row--%> 
                  <div class="row mb-3">
                     <div class="col-md-6">
                        <label>Booking ID</label>
                        <div class="form-group">
                           <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="bookingIDTextBox" placeholder="e.g. 100" runat="server"></asp:TextBox>
                                <asp:LinkButton class="btn btn-light" ID="idLinkButton" runat="server" OnClick="idLinkButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Customer ID</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="customerIDTextBox" placeholder="" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                     </div>
                  </div>


                  <%--Button Row Row--%>
                  <div class="row mb-3">
                     
                     <div class="col-6">
                        <asp:Button ID="deleteButton" class="btn btn-lg col-12 btn-danger" runat="server" Text="Cancel Reservation" OnClick="deleteButton_Click"/>
                     </div>

                  </div>

               </div>
            </div>
         </div>

        <%--Room List--%>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body" style="font-family:Arial">

                  <%--Title Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight: bold;" >Reservation List</h2>
                        </center>
                     </div>
                  </div>

                  <%--Line Row--%>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <%--Grid View--%>
                  <div class="row">
                     <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT B.[BookingID], B.[CustomerID], [Prefix], [LastName], [CustomerNo], [TotalAmount]  FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE B.BookingStatusID ='2'">
                         </asp:SqlDataSource>
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" emptydatatext="Sorry! There Are No Reservation Made." DataKeyNames="BookingID">
                             <Columns>
                                 <asp:BoundField DataField="BookingID" HeaderText="Booking ID" ReadOnly="True" SortExpression="BookingID" />
                                 <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" />
                                 <asp:BoundField DataField="Prefix" HeaderText="Prefix" SortExpression="Prefix" />
                                 <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                 <asp:BoundField DataField="CustomerNo" HeaderText="Customer No" SortExpression="CustomerNo" />
                                 <asp:BoundField DataField="TotalAmount" HeaderText="Total" SortExpression="TotalAmount" DataFormatString="{0:c}" />
                             </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>

    <br /><br /><br /><br /><br /><br /><br /><br /><br />

</asp:Content>
