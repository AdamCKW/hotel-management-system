<%@ Page Title="Stay Completion" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Room Sales.aspx.cs" Inherits="Hotel_Management_System.Admin.Room_Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container" style="font-family: Arial">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                       <div class="card-body">
                          <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Booking Stay Completion</h2>
                                </center>
                             </div>
                          </div>
                           <div class="row">
                             <div class="col-md-2"></div>
                             <div class="form-group col-md-2">
                                 <asp:TextBox class="form-control" ID="fdateTextBox" runat="server" TextMode="Date"></asp:TextBox>
                             </div>
                             <div class="form-group col-md-2">
                                 <asp:TextBox class="form-control" ID="ldateTextBox" runat="server" TextMode="Date"></asp:TextBox>
                             </div>
                             <div class="col-md-6">
                                 <asp:LinkButton class="btn btn-light col-3" ID="sortButton" runat="server" text="Sort" OnClick="sortButton_Click"></asp:LinkButton>
                                 <asp:linkbutton class="btn btn-light col-3" id="lnkExportAll" runat="server" tooltip="Export this List" text="Export to Excel" onclick="lnkExportAll_Click"></asp:linkbutton>
                             </div>
                          </div>

                          <div class="row">
                             <div class="col">
                                <hr>
                             </div>
                          </div>
                          <div class="row">
                             <div class="col">
                                <panel id="pnlGridView">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID" emptydatatext="Sorry! No Booking Completion.">
                                    <Columns>
                                        <asp:BoundField DataField="BookingID" HeaderText="Booking ID" ReadOnly="True" SortExpression="BookingID" />
                                        <asp:BoundField DataField="RoomTypeID" HeaderText="Room Type ID" SortExpression="RoomTypeID" />
                                        <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                                        <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" />
                                        <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                                        <asp:BoundField DataField="Night" HeaderText="Night" SortExpression="Night" />
                                        <asp:BoundField DataField="Check_InDate" HeaderText="Check_InDate" SortExpression="Check_InDate" />
                                        <asp:BoundField DataField="Check_OutDate" HeaderText="Check_OutDate" SortExpression="Check_OutDate" />
                                        <asp:BoundField DataField="TotalAmount" HeaderText="Total" SortExpression="TotalAmount" DataFormatString="{0:c}" />
                                    </Columns>

                                 </asp:GridView>
                                 </panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
