package com.bojan.admin.hotel;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.models.Korisnik;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ObrisiHotel", urlPatterns = {"/ObrisiHotel/*"})
public class ObrisiHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);

        if (korisnik != null && korisnik.getUloga().equals("admin")) {

            Connection kon = ConnectionProvider.getCon();
            int hotel_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            try {
                PreparedStatement ps = kon.prepareStatement("DELETE FROM hoteli WHERE hotel_id = ?");
                ps.setInt(1, hotel_id);
                ps.execute();
            } catch (SQLException ex) {
            }
        }

        response.sendRedirect("/admin/hoteli");
    }

}
