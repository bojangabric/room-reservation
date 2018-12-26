package com.bojan.admin.sobe;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.baza.Sobe;
import com.bojan.baza.TipoviSoba;
import com.bojan.models.Korisnik;
import com.bojan.models.Soba;
import com.bojan.models.TipSobe;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "IzmeniSobu", urlPatterns = {"/IzmeniSobu/*"})
public class IzmeniSobu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);
        if (korisnik != null && korisnik.getUloga().equals("admin")) {

            Soba s = Sobe.UzmiSobu(Integer.parseInt(request.getPathInfo().replace("/", "")));
            ArrayList<TipSobe> tipovi = TipoviSoba.UzmiTipove();
            
            request.getSession().setAttribute("tipovi", tipovi);
            request.getSession().setAttribute("soba_za_izmenu", s);
        }

        request.getRequestDispatcher("/admin/sobe/izmenisobu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/sobe");
        } else {
            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;

            try {
                ps = kon.prepareStatement("UPDATE sobe SET hotel_id = ?, tip_id = ?, cena = ?, poeni = ?, slika = ? "
                        + "WHERE soba_id = ?");

                ps.setInt(1, Integer.parseInt(request.getParameter("hotel_id")));
                ps.setInt(2, Integer.parseInt(request.getParameter("tip_id")));
                ps.setInt(3, Integer.parseInt(request.getParameter("cena")));
                ps.setInt(4, Integer.parseInt(request.getParameter("poeni")));
                ps.setString(5, request.getParameter("slika"));
                ps.setInt(6, Integer.parseInt(request.getParameter("soba_id")));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/sobe");
        }
    }
}
