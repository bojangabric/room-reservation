package com.bojan.admin.hotel;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.ConnectionProvider;
import com.bojan.modeli.Hotel;
import com.bojan.modeli.Korisnik;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminHoteliServlet", urlPatterns = {"/admin/hoteli"})
public class HoteliServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);

        if (korisnik != null && (korisnik.getUloga().equals("admin") || korisnik.getUloga().equals("menadzer"))) {

            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;
            ArrayList<Hotel> hoteli = new ArrayList<>();

            try {
                if (korisnik.getUloga().equals("admin")) {
                    ps = kon.prepareStatement("SELECT * FROM hoteli");
                } else {
                    ps = kon.prepareStatement("SELECT * FROM hoteli h JOIN menadzeri m ON m.hotel_id = h.hotel_id WHERE m.korisnik_id = " + korisnik.getKorisnik_id());
                }

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {

                    Hotel h = new Hotel();
                    h.setHotel_id(rs.getInt("hotel_id"));
                    h.setNaziv(rs.getString("naziv"));
                    h.setAdresa(rs.getString("adresa"));
                    h.setGrad(rs.getString("grad"));
                    h.setDrzava(rs.getString("drzava"));
                    h.setOpis(rs.getString("opis"));
                    h.setZvezdice(rs.getInt("zvezdice"));
                    h.setSlika(rs.getString("slika"));

                    hoteli.add(h);
                }
            } catch (SQLException ex) {
            }

            request.getSession().setAttribute("hoteli", hoteli);
        }

        request.getRequestDispatcher("/admin/hoteli/hoteli.jsp").forward(request, response);
    }
}
