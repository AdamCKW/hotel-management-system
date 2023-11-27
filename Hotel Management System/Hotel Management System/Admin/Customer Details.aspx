<%@ Page Title="Customer List" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Customer Details.aspx.cs" Inherits="Hotel_Management_System.Admin.Customer_Details" %>
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
                    <div class="card ">
                       <div class="card-body bg-white">
                          <div class="row">
                             <div class="col">
                                <center>
                                   <h2 style="font-weight:bold">Customer List</h2>
                                </center>
                             </div>
                          </div>
                           <div class="row">
                             <div class="col-4">
                                 <asp:linkbutton class="btn btn-light col-12" id="lnkExportAll" runat="server" tooltip="Export this List" text="Export to Excel" onclick="lnkExportAll_Click"></asp:linkbutton>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT * FROM [CustomerDetails]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" emptydatatext="Sorry! There Are No Customer Details.">
                                    <Columns>
                                        <asp:BoundField DataField="CustomerID" HeaderText="ID" ReadOnly="True" SortExpression="CustomerID" />
                                        <asp:BoundField DataField="Prefix" HeaderText="Prefix" SortExpression="Prefix" />
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="CustomerNo" HeaderText="Customer No" SortExpression="CustomerNo" />
                                        <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
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
    <br />

</asp:Content>
