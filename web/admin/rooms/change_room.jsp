<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Edit room - Hotels</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Edit room</div>
                        <div class="card-body">
                            <form method="POST" action="/ChangeROom/${room_for_edit.getRoom_id()}">

                                <div class="form-group row">
                                    <label for="room_id" class="col-sm-4 col-form-label text-md-right">Room</label>
                                    <div class="col-md-6">
                                        <input id="room_id" type="text" class="form-control" name="room_id" readonly value="${room_for_edit.getRoom_id()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="hotel_id" class="col-sm-4 col-form-label text-md-right">Hotel</label>
                                    <div class="col-md-6">
                                        <input name="hotel_id" id="hotel_id" hidden value="${room_for_edit.getHotel_id()}" />
                                        <option class="form-control" readonly>${room_for_edit.getHotel()}</option>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="tip_id" class="col-sm-4 col-form-label text-md-right">Tip sobe</label>
                                    <div class="col-md-6">
                                        <select name="type_id" class="form-control" id="type_id">
                                            <c:forEach items="${types}" var="type">
                                                <c:choose>
                                                    <c:when test="${room_for_edit.getType_id().equals(tip.getType_id())}">
                                                        <option selected value="${type.getType_id()}">${type.getType()}</option>
                                                    </c:when>    
                                                    <c:otherwise>
                                                        <option value="${type.getType_id()}">${type.getType()}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="price" class="col-sm-4 col-form-label text-md-right">Price</label>
                                    <div class="col-md-6">
                                        <input id="price" type="text" class="form-control" name="price" required autofocus value="${room_for_edit.getPrice()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="points" class="col-sm-4 col-form-label text-md-right">Points</label>
                                    <div class="col-md-6">
                                        <input id="points" type="text" class="form-control" name="points" required autofocus value="${room_for_edit.getPoints()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="picture" class="col-sm-4 col-form-label text-md-right">Picture</label>
                                    <div class="col-md-6">
                                        <input id="picture" type="text" class="form-control" name="picture" required autofocus value="${room_for_edit.getPicture()}">
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" name="btn" value="save" class="btn btn-primary">
                                            Save
                                        </button>
                                        <a href="/admin/rooms">
                                            <button type="button" name="btn" value="cancel" class="btn btn-danger">
                                                Cancel
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/partials/footer.jsp" %>

    </body>
</html>