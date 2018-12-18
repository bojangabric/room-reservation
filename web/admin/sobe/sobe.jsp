<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Sobe - Hoteli</title>
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container col-12">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-bordered table-hover" align="center">
                        <thead>
                        <th>Soba ID</th> 
                        <th>Hotel</th> 
                        <th>Tip</th>
                        <th>Cena</th>
                        <th>Poeni</th>
                        <th>Slika</th>
                        <th style="width: 8%;">
                            <a href="/KreirajSobu">
                                <button class="btn btn-primary btn-sm">Nova soba</button>
                            </a>
                        </th>
                        </thead>
                        <c:forEach items="${sobe}" var="soba">
                            <tr>
                                <td class="align-middle">${soba.getSoba_id()}</td>
                                <td class="align-middle">${soba.getHotel()}</td>
                                <td class="align-middle">${soba.getTip()}</td> 
                                <td class="align-middle">${soba.getCena()}</td> 
                                <td class="align-middle">${soba.getPoeni()}</td>
                                <td class="align-middle">${soba.getSlika()}</td> 
                                <td  style="width: 8%;">
                                    <a href="/IzmeniSobu/${soba.getSoba_id()}">
                                        <button class="btn btn-success btn-sm">Izmeni</button>
                                    </a>
                                    <a href="/ObrisiSobu/${soba.getSoba_id()}">
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