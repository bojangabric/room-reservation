package com.bojan.admin.hotel;

import com.bojan.baza.ConnectionProvider;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "KreirajHotel", urlPatterns = {"/KreirajHotel"})
public class KreirajHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/hoteli/kreirajhotel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/hoteli");
        } else {
            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;

            try {
                ps = kon.prepareStatement("INSERT INTO hoteli(naziv, adresa, grad, "
                        + "drzava, opis, zvezdice, slika) "
                        + "values(?, ?, ?, ?, ?, ?, ?)");

                ps.setString(1, request.getParameter("naziv"));
                ps.setString(2, request.getParameter("adresa"));
                ps.setString(3, request.getParameter("grad"));
                ps.setString(4, request.getParameter("drzava"));
                ps.setString(5, request.getParameter("opis"));
                ps.setInt(6, Integer.parseInt(request.getParameter("zvezdice")));
                ps.setString(7, request.getParameter("slika"));

                ps.execute();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/hoteli");
        }
    }
}
