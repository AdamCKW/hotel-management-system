<%@ Page Title="Service" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="Hotel_Management_System.Public.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
        <img src="/imgs/serviceBanner.jpg" class="img-fluid" />
    </section>

    <br />
    <div class="container">
      <div class="row">
         <div class="col-md-10 mx-auto">
            <div class="card">
               <div class="card-body">

                  <%--First Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <i class="fas fa-concierge-bell fa-5x"></i>
                        </center>
                     </div>
                  </div>

                   <%--Second Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h1 style="font-weight:bold">Room Service</h1>
                        </center>
                     </div>
                  </div>

                  <%--3rd Row--%>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                   <%--4th Row--%>
                  <div class="row">

                     <div class="col-md-6">
                         <center>
                             <asp:ImageButton ID="cleaningImageButton" width="100%"  src="/imgs/RoomService%20(1).jpg" runat="server" OnClick="cleaningImageButton_Click" />
                             <asp:LinkButton class="roomlinks" ID="cleaningButton" runat="server" OnClick="cleaningButton_Click">Housekeeping</asp:LinkButton>
                         </center>
                     </div>

                     <div class="col-md-6">
                         <center>
                             <asp:ImageButton ID="foodImageButton" width="100%" src="/imgs/RoomService%20(2).jpg" runat="server" OnClick="foodImageButton_Click" />
                             <asp:LinkButton class="roomlinks" ID="foodButton" runat="server" OnClick="foodButton_Click">Food &amp; Drinks Service</asp:LinkButton>
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
