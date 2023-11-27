<%@ Page Title="Room Management" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Hotel Room Management.aspx.cs" Inherits="Hotel_Management_System.Admin.Hotel_Room_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

       function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
       }

       function onlyDotsAndNumbers(txt, event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode == 46) {
                if (txt.value.indexOf(".") < 0)
                    return true;
                else
                    return false;
            }

            if (txt.value.indexOf(".") > 0) {
                var txtlen = txt.value.length;
                var dotpos = txt.value.indexOf(".");
                //Change the number here to allow more decimal points than 2
                if ((txtlen - dotpos) > 2)
                    return false;
            }

            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
       }
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
                           <h2 style="font-weight: bold;">Room Details</h2>
                        </center>
                     </div>
                  </div>

                  <%--Image Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" width="100px" src="../room_img/room.png" />
                        </center>
                     </div>
                  </div>

                  <%--Line Row--%>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                 <%--File Upload--%>
                  <div class="row mb-3">
                     <div class="col">
                        <asp:FileUpload class="form-control" onchange="readURL(this)" ID="FileUpload1" runat="server" />
                     </div>
                  </div>

                  <%--1st Row--%> 
                  <div class="row mb-3">
                     <div class="col-md-6">
                        <label>Room Number</label>
                        <div class="form-group">
                           <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="roomNoTextBox" placeholder="e.g. 100" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                <asp:LinkButton class="btn btn-light" ID="roomIDLinkButton" runat="server" OnClick="roomIDLinkButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Room Status</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="statusTextBox" placeholder="Status Default (TRUE)" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:LinkButton class="btn btn-success" ID="trueLinkButton" runat="server" OnClick="trueLinkButton_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                <asp:LinkButton class="btn btn-danger" ID="falseLinkButton" runat="server" OnClick="falseLinkButton_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                            </div>
                        </div>
                     </div>
                  </div>

                  <%--2nd Row--%>
                  <div class="row mb-3">
                     <div class="col-md-6">
                        <label>Room Type</label>
                        <div class="form-group">
                           <div class="input-group">
                                  <asp:DropDownList class="form-control" ID="roomTypeList" runat="server">
                                      <asp:ListItem Text="Select Room Type" Value="0" />
                                      <asp:ListItem Text="Standard Queen Room" Value="1" />
                                      <asp:ListItem Text="Standard Twin Room" Value="2" />
                                      <asp:ListItem Text="Deluxe Queen Room" Value="3" />
                                      <asp:ListItem Text="Deluxe Twin Room" Value="4"  />
                                      <asp:ListItem Text="Suite Room" Value="5" />
                                      <asp:ListItem Text="Family Room" Value="6" />
                                      <asp:ListItem Text="Budget Room" Value="7" />
                                  </asp:DropDownList>
                               <asp:LinkButton class="btn btn-light" ID="getRoomDataButton" runat="server" OnClick="getRoomDataButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="priceTextBox" runat="server" onkeypress="return onlyDotsAndNumbers(this,event);"></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>

                  <%--3nd Row--%>
                  <div class="row mb-4">
                     <div class="col-md-6">
                        <label>Adult Capacity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="adultTextBox" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
                        </div>
                     </div>

                    <div class="col-md-6">
                        <label>Children Capacity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="childrenTextBox" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
                        </div>
                     </div>

                  </div>

                  <%--4th Row--%>
                  <div class="row mb-3">
                     <div class="col-12">
                        <label>Room Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="descriptionTextBox" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <%--Button Row Row--%>
                  <div class="row mb-3">

                     <div class="col-6">
                        <asp:Button ID="addButton" class="btn btn-lg col-12 btn-success" runat="server" Text="Add" OnClick="addButton_Click" />
                     </div>
                     
                     <div class="col-6">
                        <asp:Button ID="deleteButton" class="btn btn-lg col-12 btn-danger" runat="server" Text="Delete" OnClick="deleteButton_Click" />
                     </div>

                  </div>

                   <div class="row mb-6">
                        
                     <div class="col-6">
                        <asp:Button ID="updateAllButton" class="btn btn-lg col-12 btn-warning" runat="server" Text="Update Room Type" OnClick="updateAllButton_Click" />
                     </div>

                     <div class="col-6">
                        <asp:Button ID="updateCurrentButton" class="btn btn-lg col-12 btn-warning" runat="server" Text="Update Current Room" OnClick="updateCurrentButton_Click" />
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
                           <h2 style="font-weight: bold;" >Room List</h2>
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT * FROM [Rooms]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="RoomNumber" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="RoomNumber" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">

                                            <div class="row">

                                                <div class="col-lg-9">

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <Label style="font-size: large; font-weight:bold">Room</Label>    
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("RoomNumber") %>' Font-Size="Large" Font-Bold="True"></asp:Label>
                                                            
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12"> 
                                                            
                                                            <label>Room Type: </label>
                                                            <asp:Label ID="roomTypeIDLabel" runat="server" Text='<%# Eval("RoomTypeID").ToString()=="1" ? "Standard Queen Room" : Eval("RoomTypeID").ToString()=="2" ? "Standard Twin Room" : Eval("RoomTypeID").ToString()=="3" ? "Deluxe Queen Room" : Eval("RoomTypeID").ToString()=="4" ? "Deluxe Twin Room" : Eval("RoomTypeID").ToString()=="5" ? "Suite Room" : Eval("RoomTypeID").ToString()=="6" ? "Family Room" : Eval("RoomTypeID").ToString()=="7" ? "Budget Room" : "" %>' Font-Bold="True"></asp:Label>
                                                            </label>
                                                            <label> | Room Rates:
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("RoomPrice", "{0:C}") %>' Font-Bold="True"></asp:Label>
                                                            </label>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <label>Adult: </label>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("AdultCapacity") %>' Font-Bold="True"></asp:Label>
                                                            <label> | Children: </label>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("ChildrenCapacity") %>' Font-Bold="True"></asp:Label>
                                                            <label> | Active: </label>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("IsActive")%>' Font-Bold="True"></asp:Label>
                                                            
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-3">

                                                    <asp:Image ID="Image1" class="img-fluid" runat="server" ImageUrl='<%# Eval("RoomImage") %>' />

                                                </div>

                                            </div>
                                            
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>

    <br />

</asp:Content>
