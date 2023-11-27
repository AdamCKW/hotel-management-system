<%@ Page Title="Manage Order" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order Page.aspx.cs" Inherits="Hotel_Management_System.Staff.Order_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="container-fluid">

        <div class="row">

            <div class="col-md-5">

                <div class="card">

                    <div class="card-body" style="font-size:20px; font-family:Arial; font-weight:bold;">

                        <%--Title Row--%>
                        <div class="row">
                            <div class="col">
                                <center>
                                   <h2 style="font-weight: bold;">Order Details</h2>
                                </center>
                            </div>
                        </div>

                        <%--Line Row--%>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <%--1st Row--%>
                        <div class="row mb-3">
                             <div class="col-6">
                                 <label>Order ID</label>
                                 <div class="input-group">
                                     <asp:TextBox class="form-control" ID="orderIDTextBox" runat="server"></asp:TextBox>
                                     <asp:LinkButton class="btn btn-light" ID="getButton" runat="server" OnClick="getButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                 </div>
                             </div>
                            <div class="col-6">
                                <label>Order Status</label>
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="statusTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-success" ID="completeButton" runat="server" OnClick="completeButton_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    <asp:LinkButton class="btn btn-warning" ID="pendingButton" runat="server" OnClick="pendingButton_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>

                        <%--2nd Row--%>
                        <div class="row mb-3">
                             <div class="col-6">
                                 <label>Item Name</label>
                                 <asp:TextBox CssClass="form-control" ID="itemTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                             </div>
                            <div class="col-6">
                                <label>Item Quantity</label>
                                <asp:TextBox CssClass="form-control" ID="quantityTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <%--2nd Row--%>
                        <div class="row mb-3">
                             <div class="col-6">
                                 <label>Room Number</label>
                                 <asp:TextBox CssClass="form-control" ID="roomNoTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                             </div>
                            <div class="col-6">
                                 <label>Total</label>
                                 <asp:TextBox CssClass="form-control" ID="totalTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                             </div>
                        </div>
                        <%--3rd Row--%>
                        <div class="row mb-3">
                             <div class="col-6">
                                    <asp:Button class="btn btn-lg col-12 btn-success" ID="updateButton" runat="server" Text="Complete Order" OnClick="updateButton_Click" />
                             </div>
                             <div class="col-6">
                                    <asp:Button class="btn btn-lg col-12 btn-danger" ID="cancelButton" runat="server" Text="Cancel Order" OnClick="cancelButton_Click" />
                             </div>
                        </div>

                    </div>

                </div>

            </div>

            <div class="col-md-7">

                <div class="card">

                    <div class="card-body" style="font-family:Arial;">

                        <%--Title Row--%>
                        <div class="row">
                           <div class="col">
                              <center>
                                 <h2 style="font-weight: bold;" >Order List</h2>
                              </center>
                           </div>
                        </div>

                        <%--Line Row--%>
                        <div class="row">
                           <div class="col">
                              <hr>
                           </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick"></asp:Timer>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT * FROM [order_tbl] WHERE ([OrderStatusID] = @OrderStatusID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="OrderStatusID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled">
                                    <ContentTemplate>
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" emptydatatext="Sorry! There Are No Orders." OnRowDataBound="GridView1_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                                                <asp:BoundField DataField="ItemID" HeaderText="Item ID" SortExpression="ItemID" />
                                                <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                <asp:BoundField DataField="Cost" HeaderText="Total" SortExpression="Cost" DataFormatString="{0:c}" />
                                                <asp:BoundField DataField="OrderStatusID" HeaderText="Order Status" SortExpression="OrderStatusID" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                          <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    </Triggers>
                            </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <br />
</asp:Content>
