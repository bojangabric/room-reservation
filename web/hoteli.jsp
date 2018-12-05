<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Hoteli</title>
        <%@ include file="partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="partials/header.jsp" %>

        <div class = "container">
            <div class="row">
                <div class="col-lg-3 pt-4">
                    <form action="" method="get">
                        <span class="label">Zvezdice</span>
                        <div class="options pb-2 mt-2">
                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                    class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="zvezdice" value="5">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                    class="fa fa-star"></i>
                                <input type="radio" name="zvezdice" value="4">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="zvezdice" value="3">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="zvezdice" value="2">
                                <span class="checkmark"></span>
                            </label>
                        </div>

                        <span class="label">Lokacija</span>

                        <%@include file="partials/gradovi.jsp" %>

                        <button class="btn btn-primary mt-3" type="submit">Pretrazi</button>
                    </form>
                </div>

                <%@include file="partials/hoteli.jsp" %>

            </div>
        </div>

        <%@include file="partials/footer.jsp" %>

    </body>
</html>