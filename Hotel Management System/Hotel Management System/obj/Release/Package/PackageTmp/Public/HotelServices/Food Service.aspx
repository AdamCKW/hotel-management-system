<%@ Page Title="Food Service" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Food Service.aspx.cs" Inherits="Hotel_Management_System.Public.Food_Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
        <img src="/imgs/foodbanner2.png" class="img-fluid" />
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
                           <h1 style="font-weight:bold">Food Service</h1>
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
                  <div class="row" style="font-size:20px; font-weight:bold">

                            <div class="col-md-6">
                                
                                <div id="carouselFoodsInterval" class="carousel slide" data-bs-ride="carousel">
                                       
                                      <a href="/Public/HotelServices/Food.aspx">
                                      <div class="carousel-inner">
                                            <div class="carousel-item active" data-bs-interval="4000">
                                              <img src="/imgs/Food/Beef%20Steak%20With%20Sause.jpg" class="d-block w-100" alt="Beef Steak With Sause">
                                            </div>
                                            <div class="carousel-item" data-bs-interval="4000">
                                              <img src="/imgs/Food/BeefBurger&Fries.jpg" class="d-block w-100" alt="Beef Burger & Fries">
                                            </div>
                                            <div class="carousel-item" data-bs-interval="4000">
                                              <img src="/imgs/Food/Grilled%20Barbecue%20With%20Fried%20Rice.jpg" class="d-block w-100" alt="Grilled Barbecue With Fried Rice">
                                            </div>
                                      </div>
                                      </a>
                                      

                                          <button class="carousel-control-prev" type="button" data-bs-target="#carouselFoodsInterval" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                          </button>
                                          <button class="carousel-control-next" type="button" data-bs-target="#carouselFoodsInterval" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                          </button>
                                    </div>
                                    
                                    <center>
                                        <asp:LinkButton class="roomlinks" style="font-size:30px" ID="foodButton" runat="server" OnClick="foodButton_Click">Foods</asp:LinkButton>
                                    </center>
                                    
                            </div>

                            <div class="col-md-6">
                                
                                <div id="carouselDrinksInterval" class="carousel slide" data-bs-ride="carousel">
                                      
                                      <a href="/Public/HotelServices/Drinks.aspx">
                                      <div class="carousel-inner">
                                            <div class="carousel-item active" data-bs-interval="4000">
                                              <img src="/imgs/Drinks/Iced%20Coffee.jpg" class="d-block w-100" alt="IcedCoffee">
                                            </div>
                                            <div class="carousel-item" data-bs-interval="4000">
                                              <img src="/imgs/Drinks/Coke%20Cola%20(Can).jpg" class="d-block w-100" alt="Coke">
                                            </div>
                                            <div class="carousel-item" data-bs-interval="4000">
                                              <img src="/imgs/Drinks/7ups%20(can).jpg" class="d-block w-100" alt="7up">
                                            </div>
                                      </div>
                                      </a>

                                          <button class="carousel-control-prev" type="button" data-bs-target="#carouselDrinksInterval" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                          </button>
                                          <button class="carousel-control-next" type="button" data-bs-target="#carouselDrinksInterval" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                          </button>
                                </div>

                                <center>
                                    <asp:LinkButton class="roomlinks" style="font-size:30px" ID="drinkButton" runat="server" OnClick="drinkButton_Click">Drinks</asp:LinkButton>
                                </center>

                           </div>
                      
                            
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

    <br />

    <%--Banner--%>
    <section>
        <img src="imgs/foodbanner.png" class="img-fluid" />
    </section>

</asp:Content>
