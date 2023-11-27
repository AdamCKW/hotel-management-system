<%@ Page Title="HouseKeeping" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RoomCleaning.aspx.cs" Inherits="Hotel_Management_System.Public.HotelServices.RoomCleaning" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
        <img src="/imgs/cleaningbanner.jpg" class="img-fluid" />
    </section>

    <br />
    
    <div class="container-fluid" style="font-family: Arial">
        
          <div class="row justify-content-center">
              <div class="col-md-8 mx-auto">
                  <nav aria-label="breadcrumb" >
                      <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/Public/HomePage.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="/Public/Service.aspx">Room Service</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Housekeeping</li>
                      </ol>
                   </nav>
              </div>
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
                                     <asp:TextBox CssClass="form-control" ID="roomNumber" onkeypress="return isNumberKey(event)" placeholder="e.g. R101" runat="server"></asp:TextBox>
                                </div>

                                <div class="col-md-4">
                                    <label>Phone Number</label>
                                    <asp:TextBox CssClass="form-control" ID="phoneNumber" onkeypress="return isNumberKey(event)" placeholder="e.g. 999-999-9999" runat="server"></asp:TextBox>
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

    <br />

    <%--Banner--%>
    <section>
        <img src="/imgs/cleaningbanner2.png" class="img-fluid" />
    </section>

</asp:Content>
