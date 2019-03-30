<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <img class="ml-3" src="/pictures/favicon.png" width="25px" height="25px"/>
        <a class="navbar-brand ml-2" href="/">Hotels</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">

                <c:choose>
                    <c:when test="${not empty loggedInUser}">

                        <c:if test="${loggedInUser.getRole().equals('client')}">
                            <span class="navbar-text"><c:out value="Points: ${sessionScope.loggedInUser.getPoints()}" /></span>
                            <li class="nav-item">
                                <a class="nav-link" href="/reservations">Reservations</a>
                            </li>
                        </c:if>

                        <c:if test="${loggedInUser.getRole().equals('manager')}">
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/hotels">Hotel</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/rooms">Rooms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/roomtypes">Room types</a>
                            </li>
                        </c:if>

                        <c:if test="${loggedInUser.getRole().equals('admin')}">

                            <li class="nav-item">
                                <a class="nav-link" href="/admin/clients">Clients</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/hotels">Hotels</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/rooms">Rooms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/roomtypes">Room types</a>
                            </li>
                        </c:if>

                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Logout</a>
                        </li>

                    </c:when>

                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="/login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/register">Register</a>
                        </li>
                    </c:otherwise>   
                </c:choose>   

            </ul>
        </div>
    </div>
</nav>
