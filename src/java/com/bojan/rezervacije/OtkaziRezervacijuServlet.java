package com.bojan.rezervacije;

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

@WebServlet(name = "OtkaziRezervacijuServlet", urlPatterns = {"/OtkaziRezervacijuServlet/*"})
public class OtkaziRezervacijuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Korisnik korisnik = LoginDAO.loggedIn(request);

        if (korisnik != null) {
            Connection kon = ConnectionProvider.getCon();
            int rezervacija_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            try {

                PreparedStatement ps = kon.prepareStatement("DELETE FROM rezervacije WHERE rezervacija_id = ? AND korisnik_id = ?");
                ps.setInt(1, rezervacija_id);
                ps.setInt(2, korisnik.getKorisnik_id());
                ps.executeUpdate();

            } catch (SQLException ex) {
            }
        }

        response.sendRedirect("/rezervacije");
    }
}
