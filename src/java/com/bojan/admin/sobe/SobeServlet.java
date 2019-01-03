package com.bojan.admin.sobe;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.Hoteli;
import com.bojan.baza.Sobe;
import com.bojan.models.Korisnik;
import com.bojan.models.Soba;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SobeServletAdmin", urlPatterns = {"/admin/sobe"})
public class SobeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);
        ArrayList<Soba> sobe = null;

        if (korisnik != null) {
            if (korisnik.getUloga().equals("admin")) {
                sobe = Sobe.UzmiSobe();
            } else if (korisnik.getUloga().equals("menadzer")) {
                int hotel_id = Hoteli.UzmiHotele("SELECT * FROM hoteli h JOIN menadzeri m ON m.hotel_id = h.hotel_id WHERE m.korisnik_id = " + korisnik.getKorisnik_id()).get(0).getHotel_id();
                sobe = Sobe.UzmiSobe(hotel_id);
            }
            
            request.getSession().setAttribute("sobe", sobe);
        }
        request.getRequestDispatcher("/admin/sobe/sobe.jsp").forward(request, response);
    }
}
