<%@ Page Title="Watermelon Smoothie" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Watermelon.aspx.cs" Inherits="Hotel_Management_System.Product_Page.Drinks.Watermelon" %>
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

    <br />

    <div class="container-fluid" style="font-size:20px; font-family:Arial;">
      <div class="row">
         <div class="col-md-10 mx-auto">
            <div class="card">
               <div class="card-body">


                  <div class="row">

                    <div class="col">
                        <center>
                            <asp:Image class="img-fluid" ID="productImage" runat="server" />
                        </center>
                     </div>

                     <div class="col">
                         <div class ="row mb-3">
                             <div class="col-lg-12">
                                 <asp:Label id="productNameLabel" style="font-size:30px" runat="server" Text="Product Name" Font-Bold="True"></asp:Label>
                             </div>
                         </div>
                         <div class ="row mb-3">
                             <div class="col-lg-12">
                                 <asp:Label runat="server" Text="Price - "></asp:Label>
                                 <asp:Label id="productPriceLabel" runat="server" Text="#" Font-Bold="True"></asp:Label>
                             </div>
                         </div>
                         <div class ="row">
                             <div class="col-lg-12">
                                 <asp:Label runat="server" Text="Details - "></asp:Label>
                             </div>
                         </div>
                         <div class ="row mb-3">
                             <div class="col-lg-12">
                                 <asp:Label ID="detailsLabel" style="font-weight:bold" runat="server" Text="#"></asp:Label>
                             </div>
                         </div>
                         <div class ="row mb-3">
                             <div class="col-3">
                                 <input id="txtChar" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="Quantity" name="txtChar">
                             </div>
                             <div class="col-4">
                                 <input id="roomNumber" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="Room Number" name="txtChar">
                             </div>
                             <div class="col-4">
                                 <input id="phoneNumber" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="Phone Number" name="txtChar">
                             </div>
                         </div>
                         <div class ="row mb-4">
                             <div class="col-4">
                                 <asp:LinkButton class="btn btn-lg col-12 btn-success" ID="orderButton" runat="server" OnClick="orderButton_Click">Order</asp:LinkButton>
                             </div>
                         </div>
                         
                         <asp:Label ID="cookieLabel" runat="server" Visible="False"></asp:Label>
                     </div>
                  </div>

                  
               </div>
            </div>

         </div>
 
      </div>
   </div>

</asp:Content>
