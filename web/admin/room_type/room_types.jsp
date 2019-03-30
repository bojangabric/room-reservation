<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Room types - Hotels</title>
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container col-12">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-bordered table-hover" align="center">
                        <thead>
                        <th>Type ID</th> 
                        <th>Type</th>
                        <th style="width: 8%;">
                            <a href="/CreateType">
                                <button class="btn btn-primary btn-sm">New room type</button>
                            </a>
                        </th>
                        </thead>
                        <c:forEach items="${types}" var="type">
                            <tr>
                                <td class="align-middle">${type.getType_id()}</td>
                                <td class="align-middle">${type.getType()}</td>
                                <td  style="width: 8%;">
                                    <a href="/ChangeType/${type.getType_id()}">
                                        <button class="btn btn-success btn-sm">Edit</button>
                                    </a>
                                    <a href="/DeleteType/${type.getType_id()}">
                                        <button class="btn btn-danger btn-sm">Delete</button>
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