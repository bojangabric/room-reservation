<%-- 
    Document   : header
    Created on : Nov 25, 2018, 4:52:36 PM
    Author     : bojan
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand ml-5" href="/">Hoteli</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/reservations.jsp">Rezervacije</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact.jsp">Kontakt</a>
                </li>

                <c:if test="${not empty loggedInUser}">

                </c:if>

                <c:choose>
                     <c:when test="${loggedInUser}">
                        <li class="nav-item">
                            <a class="nav-link" href="/LogoutServlet">Izloguj se</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="/login.jsp">Ulogujte se</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/register.jsp">Registracija</a>
                        </li>
                    </c:otherwise>   
                </c:choose>                    
            </ul>
        </div>
    </div>
</nav>
