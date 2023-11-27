<%@ Page Title="Foods" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="Hotel_Management_System.Public.HotelServices.Food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
        <img src="/imgs/Food/foodbanner3.png" class="img-fluid" />
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
                           <h1 style="font-weight:bold">Foods</h1>
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
                                <asp:ImageButton src="/imgs/Food/Basil%20Leaves%20and%20Avocado%20on%20Sliced%20Bread.jpg" width="100%" ID="slicedImage" runat="server" OnClick="slicedImage_Click" /> 
                                <asp:LinkButton class="roomlinks" ID="slicedButton" runat="server" OnClick="slicedButton_Click">Basil Leaves and Avocado on Sliced Bread</asp:LinkButton>
                                </center>
                            </div>

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/Beef%20Steak%20With%20Sause.jpg" width="100%" ID="steakImage" runat="server" OnClick="steakImage_Click"/>
                                <asp:LinkButton class="roomlinks" ID="steakButton" runat="server" OnClick="steakButton_Click">Beef Steak</asp:LinkButton>
                                </center>
                           </div>
                      
                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/BeefBurger&Fries.jpg" width="100%" ID="burgerImage" runat="server" OnClick="burgerImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="burgerButton" runat="server" OnClick="burgerButton_Click">Beef Burger with Fries</asp:LinkButton>
                                </center>
                           </div>

                 </div>

                 <%--4th Row--%>
                 <div class="row mb-3">

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/Fish%20Chips%20with%20mashed%20potatoes.jpg" width="100%" ID="fishImage" runat="server" OnClick="fishImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="fishButton" runat="server" OnClick="fishButton_Click">Fish And Chips With Mashed Potatoes</asp:LinkButton>
                                </center>
                            </div>

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/French%20Fries%20With%20Ketchup.jpg" width="100%" ID="friesImage" runat="server" OnClick="friesImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="friesButton" runat="server" OnClick="friesButton_Click">French Fries With Ketchup</asp:LinkButton>
                                </center>
                           </div>
                      
                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/Grilled%20Barbecue%20With%20Fried%20Rice.jpg" width="100%" ID="barbecueImage" runat="server" OnClick="barbecueImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="barbecueButton" runat="server" OnClick="barbecueButton_Click">Grilled Barbecue With Fried Rice</asp:LinkButton>
                                </center>
                           </div>

                </div>

                <%--5th Row--%>
                <div class="row mb-3">

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/PastaWithTomato&Basil.jpg" width="100%" ID="pastaImage" runat="server" OnClick="pastaImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="pastaButton" runat="server" OnClick="pastaButton_Click">Vegetarian Pasta</asp:LinkButton>
                                </center>
                            </div>

                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/Pepperoni%20Pizza.jpg" width="100%" ID="pepperoniImage" runat="server" OnClick="pepperoniImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="pepperoniButton" runat="server" OnClick="pepperoniButton_Click">Pepperoni Pizza</asp:LinkButton>
                                </center>
                           </div>
                      
                            <div class="col-md-4">
                                <center>
                                <asp:ImageButton src="/imgs/Food/Vegetable%20Salad%20on%20Plate.jpg" width="100%" ID="saladImage" runat="server" OnClick="saladImage_Click" />
                                <asp:LinkButton class="roomlinks" ID="saladButton" runat="server" OnClick="saladButton_Click">Vegetable Salad</asp:LinkButton> 
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
