<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Klijenti - Hoteli</title>
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container col-12">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-bordered table-hover" align="center">
                        <thead>
                        <th>Korisnik ID</th> 
                        <th>Korisnicko ime</th>
                        <th>Lozinka</th>
                        <th>Ime i prezime</th>
                        <th>Email</th>
                        <th>Telefon</th>
                        <th>Adresa</th>
                        <th>Grad</th>
                        <th>Drzava</th>
                        <th>Postanski broj</th>
                        <th>Uloga</th>
                        <th>Poeni</th>
                        </thead>
                        <c:forEach items="${klijenti}" var="klijent">
                            <tr>
                                <td class="align-middle">${klijent.getKorisnik_id()}</td>
                                <td class="align-middle">${klijent.getKorisnicko_ime()}</td> 
                                <td class="align-middle">${klijent.getLozinka()}</td> 
                                <td class="align-middle">${klijent.getIme_prezime()}</td>
                                <td class="align-middle">${klijent.getEmail()}</td> 
                                <td class="align-middle">${klijent.getTelefon()}</td>
                                <td class="align-middle">${klijent.getAdresa()}</td>
                                <td class="align-middle">${klijent.getGrad()}</td>
                                <td class="align-middle">${klijent.getDrzava()}</td>
                                <td class="align-middle">${klijent.getPostanski_broj()}</td>
                                <td class="align-middle">${klijent.getUloga()}</td>
                                <td class="align-middle">${klijent.getPoeni()}</td>    
                                <td alig="center">
                                    <a href="/IzmeniKlijenta/${klijent.getKorisnik_id()}">
                                        <button class="btn btn-success btn-sm">Izmeni</button>
                                    </a>
                                </td>
                                <td alig="center">
                                    <a href="/ObrisiKlijenta/${klijent.getKorisnik_id()}">
                                        <button class="btn btn-danger btn-sm">Obrisi</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <%@include file="/partials/footer.jsp" %>

    </body>
</html>