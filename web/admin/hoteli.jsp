<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Hoteli - Hoteli</title>
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container col-12">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-bordered table-hover" align="center">
                        <thead>
                        <th>Hotel ID</th> 
                        <th>Naziv</th>
                        <th>Adresa</th>
                        <th>Grad</th>
                        <th>Drzava</th>
                        <th>Opis</th>
                        <th>Zvezdice</th>
                        <th>Slika</th>
               
                        </thead>
                        <c:forEach items="${hoteli}" var="hotel">
                            <tr>
                                <td class="align-middle">${hotel.getHotel_id()}</td>
                                <td class="align-middle">${hotel.getNaziv()}</td> 
                                <td class="align-middle">${hotel.getAdresa()}</td> 
                                <td class="align-middle">${hotel.getGrad()}</td>
                                <td class="align-middle">${hotel.getDrzava()}</td> 
                                <td class="align-middle">${hotel.getOpis()}</td>
                                <td class="align-middle">${hotel.getZvezdice()}</td>
                                <td class="align-middle">${hotel.getSlika()}</td> 
                                <td alig="center">
                                    <a href="/IzmeniHotel/${hotel.getHotel_id()}">
                                        <button class="btn btn-success btn-sm">Izmeni</button>
                                    </a>
                                </td>
                                <td alig="center">
                                    <a href="/ObrisiHotel/${hotel.getHotel_id()}">
                                        <button class="btn btn-danger btn-sm">Obrisi</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <%@include file="/partials/footer.jsp" %>

    </body>
</html>