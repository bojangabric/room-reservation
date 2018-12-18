package com.bojan.admin.sobe;

import com.bojan.auth.LoginDAO;
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
        ArrayList<Soba> sobe;

        if (korisnik != null && korisnik.getUloga().equals("admin")) {
            sobe = Sobe.UzmiSobe();
            request.getSession().setAttribute("sobe", sobe);
        }
        request.getRequestDispatcher("/admin/sobe/sobe.jsp").forward(request, response);
    }
}
