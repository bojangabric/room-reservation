<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Sobe - Hoteli</title>
        <%@ include file="partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="partials/header.jsp" %>

        <div class = "container">
            <div class="row">
                <div class="col-lg-3 pt-4">
                    <form action="<c:out value="${hotel_id}"/>" method="get">
                        <span class="label">Tip sobe</span>
                        <div class="options pb-2 mt-2">         
                            <c:forEach items="${tipovi}" var = "tip">
                                <label class="custom-radio types">${tip}
                                    <input type="radio" name="tip_sobe" value="${tip}">
                                    <span class="checkmark"></span>
                                </label>
                            </c:forEach> 
                        </div>
                        <span class="label">Cena</span>
                        <div class="options mt-2 prices">
                            <label class="price_label">Min cena: <input class="mb-2 price_range" name="min_cena" type="number" step="50" min="0" max="500" value="0"></label><br>
                            <label class="price_label">Max cena: <input class="mb-3 price_range" name="max_cena" type="number" step="50" min="0" max="500" value="500"></label><br>
                        </div>
                        <button class="btn btn-primary mt-3" type="submit">Pretrazi</button>
                    </form>
                </div>

                <%@include file="partials/sobe.jsp" %>

            </div>
        </div>

        <%@include file="partials/footer.jsp" %>

    </body>
</html>    