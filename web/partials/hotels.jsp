<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-9">

    <c:if test="${not empty error}">
        <div class="mt-4 alert alert-info alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${error}
        </div>
    </c:if>

    <c:forEach items="${hotels}" var="hotel">
        <div class="card mt-4 kol4">
            <div class="row ">
                <div class="col-lg-4 pr-0">
                    <img src="/pictures/${hotel.getPicture()}" class="picture p-0">
                </div>
                <div class="col-lg-8 px-3 hotel">
                    <div class="card-block px-3">
                        <h4 class="card-title mt-3">${hotel.getName()}</h4><h6>${hotel.getAddress()}, ${hotel.getCity()}</h6>
                        <p class="card-text mt-3">${hotel.getDescription()}</p>
                        <p class="rating">
                            <c:forEach begin="1" end="${hotel.getStars()}">
                                <i class="fa fa-star"></i>
                            </c:forEach>
                        </p>    

                        <form action="hotels/${hotel.getHotel_id()}">
                            <c:choose>
                                <c:when test="${hotel.getMin_room_price() > 0 || hotel.getMax_room_price() > 0}">
                                    <span class="price"><strong>${hotel.getMin_room_price()}$ - ${hotel.getMax_room_price()}$</strong></span>
                                    <button type="submit" class="btn btn-primary btn-show-rooms">Show rooms</button>
                                </c:when>
                                <c:otherwise>
                                    <span class="price">There are no rooms available.</span>
                                    <button type="button" class="btn btn-primary btn-show-rooms disabled">Show rooms</button>
                                </c:otherwise>
                            </c:choose>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


