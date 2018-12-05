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
                
                <c:if test="${not empty loggedInUser}">
                    <span class="nav-link"><c:out value="Poeni: ${sessionScope.loggedInUser.getPoeni()}" /></span>
                    <li class="nav-item">
                        <a class="nav-link" href="/rezervacije">Rezervacije</a>
                    </li>
                </c:if>
                    
                <li class="nav-item">
                    <a class="nav-link" href="/kontakt.jsp">Kontakt</a>
                </li>

                <c:choose>
                    <c:when test="${not empty loggedInUser}">
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
