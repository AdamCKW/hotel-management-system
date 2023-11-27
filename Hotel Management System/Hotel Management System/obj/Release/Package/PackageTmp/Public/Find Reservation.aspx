<%@ Page Title="Find Reservation" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Find Reservation.aspx.cs" Inherits="Hotel_Management_System.Public.Find_Reservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
            $("#menu li a").each(function () {
                if (str.indexOf(this.href.toLowerCase()) > -1) {

                    $("li.active").removeClass("active");

                    $(this).parent().addClass("active");

                }

            });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <%--Content--%>
   <div class="container">
       <div class="row" style="font-weight: bold; font-family:Arial; font-size:20px">
           <div class="col-md-8 mx-auto">
               
               <div class="card">

                   <div class="card-body">

                       <div class="row">

                           <div class="col">

                               <div class="row mb-3 mx-auto">

                                   <%--Adult--%>
                                   <div class="form-group col-md-3">
                                       <center>
                                       <asp:Label ID="lnameLabel" runat="server" Text="Last Name"></asp:Label>
                                       </center>
                                       <asp:TextBox class="form-control" ID="lastNameTextBox" runat="server"></asp:TextBox>
                                   </div>

                                   <%--Children--%>
                                   <div class="form-group col-md-4">
                                       <center>
                                       <asp:Label ID="phoneLabel" runat="server" Text="Phone Number"></asp:Label>
                                       </center>
                                       <input id="pnumber" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 999-999-9999" name="pnumber">                     
                                   </div>
                                   
                                   <%--Find Room--%>
                                   <div class="col-md-4">
                                           <br />
                                           <div>
                                                <asp:LinkButton class="btn btn-light col-12" ID="findButton" runat="server" OnClick="findButton_Click">Find Reservation <i class="fas fa-search"></i></asp:LinkButton>
                                           </div>

                                   </div>

                              </div>
                               
                           </div>

                       </div>

                   </div>

               </div>

           </div>
       </div>

       <br />
       <section>

            <div class="container" runat="server" id ="reservationTitle">

                <div class="row">
                    <div class ="col-md-10 mx-auto">
                        <div class="card" style="font-family:Arial">
                            <div class="card-body">
                                <div class="row">
                                   <div class="col">
                                       <h2 style="font-weight:bold">Reservation List</h2>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="BookingID">
                                            <Columns>
                                                <asp:BoundField DataField="BookingID" HeaderText="Booking ID" ReadOnly="True" SortExpression="BookingID" />
                                                <asp:BoundField DataField="RoomTypeID" HeaderText="Room Type" SortExpression="RoomTypeID" />
                                                <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" SortExpression="BookingDate" />
                                                <asp:BoundField DataField="Night" HeaderText="Night" SortExpression="Night" />
                                                <asp:BoundField DataField="Check_InDate" HeaderText="Check-In Date" SortExpression="Check_InDate" />
                                                <asp:BoundField DataField="Check_OutDate" HeaderText="Check-Out Date" SortExpression="Check_OutDate" />
                                                <asp:BoundField DataField="TotalAmount" HeaderText="Total" SortExpression="TotalAmount" DataFormatString="{0:c}" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

       </section>
   </div>

</asp:Content>
