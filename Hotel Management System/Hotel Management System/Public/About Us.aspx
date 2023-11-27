<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About Us.aspx.cs" Inherits="Hotel_Management_System.Public.About_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
      <div class="row justify-content-center">
         <div class="col-md-10 mx-auto">
            <div class="card">
               <div class="card-body">

                   <%--1st Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight:bold" class="card-title">About Us</h2>
                        </center>
                     </div>
                  </div>

                   <%--2nd Row--%>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <%--3rd Row--%>
                  <div class="row" style="font-family:Arial; font-size:20px">
                     <p class="text-justify">
                         Ccafe Hotel is a 3-star accommodation within 2.8 km of i-City Funfair. Guests can enjoy high speed Internet access in public areas.
                     </p>
                     <p class="text-justify">
                         The venue is 20 minutes' walk from the centre of Klang. Ferris Wheel @City of Digital Lights is about 5 minutes' drive away. The shopping mall "Centro Business Centre" is also located near the hotel. You can get to Klang Kwan Imm Temple in a few minutes by car.
                     </p>
                     <p class="text-justify">
                         Offering a view over the city, 143 rooms feature an oriental decor, satellite television, tea and coffee making equipment, and Wi-Fi along with en suite bathrooms. Other comforts include a microwave, coffee/tea making machines and an electric kettle for self-catering.
                     </p>
                     <p class="text-justify">
                         The property serves a continental breakfast every morning. Guests can enjoy American meals at Macaroni Food and Coffee within 5 minutes' walk of the venue. There is the café bar on site. A spa therapy and a massage therapy are offered for free. Leisure facilities in CCafe include a shared lounge, entertainment activities and a bar. This venue has a gym facility.
                     </p>
                  </div>

               </div>
            </div>

            <br />

             <div class="card">
               <div class="card-body">

                   <%--6th Row--%>
                   <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight:bold">Features</h2>
                        </center>
                     </div>
                  </div>

                   <%--7nd Row--%>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                   <%--8th Row--%>
                   <div class="row" style="font-family:Arial; font-size:20px">

                     <%--Column 1--%>
                     <div class="col md-4">
                        <h4 style="font-weight:bold"><i class="fas fa-wifi"></i> Internet Connection</h4>
                        <ul>
                            <li>Wi-Fi</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-parking"></i> Parking</h4>
                        <ul>
                            <li>Parking</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-concierge-bell"></i> Service</h4>
                        <ul>
                            <li>Safe deposit box</li>
                            <li>24-hour reception</li>
                            <li>Luggage storage</li>
                            <li>Currency exchange</li>
                            <li>Hairdresser</li>
                            <li>Room service</li>
                            <li>Car hire</li>
                            <li>Laundry</li>
                            <li>Dry cleaning</li>
                            <li>Tours/Ticket assistance</li>
                            <li>Shops/Commercial services</li>
                            <li>Newspaper service</li>
                        </ul>

                         <h4 style="font-weight:bold"><i class="fas fa-utensils"></i> Dining</h4>
                        <ul>
                            <li>Restaurant</li>
                            <li>Cafe</li>
                            <li>Bar/ Lounge area</li>
                        </ul>

                     </div>

                     <%--Column 2--%>
                     <div class="col md-4">
                        <h4 style="font-weight:bold"><i class="fas fa-bread-slice"></i> Kitchen Has</h4>
                        <ul>
                            <li>Mini-fridge</li>
                            <li>Electric Kettle</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-user-tie"></i> For Business</h4>
                        <ul>
                            <li>Business centre</li>
                            <li>Meeting/ Banquet facilities</li>
                            <li>Fax/Photocopying</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-baby"></i> For Children</h4>
                        <ul>
                            <li>Cots</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-spa"></i> Leisure Facilities</h4>
                        <ul>
                            <li>Karaoke</li>
                            <li>Night club</li>
                            <li>Theatre</li>
                            <li>Massage</li>
                            <li>Library</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-bed"></i> Rooms Have</h4>
                        <ul>
                            <li>Air conditioning</li>
                            <li>Mini-bar</li>
                            <li>Connecting rooms</li>
                            <li>Living room</li>
                            <li>Sitting area</li>
                            <li>Tea and coffee facilities</li>
                            <li>Rollaway beds</li>
                        </ul>

                     </div>

                       <%--Column 3--%>
                     <div class="col md-4">
                        <h4 style="font-weight:bold"><i class="fas fa-bath"></i> Bathroom Has</h4>
                        <ul>
                            <li>Private bathroom</li>
                            <li>Bathtub</li>
                            <li>Shower</li>
                            <li>Hair dryer</li>
                            <li>Free toiletries</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-compact-disc"></i> Media</h4>
                        <ul>
                            <li>Hi-Fi</li>
                            <li>Cable/ Satellite television</li>
                            <li>Direct dial telephone</li>
                            <li>Radio</li>
                            <li>AM/FM alarm clock</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-palette"></i> Design</h4>
                        <ul>
                            <li>Carpeted floor</li>
                        </ul>

                        <h4 style="font-weight:bold"><i class="fas fa-smoking-ban"></i> General Facilities</h4>
                        <ul>
                            <li>Non-smoking rooms</li>
                            <li>Lift</li>
                            <li>Gift/Newsstand</li>
                           <li> Bridal suite</li>
                        </ul>

                        <h4 style="font-weight:bold">
                            <i class="fas fa-paw"></i> Pets</h4>
                        <ul>
                            <li>No pets allowed <i class="far fa-times-circle"></i></li>
                        </ul>

                     </div>

                  </div>

               </div>
            </div>
         </div>
      </div>
   </div>
    <br />
</asp:Content>
