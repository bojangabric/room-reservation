package com.bojan.admin.hotel;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.models.Hotel;
import com.bojan.models.Korisnik;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "IzmeniHotel", urlPatterns = {"/IzmeniHotel/*"})
public class IzmeniHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);

        if (korisnik != null && korisnik.getUloga().equals("admin")) {

            Connection kon = ConnectionProvider.getCon();
            int hotel_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            Hotel h = new Hotel();
            try {
                PreparedStatement ps = kon.prepareStatement("SELECT * FROM hoteli WHERE hotel_id = ?");
                ps.setInt(1, hotel_id);

                ResultSet rs = ps.executeQuery();
                rs.next();

                h.setHotel_id(hotel_id);
                h.setNaziv(rs.getString("naziv"));
                h.setAdresa(rs.getString("adresa"));
                h.setGrad(rs.getString("grad"));
                h.setDrzava(rs.getString("drzava"));
                h.setOpis(rs.getString("opis"));
                h.setZvezdice(Integer.parseInt(rs.getString("zvezdice")));
                h.setSlika(rs.getString("slika"));

            } catch (SQLException ex) {
            }

            request.getSession().setAttribute("hotel_za_izmenu", h);
        }

        request.getRequestDispatcher("/admin/izmenihotel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/hoteli.jsp");
        } else {
            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;

            try {
                ps = kon.prepareStatement("UPDATE hoteli SET naziv = ?, adresa = ?, grad = ?, "
                        + "drzava = ?, opis = ?, zvezdice = ?, slika = ? "
                        + "WHERE hotel_id = ?");

                ps.setString(1, request.getParameter("naziv"));
                ps.setString(2, request.getParameter("adresa"));
                ps.setString(3, request.getParameter("grad"));
                ps.setString(4, request.getParameter("drzava"));
                ps.setString(5, request.getParameter("opis"));
                ps.setInt(6, Integer.parseInt(request.getParameter("zvezdice")));
                ps.setString(7, request.getParameter("slika"));
                ps.setString(8, request.getParameter("hotel_id"));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/hoteli");
        }
    }
}
