package com.bojan.rezervacije;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.baza.Rezervacije;
import com.bojan.models.Korisnik;
import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        Korisnik k = (Korisnik) request.getSession().getAttribute("loggedInUser");
        SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");

        Connection kon = ConnectionProvider.getCon();
        PreparedStatement ps;

        try {
            ps = kon.prepareStatement("INSERT INTO rezervacije(korisnik_id, soba_id, datum_dolaska, datum_odlaska, novac, poeni) VALUES(?, ?, ?, ?, ?, ?)");
            ps.setInt(1, k.getKorisnikId());
            ps.setInt(2, Integer.parseInt(request.getParameter("soba_id_modal")));

            java.util.Date d = f.parse(request.getParameter("datum_dolaska_modal"));
            long time = d.getTime();
            ps.setDate(3, new java.sql.Date(time));

            d = f.parse(request.getParameter("datum_odlaska_modal"));
            time = d.getTime();
            ps.setDate(4, new java.sql.Date(time));

            if (request.getParameter("plati").equals("novac")) {
                ps.setInt(5, 150);
                ps.setInt(6, 0);
            } else {
                ps.setInt(5, 0);
                ps.setInt(6, 150);
            }
            
            ps.executeUpdate();
        } catch (SQLException | ParseException ex) {
        }

        request.getRequestDispatcher("/hoteli/1").forward(request, response);
    }
}
