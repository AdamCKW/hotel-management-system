<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DrinkList.aspx.cs" Inherits="Hotel_Management_System.Public.HotelServices.DrinkList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Banner--%>
    <section>
        <img src="/imgs/Food/foodbanner3.png" class="img-fluid" />
    </section>

    <br />
    
    <div class="container-fluid" style="font-family:Arial">
      <div class="row justify-content-center">
         <div class="col-md-10 mx-auto">
             <nav aria-label="breadcrumb" >
                 <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="/Public/HomePage.aspx">Home</a></li>
                     <li class="breadcrumb-item"><a href="/Public/Service.aspx">Room Service</a></li>
                     <li class="breadcrumb-item"><a href="/Public/HotelServices/Food Service.aspx">F & D Service</a></li>
                     <li class="breadcrumb-item active" aria-current="page">Drinks</li>
                 </ol>
             </nav>
         </div>
         <div class="col-md-10 mx-auto">
            <div class="card">
               <div class="card-body">

                  <%--1st Row--%>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h1 style="font-weight:bold">Foods</h1>
                        </center>
                     </div>
                  </div>

                  <%--2nd Row--%>
                  <div class="row mb-3">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <%--3rd Row--%>
                  <div class="row mb-3">

                            <asp:Repeater ID="rptPages" runat="server">
                                <ItemTemplate>
                                    <%# Container.ItemIndex %3 == 0 ? "<div class=\"row mb-3\">" : "" %>
                                    <div class="col-md-4">
                                        <center>
                                            <asp:HyperLink NavigateUrl='<%# Eval("ItemID", "~/ProductPages/{0}.aspx") %>' runat="server">
                                                <asp:Image width="100%" ImageUrl='<%# Eval("ItemImage") %>' runat="server"></asp:Image>
                                            </asp:HyperLink>
                                            <asp:HyperLink class="roomlinks" NavigateUrl='<%# Eval("ItemID", "~/ProductPages/{0}.aspx") %>' Text='<%# Eval("ItemName") %>' runat="server" />
                                        </center>
                                    </div>
                                    <%# Container.ItemIndex %3 == 2 ? "</div>" : "" %>
                                </ItemTemplate>
                            </asp:Repeater>
                      <%= rptPages.Items.Count %3 != 0 ? "</div>" : "" %>
                 </div>
               </div>
            </div>
         </div>
      </div>
   </div>

    <br />

</asp:Content>
