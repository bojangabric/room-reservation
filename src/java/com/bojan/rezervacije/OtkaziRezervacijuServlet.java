package com.bojan.rezervacije;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.modeli.Korisnik;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "OtkaziRezervacijuServlet", urlPatterns = {"/OtkaziRezervacijuServlet/*"})
public class OtkaziRezervacijuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);

        if (korisnik != null) {
            int rezervacija_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            try (Connection kon = ConnectionProvider.getCon()) {

                PreparedStatement ps2 = kon.prepareStatement("UPDATE korisnici k "
                        + "JOIN rezervacije r on r.korisnik_id = k.korisnik_id "
                        + "SET k.poeni = "
                        + "IF ((SELECT poeni FROM rezervacije r1 WHERE r1.rezervacija_id = ?) > 0, k.poeni + (SELECT poeni FROM rezervacije r1 WHERE r1.rezervacija_id = ?), k.poeni - 10) "
                        + "WHERE r.rezervacija_id = ? AND k.korisnik_id = ?");
                ps2.setInt(1, rezervacija_id);
                ps2.setInt(2, rezervacija_id);
                ps2.setInt(3, rezervacija_id);
                ps2.setInt(4, korisnik.getKorisnik_id());
                ps2.executeUpdate();

                PreparedStatement ps = kon.prepareStatement("DELETE FROM rezervacije WHERE rezervacija_id = ? AND korisnik_id = ?");
                ps.setInt(1, rezervacija_id);
                ps.setInt(2, korisnik.getKorisnik_id());
                ps.executeUpdate();

                PreparedStatement ps3 = kon.prepareStatement("SELECT poeni FROM korisnici WHERE korisnik_id = ?");
                ps3.setInt(1, korisnik.getKorisnik_id());
                ResultSet rs = ps3.executeQuery();
                rs.next();
                korisnik.setPoeni(rs.getInt("poeni"));
            } catch (SQLException ex) {
            }
        }

        response.sendRedirect("/rezervacije");
    }
}
