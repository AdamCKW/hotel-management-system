<%@ Page Title="Standard Twin Room" Async="true" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Standard Twin Room.aspx.cs" Inherits="Hotel_Management_System.Room_Details.Standard_Twin_Room" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function AudioClick(audioImageButton) {
            setTimeout(function () { audioImageButton.disabled = true; }, 10);
            setTimeout(function () { audioImageButton.disabled = false; }, 20000);
            return true;
        };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="container-fluid">
      <div class="row justify-content-center">
          <div class="col-md-10 mx-auto">
              <nav aria-label="breadcrumb" style="font-family: Arial">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/Public/HomePage.aspx">Home</a></li>
                    <li class="breadcrumb-item"><a href="/Public/Rooms.aspx">Rooms</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Standard Twin Room</li>
                  </ol>
               </nav>
          </div>
          
         <div class="col-md-10 mx-auto">
            <div class="card" style="font-size:20px; font-family:Arial; font-weight:bold;">
               <div class="card-body">


                  <div class="row">

                    <div class="col">
                            <asp:Image class="img-fluid" ID="roomImage" runat="server" />
                     </div>

                     
                     <div class="col">
                         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>
                                 <asp:Label id="roomNameLabel" style="font-size:35px" runat="server" Text="Room Name"></asp:Label> <br />
                                 <asp:Label runat="server" Text="Rates"></asp:Label> <br />
                                 <asp:Label id="roomPriceLabel" style="font-weight:normal" runat="server" Text="#"></asp:Label> <br />
                                 <asp:Label id="roomDepositLabel" style="font-weight:normal" runat="server" Text="#"></asp:Label> <br /><br />
                                 <asp:Label runat="server" Text="Features & Amenities"></asp:Label><br />
                                 <asp:Label ID="featureLabel" style="font-weight:normal" runat="server" Text="#"></asp:Label>
                                 <asp:ImageButton src="/imgs/speaker.png"  ID="audioImageButton" runat="server" OnClick="audioImageButton_Click" OnClientClick="if (AudioClick(this)) { return true; } else { alert('2'); }"/>
                                 <asp:Label ID="cookieLabel" style="font-weight:normal" runat="server" Text="" Visible="false"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                     </div>
                      
                  </div>


                  
               </div>
            </div>

         </div>
 
      </div>
   </div>

</asp:Content>
