<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-9">
    <c:forEach items="${hoteli}" var = "hotel">
        <div class="card mt-4">
            <div class="row">
                <div class="col-lg-4">
                    <img src="/slike/${hotel.getSlika()}"
                         class="w-100">
                </div>
                <div class="col-lg-8 px-3">
                    <div class="card-block px-3">
                        <h4 class="card-title mt-3">${hotel.getNaziv()}</h4><h6>${hotel.getAdresa()}, ${hotel.getGrad()}</h6>
                        <p class="card-text mt-3">${hotel.getOpis()}</p>
                        <p class="rating">
                            
                            <c:forEach begin="1" end="${hotel.getZvezdice()}">
                                <i class="fa fa-star"></i>
                            </c:forEach>
                                
                        </p>    

                        <form action="hoteli/${hotel.getHotel_id()}">
                            <span class="prices"><strong>${hotel.getMin_cena_sobe()}$ - ${hotel.getMax_cena_sobe()}$</strong></span>
                            <button type="submit" class="btn btn-primary btn-show-rooms">Prikazi sobe</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


