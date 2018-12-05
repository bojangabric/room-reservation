<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Kontakt - Hoteli</title>
        <%@ include file="partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 mt-3">
                    <div class="card">
                        <div class="card-header">Kontakt</div>

                        <div class="card-body">
                            <form method="POST">
                                <div class="form-group row">
                                    <label for="ime" class="col-sm-4 col-form-label text-md-right">Ime</label>
                                    <div class="col-md-6">
                                        <input id="ime" type="text" class="form-control" name="ime" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="prezime" class="col-sm-4 col-form-label text-md-right">Prezime</label>
                                    <div class="col-md-6">
                                        <input id="prezime" type="text" class="form-control" name="prezime" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="zemlja" class="col-md-4 col-form-label text-md-right">Zemlja</label>
                                    <div class="col-md-6">
                                        <select name="zemlja" class="form-control" id="zemlja">
                                            <option value="srbija">Srbija</option>
                                            <option value="francuska">Francuska</option>
                                            <option value="nemacka">Nemacka</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="poruka" class="col-md-4 col-form-label text-md-right">Poruka</label>
                                    <div class="col-md-6">
                                        <textarea id="poruka" class="form-control" name="poruka" rows="8" required></textarea>
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            Posalji
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="partials/footer.jsp" %>

    </body>
</html>