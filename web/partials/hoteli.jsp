<%-- 
    Document   : hoteli
    Created on : Nov 28, 2018, 8:35:51 PM
    Author     : bojan
--%>

<%@page import="com.bojan.models.Hotel"%>
<%@page import="com.bojan.baza.Hoteli"%>



<div class="col-lg-9">
    <% for (Hotel hotel : Hoteli.UzmiHotele()) {%>
    <div class="card mt-4">
        <div class="row">
            <div class="col-lg-4">
                <img src="slike/<%= hotel.getSlika()%>"
                     class="w-100">
            </div>
            <div class="col-lg-8 px-3">
                <div class="card-block px-3">
                    <h4 class="card-title mt-3"><%= hotel.getNaziv()%></h4><h6><%= hotel.getAdresa()%>, <%= hotel.getGrad()%></h6>
                    <p class="card-text mt-3"><%= hotel.getOpis()%></p>
                    <p class="rating">
                        <% for (int i = 0; i < hotel.getZvezdice(); i++) { %>
                        <i class="fa fa-star"></i>
                        <% } %>
                    </p>
                    <form action="hoteli/<%= hotel.getHotel_id() %>" method="post">
                        <span class="prices"><strong>150$ - 200$</strong></span>
                        <input hidden type="text" name="hotel_id" value="<%= hotel.getHotel_id() %>">
                        <button type="submit" class="btn btn-primary btn-show-rooms">Prikazi sobe</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <% }%>
</div>


