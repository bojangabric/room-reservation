package com.bojan.admin.klijent;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.models.Korisnik;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "IzmeniKlijenta", urlPatterns = {"/IzmeniKlijenta/*"})
public class IzmeniKlijenta extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);

        if (korisnik != null && korisnik.getUloga().equals("admin")) {

            Connection kon = ConnectionProvider.getCon();
            int korisnik_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            Korisnik k = new Korisnik();
            try {
                PreparedStatement ps = kon.prepareStatement("SELECT * FROM korisnici WHERE korisnik_id = ?");
                ps.setInt(1, korisnik_id);

                ResultSet rs = ps.executeQuery();
                rs.next();

                k.setKorisnik_id(rs.getInt("korisnik_id"));
                k.setKorisnicko_ime(rs.getString("korisnicko_ime"));
                k.setLozinka(rs.getString("lozinka"));
                k.setIme_prezime(rs.getString("ime_prezime"));
                k.setEmail(rs.getString("email"));
                k.setTelefon(rs.getString("telefon"));
                k.setAdresa(rs.getString("adresa"));
                k.setGrad(rs.getString("grad"));
                k.setDrzava(rs.getString("drzava"));
                k.setPostanski_broj(rs.getInt("postanski_broj"));
                k.setUloga(rs.getString("uloga"));
                k.setPoeni(rs.getInt("poeni"));
            } catch (SQLException ex) {
            }

            request.getSession().setAttribute("klijent_za_izmenu", k);
        }

        request.getRequestDispatcher("/admin/klijenti/izmeniklijenta.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/klijenti/klijenti.jsp");
        } else {
            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;

            try {
                ps = kon.prepareStatement("UPDATE korisnici SET korisnicko_ime = ?, lozinka = ?, ime_prezime = ?,"
                        + "email = ?, telefon = ?, adresa = ?, grad = ?, drzava = ?, postanski_broj = ?, uloga = ?, poeni = ? "
                        + "WHERE korisnik_id = ?");

                ps.setString(1, request.getParameter("korisnicko_ime"));
                ps.setString(2, request.getParameter("lozinka"));
                ps.setString(3, request.getParameter("ime_prezime"));
                ps.setString(4, request.getParameter("email"));
                ps.setString(5, request.getParameter("telefon"));
                ps.setString(6, request.getParameter("adresa"));
                ps.setString(7, request.getParameter("grad"));
                ps.setString(8, request.getParameter("drzava"));
                ps.setInt(9, Integer.parseInt(request.getParameter("postanski_broj")));
                ps.setString(10, request.getParameter("uloga"));
                ps.setInt(11, Integer.parseInt(request.getParameter("poeni")));
                ps.setInt(12, Integer.parseInt(request.getParameter("korisnik_id")));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/klijenti");
        }
    }
}
