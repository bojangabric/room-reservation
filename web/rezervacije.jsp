<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <title>Rezervacije - Hoteli</title>
    <%@ include file="partials/metadata.jsp" %>
  </head>
  <body>
    <%@include file="partials/header.jsp" %>

    <div class="container">
      <div class="flex-row">
        <div class="pt-4">
          <table class="table table-bordered table-hover" align="center">
            <thead>
              <th>Rezervacija ID</th>
              <th>Korisnik ID</th>
              <th>Soba ID</th>
              <th>Datum dolaska</th>
              <th>Datum odlaska</th>
              <th>Novac</th>
              <th>Poeni</th>
            </thead>

            <c:forEach items="${rezervacije}" var="rezervacija">
              <tr>
                <td class="align-middle">${rezervacija.getRezervacija_id()}</td>
                <td class="align-middle">${rezervacija.getKorisnik_id()}</td>
                <td class="align-middle">${rezervacija.getSoba_id()}</td>
                <td class="align-middle">${rezervacija.getDatum_dolaska()}</td>
                <td class="align-middle">${rezervacija.getDatum_odlaska()}</td>
                <td class="align-middle">${rezervacija.getNovac()}</td>
                <td class="align-middle">${rezervacija.getPoeni()}</td>
                <td alig="center">
                  <a
                    href="/OtkaziRezervacijuServlet/${rezervacija.getRezervacija_id()}"
                  >
                    <button class="btn btn-danger btn-sm">Otkazi</button>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </table>
          <c:if test="${empty rezervacije}">
            <tr> <td>Nemate nijednu rezervaciju.</td> </tr>
          </c:if>
        </div>
      </div>
    </div>

    <%@include file="partials/footer.jsp" %>
  </body>
</html>
