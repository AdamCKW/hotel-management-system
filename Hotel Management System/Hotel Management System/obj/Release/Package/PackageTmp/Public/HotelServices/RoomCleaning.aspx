<%@ Page Title="HouseKeeping" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RoomCleaning.aspx.cs" Inherits="Hotel_Management_System.Public.HotelServices.RoomCleaning" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
        <img src="/imgs/cleaningbanner.jpg" class="img-fluid" />
    </section>

    <br /><br />
    
    <div class="container">
      <div class="row">
         <div class="col-md-8 mx-auto">
            <div class="card">
               <div class="card-body">

                   <%--1st Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h1 style="font-weight:bold">Housekeeping</h1>
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

                            <div class="col-md-4">
                                <label>Room No</label>
                                 <asp:TextBox CssClass="form-control" ID="roomNumber" placeholder="e.g. R101" runat="server" TextMode="Number"></asp:TextBox>
                            </div>

                            <div class="col-md-4">
                                <label>Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="phoneNumber" placeholder="e.g. 999-999-9999" runat="server"></asp:TextBox>
                            </div>
                            
                            <div class="col-md-4">
                                <br />
                                <asp:Button class="btn btn-light button-style col-12" ID="callButton" runat="server" Text="Request Housekeeping" OnClick="callButton_Click" />
                            </div>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

    <br /><br />

    <%--Banner--%>
    <section>
        <img src="/imgs/cleaningbanner2.png" class="img-fluid" />
    </section>

</asp:Content>
