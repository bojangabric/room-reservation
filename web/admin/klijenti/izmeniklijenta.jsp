<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
    <head>

        <title>Izmena klijenta - Hoteli</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Izmena klijenta</div>
                        <div class="card-body">
                            <form method="POST" action="/IzmeniKlijenta/${klijent_za_izmenu.getKorisnik_id()}">

                                <div class="form-group row">
                                    <label for="korisnik_id" class="col-sm-4 col-form-label text-md-right">Korisnik ID</label>
                                    <div class="col-md-6">
                                        <input id="korisnik_id" type="text" class="form-control" name="korisnik_id" readonly value="${klijent_za_izmenu.getKorisnik_id()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="korisnicko_ime" class="col-sm-4 col-form-label text-md-right">Korisnicko ime</label>
                                    <div class="col-md-6">
                                        <input id="korisnicko_ime" type="text" class="form-control" name="korisnicko_ime" required autofocus value="${klijent_za_izmenu.getKorisnicko_ime()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="lozinka" class="col-sm-4 col-form-label text-md-right">Lozinka</label>
                                    <div class="col-md-6">
                                        <input id="lozinka" type="text" class="form-control" name="lozinka" required autofocus value="${klijent_za_izmenu.getLozinka()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="ime_prezime" class="col-sm-4 col-form-label text-md-right">Ime i prezime</label>
                                    <div class="col-md-6">
                                        <input id="ime_prezime" type="text" class="form-control" name="ime_prezime" required autofocus value="${klijent_za_izmenu.getIme_prezime()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email" class="col-sm-4 col-form-label text-md-right">Email adresa</label>
                                    <div class="col-md-6">
                                        <input id="email" type="email" class="form-control" name="email" required autofocus value="${klijent_za_izmenu.getEmail()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="telefon" class="col-sm-4 col-form-label text-md-right">Telefon</label>
                                    <div class="col-md-6">
                                        <input id="telefon" type="text" class="form-control" name="telefon" required autofocus value="${klijent_za_izmenu.getTelefon()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="adresa" class="col-sm-4 col-form-label text-md-right">Adresa</label>
                                    <div class="col-md-6">
                                        <input id="adresa" type="text" class="form-control" name="adresa" required autofocus value="${klijent_za_izmenu.getAdresa()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="grad" class="col-sm-4 col-form-label text-md-right">Grad</label>
                                    <div class="col-md-6">
                                        <input id="grad" type="text" class="form-control" name="grad" required autofocus value="${klijent_za_izmenu.getGrad()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="drzava" class="col-sm-4 col-form-label text-md-right">Drzava</label>
                                    <div class="col-md-6">
                                        <input id="drzava" type="text" class="form-control" name="drzava" required autofocus value="${klijent_za_izmenu.getDrzava()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="postanski_broj" class="col-sm-4 col-form-label text-md-right">Postanski broj</label>
                                    <div class="col-md-6">
                                        <input id="postanski_broj" type="text" class="form-control" name="postanski_broj" required autofocus value="${klijent_za_izmenu.getPostanski_broj()}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="uloga" class="col-md-4 col-form-label text-md-right">Uloga</label>
                                    <div class="col-md-6">
                                        <c:set var="uloge" value="korisnik,menadzer,admin" scope="application" />
                                        <select class="form-control" name="uloga" id="uloga">
                                            <c:forEach items="${fn:split(uloge, ',')}" var="uloga">
                                                <option value="${uloga}" ${klijent_za_izmenu.uloga.equals(uloga) ? 'selected' : ''}>${uloga}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row hoteli">
                                    <label for="hotel_id" class="col-sm-4 col-form-label text-md-right">Hotel</label>
                                    <div class="col-md-6">
                                        <select name="hotel_id" class="form-control" id="hotel_id">
                                            <c:forEach items="${hoteli}" var="hotel">
                                                <c:choose>
                                                    <c:when test="${hotel.getHotel_id().equals(menadzerov_hotel)}">
                                                        <option selected value="${hotel.getHotel_id()}">${hotel.getNaziv()}</option>
                                                    </c:when>    
                                                    <c:otherwise>
                                                        <option value="${hotel.getHotel_id()}">${hotel.getNaziv()}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="poeni" class="col-sm-4 col-form-label text-md-right">Poeni</label>
                                    <div class="col-md-6">
                                        <input id="poeni" type="text" class="form-control" name="poeni" required autofocus value="${klijent_za_izmenu.getPoeni()}">
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" name="btn" value="save" class="btn btn-primary">
                                            Sacuvaj
                                        </button>
                                        <a href="/admin/klijenti">
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
    <script>
        $(function () {
            
            if ($("#uloga").val() !== "menadzer") {
                $(".hoteli").attr("hidden", "");
            }
            
            $("#uloga").change(function () {
                if ($("#uloga").find(":selected").text() === "menadzer")
                    $(".hoteli").removeAttr("hidden");
                else
                    $(".hoteli").attr("hidden", "");
            });
        });

    </script>
</html>