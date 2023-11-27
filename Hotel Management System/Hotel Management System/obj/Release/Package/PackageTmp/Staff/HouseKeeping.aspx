<%@ Page Title="Housekeeping Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HouseKeeping.aspx.cs" Inherits="Hotel_Management_System.Staff.HouseKeeping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="container-fluid" >
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body" style="font-size:20px; font-family:Arial; font-weight:bold;">

                  <%--Title Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight: bold;">Housekeeping Details</h2>
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
                     <div class="col-md-6">
                        <label>House Keeping ID</label>
                        <div class="form-group">
                           <div class="input-group">
                                <asp:TextBox CssClass="form-control" style="border-color:black" ID="idTextBox" runat="server"></asp:TextBox>
                                <asp:LinkButton class="btn btn-light" style="border-color:black"  ID="idLinkButton" runat="server" OnClick="idLinkButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Room Number</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="roomTextBox" placeholder="" runat="server"></asp:TextBox>
                                <asp:LinkButton class="btn btn-light" style="border-color:black"  ID="roomLinkButton" runat="server" OnClick="roomLinkButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                            </div>
                        </div>
                     </div>
                  </div>


                  <%--Button Row Row--%>
                  <div class="row mb-3 mx-auto">
                     
                     <div class="col">
                        <asp:Button ID="updateButton" class="btn btn-lg col-12 btn-success" runat="server" Text="Complete Housekeeping" OnClick="updateButton_Click"/>
                     </div>

                  </div>

               </div>
            </div>
         </div>

        <%--Room List--%>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body" style="font-family:Arial">

                  <%--Title Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight: bold;" >HouseKeeping List</h2>
                        </center>
                     </div>
                  </div>

                  <%--Line Row--%>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <%--Grid View--%>
                  <div class="row">
                     <div class="col">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT * FROM [Housekeeping] WHERE ([KeepingStatusID] = @KeepingStatusID)">
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="1" Name="KeepingStatusID" Type="Int32" />
                             </SelectParameters>
                         </asp:SqlDataSource>
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="HousekeepingID" OnRowDataBound="OnRowDataBound" emptydatatext="Sorry! There Are No Housekeeping Request.">
                             <Columns>
                                 <asp:BoundField DataField="HousekeepingID" HeaderText="HousekeepingID" InsertVisible="False" ReadOnly="True" SortExpression="HousekeepingID" />
                                 <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                                 <asp:BoundField DataField="KeepingStatusID" HeaderText="KeepingStatusID" SortExpression="KeepingStatusID" />
                             </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>

    <br /><br /><br /><br /><br /><br /><br /><br /><br />

</asp:Content>
