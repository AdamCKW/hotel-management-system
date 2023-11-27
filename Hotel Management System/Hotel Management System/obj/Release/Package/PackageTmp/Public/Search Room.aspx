<%@ Page Title="Booking" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search Room.aspx.cs" Inherits="Hotel_Management_System.Public.Search_Room" %>
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
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
      <img src="../imgs/reservebanner.png" class="img-fluid"/>
   </section>
   <br />

   <%--Content--%>
   <div class="container">
       <div class="row" style="font-weight: bold; font-family:Arial; font-size:20px">
           <div class="col-md-10 mx-auto">
               
               <div class="card">

                   <div class="card-body">

                       <div class="row">

                           <div class="col">

                               <div class="row mb-3">

                                   <%--Adult--%>
                                   <div class="form-group col-md-2">
                                       <center>
                                       <asp:Label ID="adultLabel" runat="server" Text="Adult"></asp:Label>
                                       </center>
                                       <input id="adultCapacity" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 1" name="adultCapacity">
                                   </div>

                                   <%--Children--%>
                                   <div class="form-group col-md-2">
                                       <center>
                                       <asp:Label ID="childrenLabel" runat="server" Text="Children"></asp:Label>
                                       </center>
                                       <input id="childrenCapacity" runat="server" class="form-control" onkeypress="return isNumberKey(event)" type="text" placeholder="e.g. 0" name="childrenCapacity">                     
                                   </div>

                                   <%--Check In--%>
                                   <div class=" form-group col-md-3">
                                       <center>
                                       <asp:Label ID="dateInLabel" runat="server" Text="Check In Date"></asp:Label>
                                       </center>
                                       <div>
                                       <asp:TextBox CssClass="form-control" ID="dateInTextBox" runat="server" TextMode="Date"></asp:TextBox>
                                       </div>
                                   </div>

                                   <%--Check Out--%>
                                   <div class="form-group col-md-3">
                                       <center>
                                       <asp:Label ID="dateOutLabel" runat="server" Text="Check Out Date"></asp:Label>
                                       </center>
                                       <div>
                                       <asp:TextBox CssClass="form-control" ID="dateOutTextBox" runat="server" TextMode="Date"></asp:TextBox>
                                       </div>
                                   </div>
                                   
                                   <%--Find Room--%>
                                   <div class="col-md-2">
                                       
                                       <center>
                                           <br />                                           
                                           <div>
                                                <asp:LinkButton class="btn btn-light" ID="searchButton" runat="server" OnClick="searchButton_Click">Search <i class="fas fa-search"></i></asp:LinkButton>
                                           </div>
                                       </center>

                                   </div>

                              </div>

                              <div class ="row">
                                  <div class ="col-md-3">
                                      <center>
                                            <asp:Label ID="roomTypeLabel" runat="server" Text="Room Type"></asp:Label>
                                      </center>
                                      <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                          <asp:ListItem Text="Select" Value="0" />
                                            <asp:ListItem Text="Standard Queen Room" Value="1" />
                                            <asp:ListItem Text="Standard Twin Room" Value="2" />
                                            <asp:ListItem Text="Deluxe Queen Room" Value="3" />
                                            <asp:ListItem Text="Deluxe Twin Room" Value="4"  />
                                            <asp:ListItem Text="Suite Room" Value="5" />
                                            <asp:ListItem Text="Family Room" Value="6" />
                                            <asp:ListItem Text="Budget Room" Value="7" />
                                      </asp:DropDownList>
                                  </div>
                                  <div class="col-md-3">
                                      <center>
                                            <asp:Label ID="availableLabel" runat="server" Text="Available Rooms"></asp:Label>
                                      </center>
                                      <asp:TextBox class="form-control" ID="availableTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                                  </div>
                                  <div class="col-md-6">
                                      <br />
                                      <asp:LinkButton class="roomlinks btn btn-light col-6 button-style" style="font-size:20px" ID="bookNowLinkButton" runat="server" OnClick="bookNowLinkButton_Click">Book Now</asp:LinkButton>
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

            <div class="container" runat="server" id ="availableTitle">

                <div class="row">
                    <div class ="col-md-10 mx-auto">
                        <div class="card" style="font-family:Arial">
                            <div class="card-body">
                                <div class="row" >
                                   <div class="col">
                                       <h2 style="font-weight:bold">Other Available Rooms</h2>
                                   </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="RoomNumber" AutoGenerateColumns="False" emptydatatext="Sorry! There Are No Rooms Available.">
                                            <Columns>
                                <asp:BoundField DataField="RoomNumber" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="RoomNumber" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid" style ="font-size: 20px">

                                            <div class="row">

                                                <div class="col-lg-9">

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:Label ID="roomTypeIDLabel" runat="server" Text='<%# Eval("RoomType") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <label>Room Rates:
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

       </section>
       <br />

       <br /><br />

   </div>
    <br /><br /><br />

</asp:Content>
