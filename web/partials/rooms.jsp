<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-lg-9">
    

    <c:if test="${not empty error}">
        <div class="mt-4 alert alert-info alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${error}
        </div>
    </c:if>
    
    <c:forEach items="${rooms}" var="room">
        <div class="card mt-4 col4">
            <div class="row hotel-row">
                <img src="/pictures/${room.getPicture()}" class="picture p-0">
                <div class="col-lg-8 px-3 room">
                    <div class="card-block px-3">
                        <h4 class="card-title mt-3">${room.getType()}, ${room.getHotel()}</h4>
                        <p class="card-text mt-3">Description</p>

                        <span class="price-and-points"><strong><span class="price">${room.getPrice()}</span>$ or <span class="points">${room.getPoints()}</span> points</strong></span>
                        <input hidden type="text" id="room_id" value="${room.getRoom_id()}">
                        <div>
                            Check-in<input type="text" name="arrive_date" class="form-control datepick w-25 arrive_date" required>
                        </div>

                        <div>
                            Check-out <input type="text" name="leave_date" class="form-control datepick w-25 mt-3 leave_date" required>
                            <button type="button" class="btn btn-primary btn-show-rooms mt-3 btn-purchase" data-toggle="modal" data-target="#reservation">
                                Purchase
                            </button>
                        </div>
                        <span hidden class="hotel_id">${room.getHotel_id()}</span>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>                
</div>

<!-- Modal -->
<div class="modal fade" id="reservation" tabindex="-1" role="dialog" aria-labelledby="reservationLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rezervacijaLabel">Payment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/reservations" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="card">Choose card</label>
                        <select class="form-control" id="card" name="card">
                            <option>MasterCard</option>
                            <option>Maestro</option>
                            <option>Visa</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="card_number">Card number</label>
                        <input required type="text" class="form-control" id="card_number" name="card_number" placeholder="XXXX-XXXX-XXXX-XXXX">
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-8">
                            <label for="expires_in">Expires in</label>
                            <input required type="text" class="form-control" id="expires_in" name="expires_in" placeholder="MM / YY">
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="cvv">CVV</label>
                            <input required type="text" class="form-control" id="cvv" name="cvv" placeholder="CVV" maxlength="3">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Reservation for <b><span class="room_hotel_name"></span></b></label>
                    </div>
                    <div class="form-group">
                        From: <input type="text" class="form-control datepick" id="arrive_date_modal" name="arrive_date_modal" readonly >
                    </div>
                    <div class="form-group">
                        To: <input type="text" class="form-control datepick" id="leave_date_modal" name="leave_date_modal" readonly >
                    </div>

                    <input hidden type="text" id="room_id_modal" name="room_id_modal">
                    <input hidden type="text" id="room_price_modal" name="room_price_modal">
                    <input hidden type="text" id="room_points_modal" name="room_points_modal">
                    <input hidden type="text" id="hotel_id_modal" name="hotel_id_modal">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Go back</button>
                    <button type="submit" name="pay" value="points" class="btn btn-success">Pay with points</button>
                    <button type="submit" name="pay" value="price" class="btn btn-primary">Pay</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/js/jquery.inputmask.bundle.js"></script>
<script src="/js/main.js" ></script>
