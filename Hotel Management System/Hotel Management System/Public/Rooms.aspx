<%@ Page Title="Rooms" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="Hotel_Management_System.Public.Rooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="cardstyle mask d-flex align-items-center h-100">
     <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 mx-auto">

                    <div class="card shadow-5-strong" style="font-family: Arial; font-size: 20px ">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h1 style="font-weight:bold">Rooms</h1>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <br />

                            <%-- First Row --%>
                            <div class="row mb-3">

                                <div class="col-md-3">
                                    <center>
                                        <asp:ImageButton ID="standardQueenImage" Width="100%" src="../imgs/Standard%20Queen%20Room.jpg" runat="server" OnClick="standardQueenImage_Click" />
                                        <asp:LinkButton class="roomlinks" ID="standardQueenButton" runat="server" OnClick="standardQueenButton_Click">Standard Queen Room</asp:LinkButton>
                                    </center>
                                </div>

                                <div class="col-md-3">
                                    <center>
                                        <asp:ImageButton ID="standardTwinImage" Width="100%" src="../imgs/Standard%20Twin%20Room.jpg" runat="server" OnClick="standardTwinImage_Click" />
                                        <asp:LinkButton class="roomlinks" ID="standardTwinButton" runat="server" OnClick="standardTwinButton_Click">Standard Twin Room</asp:LinkButton>
                                    </center>
                                </div>

                                <div class="col-md-3">
                                    <center>
                                        <asp:ImageButton ID="deluxeQueenImage" Width="100%" src="../imgs/Deluxe%20Queen%20Room.jpg" runat="server" OnClick="deluxeQueenImage_Click" />
                                        <asp:LinkButton class="roomlinks" ID="deluxeQueenButton" runat="server" OnClick="deluxeQueenButton_Click">Deluxe Queen Room</asp:LinkButton>
                                    </center>
                                </div>

                                <div class="col-md-3">
                                    <center>
                                        <asp:ImageButton ID="deluxeTwinImage" Width="100%" src="../imgs/Deluxe%20Twin%20Room.jpg" runat="server" OnClick="deluxeTwinImage_Click" />
                                        <asp:LinkButton class="roomlinks" ID="deluxeTwinButton" runat="server" OnClick="deluxeTwinButton_Click">Deluxe Twin Room</asp:LinkButton>
                                    </center>
                                </div>

                            </div>

                            <div class="row mb-3">

                                <div class="col-md-3">
                                    <center>
                                        <asp:ImageButton ID="suiteImage" Width="100%" src="../imgs/Suite%20Room.jpg" runat="server" OnClick="suiteImage_Click" />
                                        <asp:LinkButton class="roomlinks" ID="suiteButton" runat="server" OnClick="suiteButton_Click">Suite Room</asp:LinkButton>
                                    </center>
                                </div>

                                <div class="col-md-3">
                                    <center>
                                        <asp:ImageButton ID="familyImage" Width="100%" src="../imgs/Family%20Room.jpg" runat="server" OnClick="familyImage_Click" />
                                        <asp:LinkButton class="roomlinks" ID="familyButton" runat="server" OnClick="familyButton_Click">Family Room</asp:LinkButton>
                                    </center>
                                </div>

                                <div class="col-md-3">
                                    <center>
                                        <asp:ImageButton ID="budgetImage" Width="100%" src="../imgs/Budget%20Room.jpg" runat="server" OnClick="budgetImage_Click" />
                                        <asp:LinkButton class="roomlinks" ID="budgetButton" runat="server" OnClick="budgetButton_Click">Budget Room</asp:LinkButton>
                                    </center>
                                </div>
                                
                            </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
        </div>
</asp:Content>
