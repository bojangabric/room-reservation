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
                        <div class="card-header">Kreiraj hotela</div>
                        <div class="card-body">
                            <form method="POST" action="/KreirajHotel">

                                <div class="form-group row">
                                    <label for="naziv" class="col-sm-4 col-form-label text-md-right">Naziv</label>
                                    <div class="col-md-6">
                                        <input id="naziv" type="text" class="form-control" name="naziv" required autofocus>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="adresa" class="col-sm-4 col-form-label text-md-right">Adresa</label>
                                    <div class="col-md-6">
                                        <input id="adresa" type="text" class="form-control" name="adresa" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="grad" class="col-sm-4 col-form-label text-md-right">Grad</label>
                                    <div class="col-md-6">
                                        <input id="grad" type="text" class="form-control" name="grad" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="drzava" class="col-sm-4 col-form-label text-md-right">Drzava</label>
                                    <div class="col-md-6">
                                        <input id="drzava" type="text" class="form-control" name="drzava" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="opis" class="col-sm-4 col-form-label text-md-right">Opis</label>
                                    <div class="col-md-6">
                                        <input id="opis" type="text" class="form-control" name="opis" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="zvezdice" class="col-sm-4 col-form-label text-md-right">Zvezdice</label>
                                    <div class="col-md-6">
                                        <input id="zvezdice" type="text" class="form-control" name="zvezdice" required autofocus>
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
                                        <a href="/admin/hoteli">
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