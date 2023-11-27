<%@ Page Title="Homepage" Async="true" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Hotel_Management_System.Public.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function AudioClick(audioImageButton) {
            setTimeout(function () { audioImageButton.disabled = true; }, 10);
            setTimeout(function () { audioImageButton.disabled = false; }, 25000);
            return true;
        };
    </script>

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
      <div class="container" style="font-family:Arial">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <div class="row">
            
                        <div class="col-md-4">
                           <div class="card mb-3">
                              <img src="/imgs/Homepage/located.jpg" class="card-img-top">
                              <div class="card-body">
                                <h4 style="font-weight:bold" class="card-title">Strategically Located</h4>
                                <label runat="server" id="card1" style="font-size: 18px" class="card-text">We are strategically located in an exclusive integrated living zone in Klang, adjacent to Centro Mall with complete entertainments outlets. Easily accessible via all major highways and minutes away from Shah Alam and Klang main commercial, industrial and shopping centers. We are located next to Centro Mall and Hokkien Association.</label>
                                  <asp:ImageButton src="/imgs/speaker.png"  ID="audioImageButton" runat="server" OnClick="audioImageButton_Click" OnClientClick="if (AudioClick(this)) { return true; } else { alert('2'); }"/>
                              </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                           <div class="card mb-3">
                              <img src="/imgs/Homepage/food.jpg" class="card-img-top">
                              <div class="card-body">
                                <h4 style="font-weight:bold" class="card-title">Wide Variety Of Food & Beverage</h4>
                                <label runat="server" id="card2" style="font-size: 18px" class="card-text">Ccafe Hotel offers food & beverages outlets that serve a wide selection of food and beverages at reasonable prices. V Garden Chinese Restaurant & Nyonya Curry House that serves the varieties of Chinese and Nyonya Cuisine. Stopover Bar Lounge is an ideal venue for meeting up with friends over drinks and pool table games.</label>
                                  <asp:ImageButton src="/imgs/speaker.png"  ID="audioImageButton2" runat="server" OnClientClick="if (AudioClick(this)) { return true; } else { alert('2'); }" OnClick="audioImageButton2_Click"/>
                              </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                           <div class="card mb-3">
                              <img src="/imgs/Homepage/reception.jpg" class="card-img-top">
                              <div class="card-body">
                                <h4 style="font-weight:bold" class="card-title">A Comfortable Stay</h4>
                                <label runat="server" id="card3" style="font-size: 18px" class="card-text">CCafe Hotel comes with integrated hotel facilities that accommodate for Business travellers and tourists. Our 143 rooms and suites facilities provide our guests a truly warm and comfortable stay. The Klang City Spa Health Centre provides many premier health facilities which is one of the attraction for total relaxation.</label>
                                  <asp:ImageButton src="/imgs/speaker.png"  ID="audioImageButton3" runat="server" OnClientClick="if (AudioClick(this)) { return true; } else { alert('2'); }" OnClick="audioImageButton3_Click"/>
                              </div>
                            </div>
                        </div>
                    
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
      </div>
   </section>
   
</asp:Content>
