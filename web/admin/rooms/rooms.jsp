<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Rooms - Hotels</title>
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container col-12">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-bordered table-hover" align="center">
                        <thead>
                        <th>Room ID</th> 
                        <th>Hotel</th> 
                        <th>Type</th>
                        <th>Price</th>
                        <th>Points</th>
                        <th>Picture</th>
                        <th style="width: 8%;">
                            <a href="/CreateRoom">
                                <button class="btn btn-primary btn-sm">New room</button>
                            </a>
                        </th>
                        </thead>
                        <c:forEach items="${rooms}" var="room">
                            <tr>
                                <td class="align-middle">${room.getRoom_id()}</td>
                                <td class="align-middle">${room.getHotel()}</td>
                                <td class="align-middle">${room.getType()}</td> 
                                <td class="align-middle">${room.getPrice()}</td> 
                                <td class="align-middle">${room.getPoints()}</td>
                                <td class="align-middle">${room.getPicture()}</td> 
                                <td  style="width: 8%;">
                                    <a href="/ChangeRoom/${room.getRoom_id()}">
                                        <button class="btn btn-success btn-sm">Edit</button>
                                    </a>
                                    <a href="/DeleteRoom/${room.getRoom_id()}">
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