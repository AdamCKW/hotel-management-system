<%@ Page Title="Homepage" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Hotel_Management_System.Public.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Banner--%>
    <section>
        <img src="/imgs/BorderHomepage.png" class="img-fluid"/>
   </section>

   <section style="background-color:#212529">

        <div class="container">

            <center>
                  <h2 style="font-weight:bold; color:white">Why Choose Us</h2>
                   <%--Redirect to Book page--%>
                   <asp:LinkButton class="btn btn-link" style="font-size:20px; color:white; border: none;" ID="bookLinkButton" runat="server" OnClick="bookLinkButton_Click">Book Now</asp:LinkButton>
            </center>

        </div>

   </section>
    <br />
    <%--Homepage content--%>
   <section>
      <div class="container" style="font-family:Arial; font-weight:bold">
         <div class="row">

            <div class="col-md-4">
               <center>
                  <img class="mb-3" width="400" height="300" src="/imgs/restaurant.jpg" />
                  <h4 style="font-weight:bold" >Strategically Located</h4>
                  <p class="text-justify">We are strategically located in an exclusive integrated living zone in Klang, adjacent to Centro Mall with complete entertainments outlets. Easily accessible via all major highways and minutes away from Shah Alam and Klang main commercial, industrial and shopping centers. We are located next to Centro Mall and Hokkien Association.</p>
               </center>
            </div>

            <div class="col-md-4">
               <center>
                  <img class="mb-3" width="400" height="300" src="/imgs/Lobby-Coffee-house.jpg" />
                  <h4 style="font-weight:bold" >Wide Variety Of Food & Beverage</h4>
                  <p class="text-justify">Klang Histana Hotel offers food & beverages outlets that serve a wide selection of food and beverages at reasonable prices. V Garden Chinese Restaurant & Nyonya Curry House that serves the varieties of Chinese and Nyonya Cuisine.Stopover Bar Lounge is an ideal venue for meeting up with friends over drinks and pool table games. Another attraction for total relaxation, the Klang City Spa Health Centre provides many premier health facilities.</p>
               </center>
            </div>

            <div class="col-md-4">
               <center>
                  <img class="mb-3" width="400" height="300" src="/imgs/lobby.jpg" />
                  <h4 style="font-weight:bold" >A Comfortable Stay</h4>
                  <p class="text-justify">Klang Histana Hotel comes with integrated hotel facilities that accommodate for Business travellers and tourists. Our 143 rooms and suites facilities provide our guests a truly warm and comfortable stay.</p>
               </center>
            </div>
            
         </div>
      </div>
   </section>
   
</asp:Content>
