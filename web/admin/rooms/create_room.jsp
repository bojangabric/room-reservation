<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Create room - Hotels</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">New room</div>
                        <div class="card-body">
                            <form method="POST" action="/CreateRoom">

                                <c:choose>
                                    <c:when test="${not empty hotel}">
                                        <div class="form-group row">
                                            <label for="hotel_id" class="col-md-4 col-form-label text-md-right">Hotel</label>
                                            <div class="col-md-6">
                                                <input name="hotel_id" id="hotel_id" hidden value="${hotel.getHotel_id()}" />
                                                <option class="form-control" readonly>${hotel.getName()}</option>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise> 
                                        <div class="form-group row">
                                            <label for="hotel_id" class="col-md-4 col-form-label text-md-right">Hotel</label>
                                            <div class="col-md-6">
                                                <select name="hotel_id" class="form-control" id="hotel_id">
                                                    <c:forEach items="${hotels}" var="hotel">
                                                        <option value="${hotel.getHotel_id()}">${hotel.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <div class="form-group row">
                                    <label for="type_id" class="col-sm-4 col-form-label text-md-right">Type</label>
                                    <div class="col-md-6">
                                        <select name="type_id" class="form-control" id="type_id">
                                            <c:forEach items="${types}" var="type">
                                                <option value="${type.getType_id()}">${type.getType()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="price" class="col-sm-4 col-form-label text-md-right">Price</label>
                                    <div class="col-md-6">
                                        <input id="price" type="text" class="form-control" name="price" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="points" class="col-sm-4 col-form-label text-md-right">Points</label>
                                    <div class="col-md-6">
                                        <input id="points" type="text" class="form-control" name="points" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="picture" class="col-sm-4 col-form-label text-md-right">Picture</label>
                                    <div class="col-md-6">
                                        <input id="picture" type="text" class="form-control" name="picture" required autofocus>
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