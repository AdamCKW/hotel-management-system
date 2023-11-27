<%@ Page Title="Reservation Form" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Booking Form.aspx.cs" Inherits="Hotel_Management_System.Public.TestingOnly.Booking_Form" %>
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

    <%--Content--%>
    <div class="container-fluid" style="font-size:20px; font-family:Arial; font-weight:bold;">
      <div class="row">
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">

                        <%-------------------------------Contact Info-------------------------------%>

                        <%--Title Row--%>
                        <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Contact Info</h2>
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
                            
                            <%--First Name--%>
                            <div class="col-md-6">
                                <label>First Name</label>
                                <div class="input-group">
                                    <asp:DropDownList CssClass="form-control" ID="prefixList" runat="server">
                                        <asp:ListItem Text="Prefix" Value="NA" />
                                        <asp:ListItem Text="Dr." Value="Dr." />
                                        <asp:ListItem Text="Miss." Value="Miss." />
                                        <asp:ListItem Text="Mr." Value="Mr." />
                                        <asp:ListItem Text="Mrs." Value="Mrs." />
                                        <asp:ListItem Text="Ms." Value="Ms." />
                                        <asp:ListItem Text="Pr." Value="Pr." />
                                        <asp:ListItem Text="Prof." Value="Prof." />
                                        <asp:ListItem Text="Rev" Value="Rev" />
                                    </asp:DropDownList>
                                    <asp:TextBox CssClass="form-control" ID="firstName" runat="server" placeholder="e.g. John"></asp:TextBox>
                                </div>
                            </div>

                            <%--Last Name--%>
                            <div class="col-md-6">
                                <label>Last Name</label>
                                <asp:TextBox CssClass="form-control" ID="lastName" runat="server" placeholder="e.g. Doe"></asp:TextBox>
                            </div>
                        </div>

                        <%--2nd Row--%>
                        <div class="row mb-3">

                            <%--Email--%>
                            <div class="col-md-6">
                                <label>Email</label>
                               <asp:TextBox CssClass="form-control" ID="emailTextBox" runat="server" TextMode="Email" placeholder="e.g. example@company.com"></asp:TextBox>
                            </div>

                            <%--Phone Number--%>
                            <div class="col-md-6">
                                <label>Phone Number</label>
                                <input id="phoneNumber" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 999-999 9999" name="phoneNumber">
                            </div>
                        </div>

                        <%--3rd Row--%>
                        <div class="row mb-3">
                            
                            <%--City--%>
                            <div class="col-md-3">
                               <label>City</label>
                               <asp:TextBox CssClass="form-control" ID="cityTextBox" runat="server" placeholder="e.g. Klang"></asp:TextBox>
                            </div>

                            <%--Zip / Postal code--%>
                            <div class="col-md-3">
                               <label>Zip/Postal Code</label>
                               <asp:TextBox CssClass="form-control" ID="zipcodeTextBox" runat="server" TextMode="Number" placeholder="e.g. 11000"></asp:TextBox>
                            </div>

                            <%--State--%>
                            <div class="col-md-3">
                               <label>State</label>
                               <asp:TextBox CssClass="form-control" ID="stateTextBox" runat="server" placeholder="e.g. Selangor"></asp:TextBox>
                            </div>

                            <%--Country--%>
                            <div class="col-md-3">
                               <label>Country</label>
                               <asp:TextBox CssClass="form-control" ID="countryTextBox" runat="server" placeholder="e.g. Malaysia"></asp:TextBox>
                            </div>

                        </div>

                        <%--Line Row--%>
                        <div class="row mb-3">
                            
                            <div class="col">
                                <hr>
                            </div>

                        </div>

                        <%-------------------------------Reservation Details-------------------------------%>

                        <%--Title Row--%>
                        <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Room Reservation Details</h2>
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

                             <%--No of adults--%>
                             <div class="col-md-6">
                                 <label>No of Adults</label>
                                 <input id="adultCapacity" class="form-control" runat="server" onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 1" name="adultCapacity">
                             </div>

                             <%--No of children--%>
                             <div class="col-md-6">
                                 <label>No of Children</label>
                                 <input id="childrenCapacity" class="form-control" runat="server" onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 0" name="childrenCapacity">
                             </div>
                         </div>

                        <%--2nd Row--%>
                        <div class="row mb-3">

                             <%--Check In--%>
                             <div class="col-md-6">
                                 <label>Check-In Date</label>
                                 <asp:TextBox CssClass="form-control" ID="checkinTextBox" runat="server" TextMode="Date" text="0"></asp:TextBox>
                             </div>

                             <%--Check Out--%>
                             <div class="col-md-6">
                                 <label>Check-Out Date</label>
                                 <asp:TextBox CssClass="form-control" ID="checkoutTextBox" runat="server" TextMode="Date" text="0"></asp:TextBox>
                             </div>
                         </div>

                        <%--Room Row 1--%>
                        <div class="row mb-3" id="room1">

                             <%--Room Type--%>
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

                             <%--No of Rooms--%>
                             <div class="col-md-3">
                                 <label>No of rooms</label>
                                 <input id="quantityText1" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 1" name="quantityText1">
                             </div>

                        </div>

                        <%--Line row--%>
                        <div class="row mb-3">
                            <div class="mb-3">
                                <hr />
                            </div>
                        </div>

                        <%-------------------------------Payment Details-------------------------------%>

                        <%--Title Row--%>
                        <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Payment Details</h2>
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

                             <%--Logo--%>
                             <div class="col-md-12">
                                 <i class="fab fa-cc-visa fa-3x" style="color:hotpink;"></i>
                                 <i class="fab fa-cc-mastercard fa-3x" style="color:darkorange;"></i>
                                 <i class="fab fa-cc-paypal fa-3x" style="color:dodgerblue;"></i>
                                 <i class="fab fa-cc-amex fa-3x" style="color:green;"></i>
                             </div>

                         </div>

                        <%--2nd Row--%>
                        <div class="row mb-3">

                             <%--Name Card--%>
                             <div class="col-md-6">
                                 <label>Name on Card</label>
                                 <asp:TextBox CssClass="form-control" ID="cardNameTextBox" runat="server" placeholder="e.g. John Doe"></asp:TextBox>
                             </div>

                             <%--Card Number--%>
                             <div class="col-md-6">
                                 <label>Card Number (No Spaces or Dashes)</label>
                                 <input id="cardNumber" class="form-control" maxlength="16" runat="server"  onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 5555 5555 5555 5555" name="cardNumber">
                             </div>
                         </div>

                        <%--3rd Row--%>
                        <div class="row mb-3">

                             <%--CVC Number--%>
                             <div class="col-md-2">
                                 <label>Card CVC</label>
                                 <div class="form-group">               
                                     <input id="cvcText" class="form-control" maxlength="3" runat="server"  onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 555" name="cvcText">
                                 </div>
                             </div>

                             <%--Valid Until--%>
                             <div class="col-md-10">
                                 <label>Valid Until</label>
                                 <div class="input-group">
                                     <div class="col-2">
                                         <input id="monthText" class="form-control" maxlength="2" runat="server"  onkeypress="return isNumberKey(event)" type="text" placeholder="mm" name="monthText">
                                     </div>
                                     <div class="col-2">
                                         <input id="yearText" class="form-control" maxlength="2" runat="server" onkeypress="return isNumberKey(event)" type="text" placeholder="yy" name="yearText">
                                     </div>
                                 </div>
                             </div>

                         </div>

                        <%--Button Row--%>
                        <div class="row mb-3">
                            <div class="mb-3">
                                <asp:Button class="btn btn-primary col-12 btn-lg" style="font-weight:bold; font-family:Arial; font-size:25px;" ID="calculateButton" runat="server" Text="Check and Calculate" OnClick="calculateButton_Click" />
                            </div>
                        </div>

                        <%--Line row--%>
                        <div class="row mb-3">
                            <div class="mb-3">
                                <hr />
                            </div>
                        </div>

                     </div>
                   </div>
               </div>
            </div>
         </div>

          <div class="col-md-5">
                <div class="card">
                   <div class="card-body">
                      
                      <%--Title Row--%>
                      <div class="row">
                         <div class="col">
                            <center>
                               <h2 style="font-weight:bold">Your Stay</h2>
                            </center>
                         </div>
                      </div>

                      <%--Line row--%>
                      <div class="row">
                         <div class="col">
                            <hr>
                         </div>
                      </div>
                 <div id="bookingDetails">
                      <%--1st Row--%>
                      <div class="row">
                         <div class="col-md-6">
                             <asp:Label ID="checkinLabel" runat="server" Text="Check-In"></asp:Label> <br />
                             <asp:Label ID="ckinTimeLabel" runat="server" Text="After 2:00 PM"></asp:Label>
                         </div>
                         <div class="col-md-6">
                             <asp:Label ID="checkoutLabel" runat="server" Text="Check-Out"></asp:Label> <br />
                             <asp:Label ID="ckoutLabel" runat="server" Text="Before 1:00 PM"></asp:Label>
                         </div>
                      </div>

                      <%--Line Row--%>
                      <div class="row">
                          <div class="col">
                             <hr>
                          </div>
                      </div>

                       <%--2nd Row--%>
                       <div class="row">
                          <div class="col-md-12">
                              <center>
                              <asp:Label ID="datesLabel" runat="server" Text=""></asp:Label>
                              </center>
                          </div>
                      </div>

                      <%--3rd Row--%>
                      <div class="row">
                          <div class="col">
                              <center>
                              <asp:Label ID="peopleLabel" runat="server" Text=""></asp:Label>
                              </center>
                          </div>
                      </div>

                      <%--4th Row--%>
                      <div class="row">
                          <div class="col-md-6">
                              <asp:Label ID="roomLabel" runat="server" Text=""></asp:Label><br />
                          </div>
                          <div class="col-md-6">
                             
                              <asp:Label class="float-end" ID="priceLabel1" runat="server" Text=""></asp:Label>
                          </div>
                      </div>

                       <%--7th Row--%>
                       <div class="row">
                          <div class="col">
                             <hr>
                          </div>
                      </div>

                       <%--8th Row--%>
                       <div class="row">
                          <div class="col">
                              <asp:Label ID="totalLabel" runat="server" Text="Total"></asp:Label>
                          </div>
                          <div class="col">
                              <asp:Label class="float-end" ID="totalMoneyLabel" Text="" runat="server"></asp:Label> <br />
                              <label class="float-end" style="font-size:16px; font-family: Arial; font-weight:normal">6% SST Included</label>
                          </div>
                      </div>

                       <%--Line Row--%>
                      <div class="row">
                          <div class="col">
                             <hr>
                          </div>
                      </div>
                </div>
                       <%--Button Row--%>
                      <div class="row">
                          <div class="col">
                             <asp:Button class="btn btn-primary col-12 btn-lg" style="font-weight:bold; font-family:Arial; font-size:25px;" ID="reserveButton" runat="server" Text="Reserve Room" OnClick="reserveButton_Click" Visible="False" Enabled="False" />
                          </div>
                      </div>

                   </div>
                </div>
             </div>

      </div>
            
   </div>
      
    <br />

</asp:Content>
