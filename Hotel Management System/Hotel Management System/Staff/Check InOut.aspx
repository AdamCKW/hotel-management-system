<%@ Page Title="Check In/Out " Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Check InOut.aspx.cs" Inherits="Hotel_Management_System.Staff.Check_InOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({ "order": [[7, "asc"]] });
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
         <div class="col-md-5 mx-auto">
            <div class="card">
               <div class="card-body" style="font-size:20px; font-family:Arial; font-weight:bold;">

                  <%--Title Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight: bold;">Check In / Out</h2>
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

                   <%--2nd Row--%> 
                  <div class="row mb-3">
                     <div class="col-md-3">
                        <label>Prefix</label>
                        <div class="form-group">
                           <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="prefixTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Last Name</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="lastnameTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                     </div>
                      <div class="col-md-5">
                        <label>Phone Number</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="pnumberTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                     </div>
                  </div>

                   <%--3rd Row--%> 
                  <div class="row mb-3">
                     <div class="col-md-6">
                        <label>Room Type</label>
                        <div class="form-group">
                            <asp:DropDownList CssClass="form-control" ID="roomDropDownList" runat="server">
                                <asp:ListItem Text="Select Room Type" Value="0" />
                                 <asp:ListItem Text="Standard Queen Room" Value="1" />
                                 <asp:ListItem Text="Standard Twin Room" Value="2" />
                                 <asp:ListItem Text="Deluxe Queen Room" Value="3" />
                                 <asp:ListItem Text="Deluxe Twin Room" Value="4"  />
                                 <asp:ListItem Text="Suite Room" Value="5" />
                                 <asp:ListItem Text="Family Room" Value="6" />
                                 <asp:ListItem Text="Budget Room" Value="7" />
                            </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Room Number</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="roomNoTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:LinkButton class="btn btn-light" ID="getRoomNumberLinkButton" runat="server" OnClick="getRoomNumberLinkButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                            </div>
                        </div>
                     </div>
                  </div>

                   <%--4th Row--%> 
                  <div class="row mb-3">
                     <div class="col-md-6">
                        <label>Check In Date</label>
                        <div class="form-group">
                           <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="checkInTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Check Out Date</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="checkOutTextBox"  runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                     </div>
                  </div>

                  <%--Button Row Row--%>
                  <div class="row mb-3">
                     <div class="col-6">
                        <asp:Button ID="checkInButton" class="btn btn-lg col-12 btn-success" runat="server" Text="Check In" OnClick="checkInButton_Click"/>
                     </div>
                     <div class="col-6">
                        <asp:Button ID="checkOutButton" class="btn btn-lg col-12 btn-primary" runat="server" Text="Check Out" OnClick="checkOutButton_Click"/>
                     </div>
                  </div>
                   <asp:Panel ID="adminPanel" runat="server" Visible="False">
                       <div class="row mb-3">
                         <div class="col-6">
                            <asp:Button ID="revertButton" class="btn btn-lg col-12 btn-warning" runat="server" Text="Revert" Enabled="False" OnClick="revertButton_Click" />
                         </div>
                      </div>
                  </asp:Panel>

               </div>
            </div>
         </div>
       </div>

       <br />

       <div class="row mx-auto"> 
        <%--Room List--%>
         <div class="col-md-12">
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT B.[BookingID], [Prefix], [LastName], [CustomerNo], [RoomTypeID], [RoomNumber], [Night], [Check_InDate], [Check_OutDate], [BookingStatusID] FROM CustomerDetails A INNER JOIN booking_tbl B ON A.CustomerID = B.CustomerID WHERE B.BookingStatusID ='2' OR B.BookingStatusID ='3'">
                         </asp:SqlDataSource>
                         <asp:GridView class="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" emptydatatext="Sorry! There Are No Booking" DataKeyNames="BookingID">
                             <Columns>
                                 <asp:BoundField DataField="BookingID" HeaderText="Booking ID" ReadOnly="True" SortExpression="BookingID" />
                                 <asp:BoundField DataField="Prefix" HeaderText="Prefix" ReadOnly="True" SortExpression="Prefix" />
                                 <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                                 <asp:BoundField DataField="CustomerNo" HeaderText="Customer No" ReadOnly="True" SortExpression="CustomerNo" />
                                 <asp:BoundField DataField="RoomTypeID" HeaderText="Room Type ID" SortExpression="RoomTypeID" />
                                 <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                                 <asp:BoundField DataField="Night" HeaderText="Night" SortExpression="Night" />
                                 <asp:BoundField DataField="Check_InDate" HeaderText="Check-In Date" SortExpression="Check_InDate" />
                                 <asp:BoundField DataField="Check_OutDate" HeaderText="Check-Out Date" SortExpression="Check_OutDate" />
                                 <asp:BoundField DataField="BookingStatusID" HeaderText="Booking Status" SortExpression="BookingStatusID" />
                             </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>

    <br />

</asp:Content>
