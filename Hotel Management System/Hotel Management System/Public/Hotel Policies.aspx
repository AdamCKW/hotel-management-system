<%@ Page Title="Hotel Policies" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hotel Policies.aspx.cs" Inherits="Hotel_Management_System.Public.Hotel_Policies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="container-fluid" style="font-size:20px; font-family:Arial;">
      <div class="row justify-content-center">
         <div class="col-md-6">
            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">

                        <%-------------------------------Hotel Policy-------------------------------%>

                        <%--Title Row--%>
                        <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Hotel Policy</h2>
                                </center>
                             </div>
                        </div>

                        <%--Line row--%>
                        <div class="row">
                             <div class="col">
                                <hr>
                             </div>
                          </div>

                        <%--1st Row--%>
                        <div class="row mb-3">
                             <div class="col">
                                   <ul>
                                        <li>All reservation required credit card guarantee at the time of booking.</li>
                                        <li>Rates quoted are in Ringgit Malaysia.</li>
                                        <li>Rates are inclusive of 6% sales & service tax (SST).</li>
                                        <li>Bookings must be guaranteed by Credit Card. Major credit cards accepted.</li>
                                        <li>Room booking is confirmed upon issuance of a confirmation email and full payment.</li>
                                        <li>Guests shall be liable to contact us immediately if he/she fails to receive any reply from us for whatever reasons.</li>
                                    </ul>
                             </div>
                         </div>

                     </div>
                   </div>
               </div>
            </div>

            <br />

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <%-------------------------------No-Show-------------------------------%>

                            <%--Title Row--%>
                            <div class="row">
                                 <div class="col">
                                    <center>
                                       <h2 style="font-weight:bold">No-Show Policy: (after 8pm of the Arrival Date)</h2>
                                    </center>
                                 </div>
                            </div>

                            <%--Line row--%>
                            <div class="row">
                                 <div class="col">
                                    <hr>
                                 </div>
                              </div>

                            <%--1st Row--%>
                            <div class="row mb-3">
                                 <div class="col">
                                       <label>No-show on the original check-in date, hotel reserves the right to levy the entire stay charges via credit card and all bookings will be deemed cancelled. Any delayed check-in (date) will subject to room availability.</label>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

         </div>
          <br /> 
         <div class="col-md-6">
            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">

                        <%-------------------------------Cancelation Policy-------------------------------%>

                        <%--Title Row--%>
                        <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Cancellation Policy</h2>
                                </center>
                             </div>
                        </div>

                        <%--Line row--%>
                        <div class="row">
                             <div class="col">
                                <hr>
                             </div>
                          </div>

                        <%--1st Row--%>
                        <div class="row mb-3">
                             <div class="col">
                                   <label>Reservations must be cancelled 72 hours prior to arrival to avoid a penalty of one night's room charge on the first night and 50% of room charge on the second night. However, room charge will be waived for subsequent nights.</label>
                             </div>
                        </div>

                     </div>
                   </div>
               </div>
            </div>

            <br />

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <%-------------------------------Late Arrive-------------------------------%>

                            <%--Title Row--%>
                            <div class="row">
                                 <div class="col">
                                    <center>
                                       <h2 style="font-weight:bold">Late check-in (after 6pm on the Arrival Date)</h2>
                                    </center>
                                 </div>
                            </div>

                            <%--Line row--%>
                            <div class="row">
                                 <div class="col">
                                    <hr>
                                 </div>
                              </div>

                            <%--1st Row--%>
                            <div class="row mb-3">
                                 <div class="col">
                                       <label>Kindly inform us via:</label>
                                       <label>Phone (+ 01 234 567 88) on the check-in day. Or Email us (info@example.com) in 72 hours prior to arrival.</label>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br />

             <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">

                            <%-------------------------------CheckOut-------------------------------%>

                            <%--Title Row--%>
                            <div class="row">
                                 <div class="col">
                                    <center>
                                       <h2 style="font-weight:bold">Early Check-Out Policy</h2>
                                    </center>
                                 </div>
                            </div>

                            <%--Line row--%>
                            <div class="row">
                                 <div class="col">
                                    <hr>
                                 </div>
                              </div>

                            <%--1st Row--%>
                            <div class="row mb-3">
                                 <div class="col">
                                       <label>For check-out earlier than the original booking, hotel reserved the rights to impose the full charges via credit card.</label>
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
