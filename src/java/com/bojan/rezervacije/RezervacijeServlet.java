package com.bojan.rezervacije;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.baza.Rezervacije;
import com.bojan.modeli.Korisnik;
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
            request.getSession().setAttribute("rezervacije", Rezervacije.UzmiRezervacije(korisnik.getKorisnik_id()));
        }

        request.getRequestDispatcher("rezervacije.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik k = (Korisnik) request.getSession().getAttribute("loggedInUser");

        if (k != null) {

            boolean valid = true;

            SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");

            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;

            db_call:
            try {
                ps = kon.prepareStatement("INSERT INTO rezervacije(korisnik_id, soba_id, datum_dolaska, datum_odlaska, novac, poeni) VALUES(?, ?, ?, ?, ?, ?)");
                ps.setInt(1, k.getKorisnik_id());
                ps.setInt(2, Integer.parseInt(request.getParameter("soba_id_modal")));

                java.util.Date d = f.parse(request.getParameter("datum_dolaska_modal"));
                long time = d.getTime();
                ps.setDate(3, new java.sql.Date(time));

                d = f.parse(request.getParameter("datum_odlaska_modal"));
                time = d.getTime();
                ps.setDate(4, new java.sql.Date(time));

                if (request.getParameter("plati").equals("novac")) {
                    ps.setInt(5, Integer.parseInt(request.getParameter("soba_cena_modal")));
                    ps.setInt(6, 0);
                } else if (k.getPoeni() >= Integer.parseInt(request.getParameter("soba_poeni_modal"))) {
                    k.setPoeni(k.getPoeni() - Integer.parseInt(request.getParameter("soba_poeni_modal")));

                    PreparedStatement ps2 = kon.prepareStatement("UPDATE korisnici SET poeni = ? WHERE korisnik_id = ?");
                    ps2.setInt(1, k.getPoeni());
                    ps2.setInt(2, k.getKorisnik_id());
                    ps2.executeUpdate();

                    ps.setInt(5, 0);
                    ps.setInt(6, Integer.parseInt(request.getParameter("soba_poeni_modal")));
                } else {
                    valid = false;
                    break db_call;
                }

                ps.executeUpdate();
            } catch (SQLException | ParseException ex) {
            }

            if (valid) {
                response.sendRedirect(request.getRequestURI());
            } else {
                request.setAttribute("result", "Nemate dovoljno poena.");
                request.getRequestDispatcher("/hoteli/" + Integer.parseInt(request.getParameter("hotel_id_modal"))).forward(request, response);
            }
        } else {
            response.sendRedirect("/login");
        }
    }
}
