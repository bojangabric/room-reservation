package com.bojan.admin.sobe;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.baza.Hoteli;
import com.bojan.baza.TipoviSoba;
import com.bojan.modeli.Korisnik;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "KreirajSobu", urlPatterns = {"/KreirajSobu"})
public class KreirajSobu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik k = LoginDAO.loggedIn(request);
        
        if (k.getUloga().equals("menadzer")) {
            request.getSession().setAttribute("hotel", Hoteli.UzmiHotel(k.getKorisnik_id()));
        } else {
            request.getSession().setAttribute("hoteli", Hoteli.UzmiHotele());
        }

        request.getSession().setAttribute("tipovi", TipoviSoba.UzmiTipove());

        request.getRequestDispatcher("/admin/sobe/kreirajsobu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/sobe");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("INSERT INTO sobe(hotel_id, tip_id, cena, poeni, slika) "
                        + "values(?, ?, ?, ?, ?)");

                ps.setInt(1, Integer.parseInt(request.getParameter("hotel_id")));
                ps.setInt(2, Integer.parseInt(request.getParameter("tip_id")));
                ps.setInt(3, Integer.parseInt(request.getParameter("cena")));
                ps.setInt(4, Integer.parseInt(request.getParameter("poeni")));
                ps.setString(5, request.getParameter("slika"));

                ps.execute();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/sobe");
        }
    }
}
