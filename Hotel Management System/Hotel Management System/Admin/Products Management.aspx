<%@ Page Title="Product Management" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Products Management.aspx.cs" Inherits="Hotel_Management_System.Admin.Products_Management" %>
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
                           <h2 style="font-weight: bold;">Product Details</h2>
                        </center>
                     </div>
                  </div>

                  <%--Image Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" width="100px" src="../product_img/fast-food.png" />
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
                        <label>Item ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="itemIDTextBox" runat="server" TextMode="Number"></asp:TextBox>
                              <asp:LinkButton class="btn btn-light" ID="itemIDLinkButton" runat="server" OnClick="itemIDLinkButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Item Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="itemNameTextBox" runat="server"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <%--2nd Row--%>
                  <div class="row mb-3">
                     <div class="col-md-6">
                        <label>Item Type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="foodTypeDropDownList" runat="server">
                              <asp:ListItem Text="Select Item Type" Value="0"></asp:ListItem>
                              <asp:ListItem Text="Food" Value="1" />
                              <asp:ListItem Text="Drinks" Value="2" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="priceTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     
                  </div>

                  <%--3nd Row--%>
                  <div class="row mb-3">
                     <div class="col-md-6">
                        <label>Is Active</label>
                        <div class="form-group">
                              <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="statusTextBox" placeholder="Status Default (True)" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:LinkButton class="btn btn-success" ID="trueLinkButton" runat="server" OnClick="trueLinkButton_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                <asp:LinkButton class="btn btn-danger" ID="falseLinkButton" runat="server" OnClick="falseLinkButton_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                            </div>
                        </div>
                     </div>
                  </div>

                  <%--4th Row--%>
                  <div class="row mb-3">
                     <div class="col-12">
                        <label>Item Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="itemDetailTextBox" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <%--5th Row--%>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="addButton" class="btn btn-lg col-12 btn-success" runat="server" Text="Add" OnClick="addButton_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="updateButton" class="btn btn-lg col-12 btn-warning" runat="server" Text="Update" OnClick="updateButton_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="deleteButton" class="btn btn-lg col-12 btn-danger" runat="server" Text="Delete" OnClick="deleteButton_Click" />
                     </div>
                  </div>
               </div>
            </div>
         </div>

        <%--Room List--%>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body" style="font-family:Arial;">

                  <%--Title Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2 style="font-weight: bold;" >Product List</h2>
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelManagementDBConnectionString %>" SelectCommand="SELECT * FROM [product_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="ItemID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        
                                        <div class="container-fluid">

                                            <div class="row">

                                                <div class ="col-lg-9">

                                                    <div class="row">
                                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("ItemName") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <label>Type - </label>
                                                            <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("ItemTypeID") %>' Font-Bold="True"></asp:Label>
                                                            <label> | Price - </label>
                                                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("Price", "{0:C}") %>' Font-Bold="True"></asp:Label>
                                                            <label> | Status - </label>
                                                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("IsActive") %>' Font-Bold="True"></asp:Label>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <label>Description - </label>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("ItemDetail") %>' Font-Bold="True" Font-Size="Small"></asp:Label>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class ="col-lg-3">

                                                    <asp:Image class="img-fluid" ID="productImage" runat="server" ImageUrl='<%# Eval("ItemImage") %>' />

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
