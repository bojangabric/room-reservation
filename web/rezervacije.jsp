<%-- 
    Document   : rezervacije
    Created on : Dec 1, 2018, 1:32:14 PM
    Author     : bojan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : Test
    Created on : Nov 25, 2018, 4:06:13 PM
    Author     : bojan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="title">
        Hoteli
    </jsp:attribute>

    <jsp:body>
        <div class="container">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table" align="center">
                        <thead>
                        <th>Rezervacija ID</th>
                        <th>Korisnik ID</th> 
                        <th>Soba ID</th>
                        <th>Datum dolaska</th>
                        <th>Datum odlaska</th>
                        <th>Novac</th>
                        <th>Poeni</th>
                        <th></th>
                        </thead>
                        <c:forEach items="${rezervacije}" var="rezervacija">
                            <tr>
                                <td class="align-middle">${rezervacija.getRezervacija_id()}</td>
                                <td class="align-middle">${rezervacija.getKorisnik_id()}</td> 
                                <td class="align-middle">${rezervacija.getSoba_id()}</td>
                                <td class="align-middle">${rezervacija.getDatum_dolaska()}</td>
                                <td class="align-middle">${rezervacija.getDatum_odlaska()}</td>
                                <td class="align-middle">${rezervacija.getNovac()}</td>
                                <td class="align-middle">${rezervacija.getPoeni()}</td>
                                <td alig="center">
                                    <a href="/OtkaziRezervacijuServlet/${rezervacija.getRezervacija_id()}">
                                       <button class="btn btn-danger btn-sm">Otkazi</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>    
