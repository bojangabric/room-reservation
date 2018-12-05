<%-- 
    Document   : Test
    Created on : Nov 25, 2018, 4:06:13 PM
    Author     : bojan
--%>

<%@page import="com.bojan.models.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="title">
        Hoteli
    </jsp:attribute>

    <jsp:body>
        <div class="container">
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

                        <span class="label">Cena</span>
                        <div class="options mt-2 prices">
                            <label class="price_label">Min cena: <input class="mb-2 price_range" name="min_cena" type="number" step="50" min="0" max="500" value="0"></label><br>
                            <label class="price_label">Max cena: <input class="mb-3 price_range" name="max_cena" type="number" step="50" min="0" max="500" value="500"></label><br>
                        </div>

                        <span class="label">Lokacija</span>
                        <%@include file="partials/gradovi.jsp" %>

                        <button class="btn btn-primary mt-3" type="submit">Pretrazi</button>
                    </form>
                </div>

                <%@include file="partials/hoteli.jsp" %>

            </div>
        </div>
    </jsp:body>

</t:genericpage>    