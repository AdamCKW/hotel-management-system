<%@ Page Title="View Sales" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="Hotel_Management_System.Admin.Sales" %>
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
                                   <h2 style="font-weight:bold">Sales List</h2>
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" emptydatatext="Sorry! There Are No Sales.">
                                    <Columns>
                                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                        <asp:BoundField DataField="ItemID" HeaderText="Item ID" SortExpression="ItemID" />
                                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" DataFormatString="{0:c}" />
                                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
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
