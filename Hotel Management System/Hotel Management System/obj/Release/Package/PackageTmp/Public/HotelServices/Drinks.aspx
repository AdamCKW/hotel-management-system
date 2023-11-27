<%@ Page Title="Drinks" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Drinks.aspx.cs" Inherits="Hotel_Management_System.Public.HotelServices.Drinks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
        <img src="/imgs/Drinks/drinksbanner.jpg" class="img-fluid" />
    </section>

    <br />
    
    <div class="container">
      <div class="row">
         <div class="col-md-10 mx-auto">
            <div class="card">
               <div class="card-body">

                   <%--1st Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h1 style="font-weight:bold">Drinks</h1>
                        </center>
                     </div>
                  </div>

                  <%--2nd Row--%>
                  <div class="row mb-3">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <%--3rd Row--%>
                  <div class="row mb-3">

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Coke%20Cola%20(Can).jpg" width="100%" ID="cokeImage" runat="server" OnClick="cokeImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="cokeButton" runat="server" OnClick="cokeButton_Click">Coca-Cola</asp:LinkButton>
                                </center>
                            </div>

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/7ups%20(can).jpg" width="100%" ID="upImage" runat="server" OnClick="upImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="upButton" runat="server" OnClick="upButton_Click">7up</asp:LinkButton>
                                </center>
                           </div>
                      
                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Pepsi%20(Can).jpg" width="100%" ID="pepsiImage" runat="server" OnClick="pepsiImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="pepsiButton" runat="server" OnClick="pepsiButton_Click">Pepsi</asp:LinkButton>
                                </center>
                           </div>

                 </div>

                 <%--4th Row--%>
                 <div class="row mb-3">

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Watermellon%20Smoothy.jpg" width="100%" ID="waterImage" runat="server" OnClick="waterImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="waterButton" runat="server" OnClick="waterButton_Click">Watermelon Smoothy</asp:LinkButton>
                                </center>
                            </div>

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Iced%20Lemonade.jpg" width="100%" ID="lemonImage" runat="server" OnClick="lemonImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="lemonButton" runat="server" OnClick="lemonButton_Click">Iced Lemonade</asp:LinkButton>
                                </center>
                           </div>
                      
                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Iced%20Lemon%20Tea.jpg" width="100%" ID="teaImage" runat="server" OnClick="teaImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="teaButton" runat="server" OnClick="teaButton_Click">Iced Lemon Tea</asp:LinkButton>
                                </center>
                           </div>

                </div>

                <%--5th Row--%>
                <div class="row mb-3">

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Latte.jpg" width="100%" ID="latteImage" runat="server" OnClick="latteImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="latteButton" runat="server" OnClick="latteButton_Click">Latte</asp:LinkButton>
                                </center>
                            </div>

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Espresso.jpg" width="100%" ID="espressoImage" runat="server" OnClick="espressoImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="espressoButton" runat="server" OnClick="espressoButton_Click">Espresso</asp:LinkButton>
                                </center>
                           </div>
                      
                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Drinks/Iced%20Coffee.jpg" width="100%" ID="coffeeImage" runat="server" OnClick="coffeeImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="coffeeButton" runat="server" OnClick="coffeeButton_Click">Iced Coffee</asp:LinkButton> 
                                </center>
                           </div>

                 </div>



               </div>
            </div>
         </div>
      </div>
   </div>

   <br />

</asp:Content>
