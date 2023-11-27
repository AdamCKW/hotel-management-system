<%@ Page Title="Booking Receipt" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="Hotel_Management_System.Public.Receipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type = "text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title></title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write(HTMLDivElement);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <link href="/bootstrap/css/bootstrap.min.css" type="text/css" rel="Stylesheet" media="print" />
    <link href="/css/customstylesheet.css" rel="stylesheet" media="print"/>
    <link href="/fontawesome/css/all.min.css" rel="stylesheet" media="print"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br /><br /><br />

    <div class="container-fluid" style="font-family:Arial;">

        <div class="row mb-3">

            <div class="col-md-6 mx-auto">
                <div class="row">
                    <div class="col">
                        <center>
                            <h1 style="font-weight:bold">Please Print This Receipt</h1>
                        </center>
                    </div>
                </div>
                <asp:Panel id="pnlContents" runat = "server">
                <div class="card">

                    <div class="card-body">

                        <div class="row">

                            <div class="col">

                                    <div class="row">
                                         <div class="col">
                                            <center>
                                               <h2 style="font-weight:bold">----------------------- Ccafe Hotel -----------------------</h2>
                                            </center>
                                         </div>
                                    </div>
                                    <div class="row">
                                         <div class="col">
                                            <center>
                                               <h4>---- Thank You For Reserving Our Hotel Rooms ----</h4>
                                            </center>
                                         </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-md-2">
                                            <asp:Label runat="server" Text="Booking ID: " Font-Size="Large"></asp:Label>
                                            
                                         </div>
                                        <div class="col">
                                            <asp:Label id="bookingIDLabel" runat="server" Text="Label" Font-Size="Large" Font-Bold="True"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-md-2">
                                            <asp:Label runat="server" Text="Room Type: " Font-Size="Large"></asp:Label>
                                         </div>
                                         <div class="col">
                                             <asp:Label id="typeLabel" runat="server" Text="Label" Font-Size="Large" Font-Bold="True"></asp:Label>
                                         </div>
                                    </div>
                                    <div class="row mb-3">
                                         <div class="col-md-2">
                                            <asp:Label runat="server" Text="Check In: " Font-Size="Large"></asp:Label>
                                         </div>
                                         <div class="col-md-2">
                                            <asp:Label id="inLabel" runat="server" Text="Label" Font-Size="Large" Font-Bold="True"></asp:Label>
                                         </div>
                                         <div class="col-md-2">
                                             <asp:Label runat="server" Text="Check Out: " Font-Size="Large"></asp:Label>
                                         </div>
                                         <div class="col-md-2">
                                            <asp:Label id="outLabel" runat="server" Text="Label" Font-Size="Large" Font-Bold="True"></asp:Label>
                                         </div>
                                        <div class="col-md-2">
                                             <asp:Label runat="server" Text="Nights: " Font-Size="Large"></asp:Label>
                                         </div>
                                         <div class="col">
                                            <asp:Label id="nightLabel" runat="server" Text="Label" Font-Size="Large" Font-Bold="True"></asp:Label>
                                         </div>
                                    </div>
                                    <div class="row mb-3">
                                         <div class="col-md-2">
                                            <asp:Label runat="server" Text="Total: " Font-Size="Large"></asp:Label>
                                         </div>
                                         <div class="col">
                                             <asp:Label id="totalLabel" runat="server" Text="Label" Font-Size="Large" Font-Bold="True"></asp:Label>
                                         </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-4">
                                            <asp:Label runat="server" Text="Enquires or Cancelation: " Font-Size="Large"></asp:Label>
                                         </div>
                                        <div class="col-4">
                                            <asp:Label runat="server" Font-Size="Large">Email: info@example.com</asp:Label>
                                        </div>
                                        <div class="col-4">
                                            <asp:Label runat="server" Font-Size="Large">Call: + 01 234 567 88</asp:Label>
                                        </div>
                                    </div>
                                

                            </div>

                        </div>

                    </div>
                
                </div>
                </asp:Panel>
            </div>
           
            
        </div>
        <div class="row">
             <div class="col-md-4 mx-auto">
                <asp:Button ID="btnPrint" CssClass="btn btn-lg col-12 btn-light" runat="server" Text="Print Receipt" OnClientClick = "return PrintPanel();" OnClick="btnPrint_Click" />
            </div>
        </div>
   </div>
    
    <br /><br /><br /><br /><br /><br />

</asp:Content>
