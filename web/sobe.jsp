<%-- 
    Document   : sobe
    Created on : Nov 29, 2018, 5:26:57 AM
    Author     : bojan
--%>

<%@page import="com.bojan.baza.Sobe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bojan.models.Soba"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Sobe - Hoteli</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="/css/style.css" rel="stylesheet" >
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand ml-5" href="/">Hoteli</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <c:if test="${not empty loggedInUser}">
                            <li class="nav-item">
                                <a class="nav-link" href="/rezervacije">Rezervacije</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="/kontakt.jsp">Kontakt</a>
                        </li>

                        <c:choose>
                            <c:when test="${loggedInUser != null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="/logout">Izloguj se</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <a class="nav-link" href="/login">Uloguj se</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/register">Registracija</a>
                                </li>
                            </c:otherwise>   
                        </c:choose>                    
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-lg-3 pt-4">
                    <form action="<%= request.getAttribute("hotel_id")%>" method="get">
                        <span class="label">Tip sobe</span>
                        <div class="options pb-2 mt-2">
                            <% ArrayList<String> tipovi_sobe = Sobe.UzmiTipove((int)request.getAttribute("hotel_id"));
                                for (String tip : tipovi_sobe) {%>
                            <label class="custom-radio types"><%=tip%>
                                <input type="radio" name="tip_sobe" value="<%=tip%>">
                                <span class="checkmark"></span>
                            </label>
                            <% } %>
                        </div>

                        <span class="label">Cena</span>
                        <div class="options mt-2 prices">
                            <label class="price_label">Min cena: <input class="mb-2 price_range" name="min_cena" type="number" step="50" min="0" max="500" value="0"></label><br>
                            <label class="price_label">Max cena: <input class="mb-3 price_range" name="max_cena" type="number" step="50" min="0" max="500" value="500"></label><br>
                        </div>
                        <button class="btn btn-primary mt-3" type="submit">Pretrazi</button>
                    </form>
                </div>


                <div class="col-lg-9">
                    <% ArrayList<Soba> sobe = (ArrayList<Soba>) request.getAttribute("sobe");
                        for (Soba s : sobe) {%>
                    <div class="card mt-4">
                        <div class="row">
                            <div class="col-lg-4">
                                <img src="/slike/<%= s.getSlika()%>" class="w-100">
                            </div>
                            <div class="col-lg-8 px-3">
                                <div class="card-block px-3">
                                    <h4 class="card-title mt-3"><%= s.getTip()%>, <%= s.getHotel()%></h4>
                                    <p class="card-text mt-3">Opis</p>

                                    <form action="/rezervisi" method="post">
                                        <span class="prices"><strong><%= s.getCena()%>$</strong></span>
                                        <input hidden type="text" name="hotel_id" value="<%= s.getSoba_id()%>">
                                        <button type="submit" class="btn btn-primary btn-show-rooms">Rezervisi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }%>                 
                </div>

            </div>
        </div>


        <footer class="bg-dark">
            <div class="container text-center text-white" style="position:relative;">
                Copyright &copy; Hoteli 2018
                <div class="socials">
                    Follow us on: 
                    <a href="https://www.facebook.com/" class="fa fa-facebook"></a>
                    <a href="https://twitter.com/" class="fa fa-twitter"></a>
                    <a href="https://www.instagram.com/?hl=en" class="fa fa-instagram"></a>
                </div>
            </div>
        </footer>


    </body>
</html>    