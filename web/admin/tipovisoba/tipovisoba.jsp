<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Tipovi soba - Hoteli</title>
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container col-12">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-bordered table-hover" align="center">
                        <thead>
                        <th>Tip ID</th> 
                        <th>Tip</th>
                        <th style="width: 8%;">
                            <a href="/KreirajTip">
                                <button class="btn btn-primary btn-sm">Novi tip sobe</button>
                            </a>
                        </th>
                        </thead>
                        <c:forEach items="${tipovi}" var="tip">
                            <tr>
                                <td class="align-middle">${tip.getTip_id()}</td>
                                <td class="align-middle">${tip.getTip()}</td>
                                <td  style="width: 8%;">
                                    <a href="/IzmeniTip/${tip.getTip_id()}">
                                        <button class="btn btn-success btn-sm">Izmeni</button>
                                    </a>
                                    <a href="/ObrisiTip/${tip.getTip_id()}">
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