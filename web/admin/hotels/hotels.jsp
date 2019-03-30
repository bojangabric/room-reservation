<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Hotels - Hotels</title>
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
                        <th>Name</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Country</th>
                        <th>Description</th>
                        <th>Stars</th>
                        <th>Picture</th>

                        <c:if test="${loggedInUser.getRole().equals('admin')}">
                            <th style="width: 8%;">
                                <a href="/CreateHotel">
                                    <button class="btn btn-primary btn-sm">New hotel</button>
                                </a>
                            </th>
                        </c:if>

                        </thead>
                        <c:forEach items="${hotels}" var="hotel">
                            <tr>
                                <td class="align-middle">${hotel.getHotel_id()}</td>
                                <td class="align-middle">${hotel.getName()}</td> 
                                <td class="align-middle">${hotel.getAddress()}</td> 
                                <td class="align-middle">${hotel.getCity()}</td>
                                <td class="align-middle">${hotel.getCountry()}</td> 
                                <td class="align-middle">${hotel.getDescription()}</td>
                                <td class="align-middle">${hotel.getStars()}</td>
                                <td class="align-middle">${hotel.getPicture()}</td> 
                                <c:if test="${loggedInUser.getRole().equals('admin')}">
                                    <td  style="width: 8%;">
                                        <a href="/ChangeHotel/${hotel.getHotel_id()}">
                                            <button class="btn btn-success btn-sm">Edit</button>
                                        </a>
                                        <a href="/DeleteHotel/${hotel.getHotel_id()}">
                                            <button class="btn btn-danger btn-sm">Delete</button>
                                        </a>
                                    </td>
                                </c:if>

                                <c:if test="${loggedInUser.getRole().equals('manager')}">
                                    <td  style="width: 4%;">
                                        <a href="/ChangeHotel/${hotel.getHotel_id()}">
                                            <button class="btn btn-success btn-sm">Edit</button>
                                        </a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <%@include file="/partials/footer.jsp" %>

    </body>
</html>