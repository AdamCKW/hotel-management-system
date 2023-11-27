<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact Us.aspx.cs" Inherits="Hotel_Management_System.Public.Contact_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.1582965494117!2d101.46022171475704!3d3.0522601977772386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc533c20692bb5%3A0xfb98a696e87d2b36!2sHistana%20Hotel%20Klang!5e0!3m2!1sen!2smy!4v1626173844607!5m2!1sen!2smy" width="1920" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
   </section>
    <br />
    <div class="container">
      <div class="row">
         <div class="col-md-12 mx-auto">
            <div class="card">
               <div class="card-body">

                  <%--3rd Row--%>
                  <div class="row mb-3" style="font-family:Arial; font-size:20px">     
                      <div class="col">
                          <center>
                                <h4 style="font-weight:bold">For all enquiries, please contact us using the methods below</h4>
                          </center>
                      </div>
                  </div>

                   <%--4th Row--%>
                  <div class="row" style="font-family:Arial; font-size:20px">     
                      <div class="col-md-4">
                          <h4 style="font-weight:bold">Direct Contact</h4>
                          <p>Phone: +01 23456788</p>
                          <p>Fax Number: +01 23456789</p>
                          <p>Email: <a style="color:black" href = "mailto:info@example.com">info@example.com</a></p>
                      </div>

                      <div class="col-md-4">
                          <h4 style="font-weight:bold">Address</h4>
                          <p>Centro, 17, Jalan Batu Tiga Lama, Kawasan 16, 41300 Klang, Selangor</p>
                      </div>

                      <div class="col-md-4">
                          <h4 style="font-weight:bold">Social Networks</h4>
                          <a href="https://www.facebook.com/" class="me-4 text-reset"><i class="fab fa-facebook-f fa-2x"></i></a>

                          <a href="https://www.twitter.com/" class="me-4 text-reset"><i class="fab fa-twitter fa-2x"></i></a>

                          <a href="https://www.google.com/" class="me-4 text-reset"><i class="fab fa-google fa-2x"></i></a>

                          <a href="https://www.instagram.com/" class="me-4 text-reset"><i class="fab fa-instagram fa-2x"></i></a>

                          <a href="https://www.linkedin.com/" class="me-4 text-reset"><i class="fab fa-linkedin fa-2x"></i></a>

                          <a href="https://www.github.com/" class="me-4 text-reset"><i class="fab fa-github fa-2x"></i></a>
                      </div>

                  </div>

               </div>
            </div>
         </div>
      </div>
   </div>
    <br />
</asp:Content>
