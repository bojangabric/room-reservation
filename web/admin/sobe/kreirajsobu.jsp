<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Kreiranje hotela - Hoteli</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Kreiraj sobu</div>
                        <div class="card-body">
                            <form method="POST" action="/KreirajSobu">

                                <div class="form-group row">
                                    <label for="hotel_id" class="col-sm-4 col-form-label text-md-right">Hotel ID</label>
                                    <div class="col-md-6">
                                        <input id="hotel_id" type="text" class="form-control" name="hotel_id" required autofocus>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="tip_id" class="col-sm-4 col-form-label text-md-right">Tip ID</label>
                                    <div class="col-md-6">
                                        <input id="tip_id" type="text" class="form-control" name="tip_id" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="cena" class="col-sm-4 col-form-label text-md-right">Cena</label>
                                    <div class="col-md-6">
                                        <input id="cena" type="text" class="form-control" name="cena" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="poeni" class="col-sm-4 col-form-label text-md-right">Poeni</label>
                                    <div class="col-md-6">
                                        <input id="poeni" type="text" class="form-control" name="poeni" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="slika" class="col-sm-4 col-form-label text-md-right">Slika</label>
                                    <div class="col-md-6">
                                        <input id="slika" type="text" class="form-control" name="slika" required autofocus>
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