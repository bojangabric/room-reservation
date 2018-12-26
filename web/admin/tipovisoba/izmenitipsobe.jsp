<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Izmena tipa sobe - Hoteli</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Izmena tipa sobe</div>
                        <div class="card-body">
                            <form method="POST" action="/IzmeniTip/${tip_za_izmenu.getTip_id()}">

                                <div class="form-group row">
                                    <label for="tip_id" class="col-sm-4 col-form-label text-md-right">Tip ID</label>
                                    <div class="col-md-6">
                                        <input id="tip_id" type="text" class="form-control" name="tip_id" required autofocus readonly value="${tip_za_izmenu.getTip_id()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="tip" class="col-sm-4 col-form-label text-md-right">Tip</label>
                                    <div class="col-md-6">
                                        <input id="tip" type="text" class="form-control" name="tip" required autofocus value="${tip_za_izmenu.getTip()}">
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" name="btn" value="save" class="btn btn-primary">
                                            Sacuvaj
                                        </button>
                                        <a href="/admin/tipovisoba">
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