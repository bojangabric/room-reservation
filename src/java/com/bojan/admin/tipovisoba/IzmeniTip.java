package com.bojan.admin.tipovisoba;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.baza.TipoviSoba;
import com.bojan.models.Korisnik;
import com.bojan.models.TipSobe;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "IzmeniTip", urlPatterns = {"/IzmeniTip/*"})
public class IzmeniTip extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);
        if (korisnik != null && korisnik.getUloga().equals("admin")) {

            TipSobe s = TipoviSoba.UzmiTip(Integer.parseInt(request.getPathInfo().replace("/", "")));
            request.getSession().setAttribute("tip_za_izmenu", s);
        }

        request.getRequestDispatcher("/admin/tipovisoba/izmenitipsobe.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/tipovisoba");
        } else {
            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;

            try {
                ps = kon.prepareStatement("UPDATE tipovi_soba SET tip = ? WHERE tip_id = ?");

                ps.setString(1, request.getParameter("tip"));
                ps.setInt(2, Integer.parseInt(request.getParameter("tip_id")));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/tipovisoba");
        }
    }
}
