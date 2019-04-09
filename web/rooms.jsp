<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Rooms - Hotels</title>
        <%@ include file="partials/metadata.jsp" %>
    </head>
    <body>

        <%@include file="partials/header.jsp" %>

        <div class = "container">
            <div class="row">
                <div class="col-lg-3 pt-4">
                    <form class="rooms-form p-4" action="/hotels/${hotel_id}" method="get">
                        <span class="label">Room type</span>
                        <div class="options pb-2 mt-2">         
                            <c:forEach items="${types}" var="type">
                                <label class="custom-radio types">${type}
                                    <input type="radio" name="room_type" value="${type}">
                                    <span class="checkmark"></span>
                                </label>
                            </c:forEach> 
                        </div>
                        <span class="label">Price</span>
                        <div class="options price">
                            <div class="price-wrapper">
                                <label class="price_label">Min price:</label>
                                <input class="mb-2 price_range" name="min_price" type="number" step="50" min="0" max="500" value="0">
                            </div>
                            <div class="price-wrapper">
                                <label class="price_label">Max price:</label>
                                <input class="mb-2 price_range" name="max_price" type="number" step="50" min="0" max="500" value="500">
                            </div>
                        </div>
                        <button class="btn btn-primary mt-3" type="submit">Search</button>
                    </form>
                </div>

                <%@include file="partials/rooms.jsp" %>

            </div>
        </div>

        <%@include file="partials/footer.jsp" %>

    </body>
</html>    