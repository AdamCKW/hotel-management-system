<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Hotel_Management_System.Staff.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%--Banner--%>
    <section>
        <img src="/imgs/Dashboard/dashboardbanner.jpg" class="img-fluid" />
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
                                       <h1 style="font-weight:bold">Dashboard</h1>
                                    </center>
                                 </div>
                            </div>

                            <%--2nd Row--%>
                            <div class="row mb-3">
                                 <div class="col">
                                    <hr>
                                 </div>
                            </div>

                            <div class="row mb-3">

                                <%--Check In Room--%>
                                <div class="col-md-4">
                                    <center>
                                        <asp:ImageButton src="/imgs/Dashboard/checkin.jpg" Width="100%" ID="checkImageButton" runat="server" OnClick="checkImageButton_Click" />
                                        <asp:LinkButton class="roomlinks" ID="checkButton" runat="server" OnClick="checkButton_Click">Manage Check In/Out</asp:LinkButton>
                                    </center>
                                </div>

                                <%--Check Room Availability--%>
                                <div class="col-md-4">
                                    <center>
                                        <asp:ImageButton src="/imgs/Dashboard/availability.jpg" Width="100%" ID="availabilityImageButton" runat="server" OnClick="availabilityImageButton_Click" />
                                        <asp:LinkButton class="roomlinks" ID="availabilityButton" runat="server" OnClick="availabilityButton_Click">Check Room Availability</asp:LinkButton>
                                    </center>
                                </div>

                                <%--Reservation--%>
                                <div class="col-md-4">
                                    <center>
                                        <asp:ImageButton src="/imgs/Dashboard/reservation.jpg" width="100%" ID="reservationImageButton" runat="server" OnClick="reservationImageButton_Click" />
                                        <asp:LinkButton class="roomlinks" ID="reservationButton" runat="server" OnClick="reservationButton_Click">Manage Reservation</asp:LinkButton>
                                    </center>
                                </div> 

                            </div>
                         
                            <div class="row">

                                <%--Manage Food Service--%>
                                <div class="col-md-4">
                                    <center>
                                        <asp:ImageButton src="/imgs/Dashboard/roomservice.jpg" Width="100%" ID="orderImageButton" runat="server" OnClick="orderImageButton_Click" />
                                        <asp:LinkButton class="roomlinks" ID="orderButton" runat="server" OnClick="orderButton_Click">Manage Orders</asp:LinkButton>
                                    </center>
                                </div>
                                
                                <%--Reservation--%>
                                <div class="col-md-4">
                                    <center>
                                        <asp:ImageButton src="/imgs/RoomService%20(1).jpg" width="100%" ID="houseImageButton" runat="server" OnClick="houseImageButton_Click" />
                                        <asp:LinkButton class="roomlinks" ID="houseButton" runat="server" OnClick="houseButton_Click">Manage Housekeeping</asp:LinkButton>
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
