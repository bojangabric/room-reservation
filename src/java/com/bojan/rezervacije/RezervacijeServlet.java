package com.bojan.rezervacije;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.baza.Rezervacije;
import com.bojan.models.Korisnik;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bojan
 */
@WebServlet(name = "RezervacijeServlet", urlPatterns = {"/rezervacije"})
public class RezervacijeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);
        if (korisnik != null) {
            request.getSession().setAttribute("rezervacije", Rezervacije.UzmiRezervacije(korisnik.getKorisnikId()));
        }

        request.getRequestDispatcher("rezervacije.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection kon = ConnectionProvider.getCon();
        PreparedStatement ps;
     
        try {
            ps = kon.prepareStatement("SELECT DISTINCT grad FROM hoteli");
            ResultSet rs = ps.executeQuery();
        } catch (SQLException ex) {
        }
    }
}
