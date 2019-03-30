<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
    <head>

        <title>Change client - Hotels</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Change client info</div>
                        <div class="card-body">
                            <form method="POST" action="/ChangeClient/${client_for_edit.getUser_id()}">

                                <div class="form-group row">
                                    <label for="user_id" class="col-sm-4 col-form-label text-md-right">User ID</label>
                                    <div class="col-md-6">
                                        <input id="user_id" type="text" class="form-control" name="user_id" readonly value="${client_for_edit.getUser_id()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="username" class="col-sm-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input id="username" type="text" class="form-control" name="username" required autofocus value="${client_for_edit.getUsername()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="password" class="col-sm-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input id="password" type="text" class="form-control" name="password" required autofocus value="${client_for_edit.getPassword()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input id="name" type="text" class="form-control" name="name" required autofocus value="${client_for_edit.getName()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email" class="col-sm-4 col-form-label text-md-right">Email address</label>
                                    <div class="col-md-6">
                                        <input id="email" type="email" class="form-control" name="email" required autofocus value="${client_for_edit.getEmail()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone" class="col-sm-4 col-form-label text-md-right">Phone</label>
                                    <div class="col-md-6">
                                        <input id="phone" type="text" class="form-control" name="phone" required autofocus value="${client_for_edit.getPhone()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="address" class="col-sm-4 col-form-label text-md-right">Address</label>
                                    <div class="col-md-6">
                                        <input id="address" type="text" class="form-control" name="address" required autofocus value="${client_for_edit.getAddress()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="city" class="col-sm-4 col-form-label text-md-right">City</label>
                                    <div class="col-md-6">
                                        <input id="city" type="text" class="form-control" name="city" required autofocus value="${client_for_edit.getCity()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="country" class="col-sm-4 col-form-label text-md-right">Country</label>
                                    <div class="col-md-6">
                                        <input id="country" type="text" class="form-control" name="country" required autofocus value="${client_for_edit.getCountry()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="postcode" class="col-sm-4 col-form-label text-md-right">Postcode</label>
                                    <div class="col-md-6">
                                        <input id="postcode" type="text" class="form-control" name="postcode" required autofocus value="${client_for_edit.getPostcode()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="role" class="col-md-4 col-form-label text-md-right">Role</label>
                                    <div class="col-md-6">
                                        <c:set var="roles" value="client,manager,admin" scope="application" />
                                        <select class="form-control" name="role" id="role">
                                            <c:forEach items="${fn:split(roles, ',')}" var="role">
                                                <option value="${role}" ${client_for_edit.getRole().equals(role) ? 'selected' : ''}>${role}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row hotels">
                                    <label for="hotel_id" class="col-sm-4 col-form-label text-md-right">Hotel</label>
                                    <div class="col-md-6">
                                        <select name="hotel_id" class="form-control" id="hotel_id">
                                            <c:forEach items="${hotels}" var="hotel">
                                                <c:choose>
                                                    <c:when test="${hotel.getHotel_id().equals(manager_hotel)}">
                                                        <option selected value="${hotel.getHotel_id()}">${hotel.getName()}</option>
                                                    </c:when>    
                                                    <c:otherwise>
                                                        <option value="${hotel.getHotel_id()}">${hotel.getName()}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="points" class="col-sm-4 col-form-label text-md-right">Points</label>
                                    <div class="col-md-6">
                                        <input id="points" type="text" class="form-control" name="points" required autofocus value="${client_for_edit.getPoints()}">
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" name="btn" value="save" class="btn btn-primary">
                                            Save
                                        </button>
                                        <a href="/admin/clients">
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
    <script>
        $(function () {

            if ($("#role").val() !== "manager") {
                $(".hotels").attr("hidden", "");
            }

            $("#role").change(function () {
                if ($("#role").find(":selected").text() === "manager")
                    $(".hotels").removeAttr("hidden");
                else
                    $(".hotels").attr("hidden", "");
            });
        });
    </script>
</html>