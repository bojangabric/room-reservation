<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Reservations - Hotels</title>
        <%@ include file="partials/metadata.jsp" %>
    </head>
    <body>
        <%@include file="partials/header.jsp" %>
        <div class="container">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-bordered table-hover" align="center">
                        <thead>
                        <th>Reservation ID</th>
                        <th>User ID</th>
                        <th>Room ID</th>
                        <th>Arrive date</th>
                        <th>Leave date</th>
                        <th>Price</th>
                        <th>Points</th>
                        </thead>

                        <c:forEach items="${reservations}" var="reservation">
                            <tr>
                                <td class="align-middle">${reservation.getReservation_id()}</td>
                                <td class="align-middle">${reservation.getUser_id()}</td>
                                <td class="align-middle">${reservation.getRoom_id()}</td>
                                <td class="align-middle">${reservation.getArrive_date()}</td>
                                <td class="align-middle">${reservation.getLeave_date()}</td>
                                <td class="align-middle">${reservation.getPrice()}</td>
                                <td class="align-middle">${reservation.getPoints()}</td>
                                <td alig="center">
                                    <a href="/CancelReservationServlet/${reservation.getReservation_id()}" >
                                        <button class="btn btn-danger btn-sm">Cancel</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <c:if test="${empty reservations}">
                        <tr><td>You don't have any reservations.</td></tr>
                    </c:if>
                </div>
            </div>
        </div>
        <%@include file="partials/footer.jsp" %>
    </body>
</html>
