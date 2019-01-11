<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Izmena sobe - Hoteli</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Izmena sobe</div>
                        <div class="card-body">
                            <form method="POST" action="/IzmeniSobu/${soba_za_izmenu.getSoba_id()}">

                                <div class="form-group row">
                                    <label for="soba_id" class="col-sm-4 col-form-label text-md-right">Soba</label>
                                    <div class="col-md-6">
                                        <input id="soba_id" type="text" class="form-control" name="soba_id" readonly value="${soba_za_izmenu.getSoba_id()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="hotel_id" class="col-sm-4 col-form-label text-md-right">Hotel</label>
                                    <div class="col-md-6">
                                        <input name="hotel_id" id="hotel_id" hidden value="${soba_za_izmenu.getHotel_id()}" />
                                        <option class="form-control" readonly>${soba_za_izmenu.getHotel()}</option>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="tip_id" class="col-sm-4 col-form-label text-md-right">Tip sobe</label>
                                    <div class="col-md-6">
                                        <select name="tip_id" class="form-control" id="tip_id">
                                            <c:forEach items="${tipovi}" var="tip">
                                                <c:choose>
                                                    <c:when test="${soba_za_izmenu.getTip_id().equals(tip.getTip_id())}">
                                                        <option selected value="${tip.getTip_id()}">${tip.getTip()}</option>
                                                    </c:when>    
                                                    <c:otherwise>
                                                        <option value="${tip.getTip_id()}">${tip.getTip()}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="cena" class="col-sm-4 col-form-label text-md-right">Cena</label>
                                    <div class="col-md-6">
                                        <input id="cena" type="text" class="form-control" name="cena" required autofocus value="${soba_za_izmenu.getCena()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="poeni" class="col-sm-4 col-form-label text-md-right">Poeni</label>
                                    <div class="col-md-6">
                                        <input id="poeni" type="text" class="form-control" name="poeni" required autofocus value="${soba_za_izmenu.getPoeni()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="slika" class="col-sm-4 col-form-label text-md-right">Slika</label>
                                    <div class="col-md-6">
                                        <input id="slika" type="text" class="form-control" name="slika" required autofocus value="${soba_za_izmenu.getSlika()}">
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" name="btn" value="save" class="btn btn-primary">
                                            Sacuvaj
                                        </button>
                                        <a href="/admin/sobe">
                                            <button type="button" name="btn" value="cancel" class="btn btn-danger">
                                                Prekini
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