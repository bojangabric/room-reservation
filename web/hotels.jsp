<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Hotels</title>
        <%@ include file="partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="partials/header.jsp" %>

        <div class = "container">
            <div class="row">
                <div class="col-lg-3 pt-4">
                    <form action="" method="get" class="hotels-form p-4">
                        <span class="label">Stars</span>
                        <div class="options pb-2 mt-2">
                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                    class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="stars" value="5">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                    class="fa fa-star"></i>
                                <input type="radio" name="stars" value="4">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="stars" value="3">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="stars" value="2">
                                <span class="checkmark"></span>
                            </label>
                        </div>

                        <span class="label">Location</span>

                        <%@include file="partials/cities.jsp" %>

                        <button class="btn btn-primary mt-3" type="submit">Search</button>
                    </form>
                </div>

                <%@include file="partials/hotels.jsp" %>

            </div>
        </div>

        <%@include file="partials/footer.jsp" %>

    </body>
</html>