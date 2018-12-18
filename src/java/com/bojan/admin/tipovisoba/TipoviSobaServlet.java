package com.bojan.admin.tipovisoba;

import com.bojan.auth.LoginDAO;
import com.bojan.baza.TipoviSoba;
import com.bojan.models.Korisnik;
import com.bojan.models.TipSobe;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TipoviSobaServlet", urlPatterns = {"/admin/tipovisoba"})
public class TipoviSobaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik korisnik = LoginDAO.loggedIn(request);
        ArrayList<TipSobe> tipovi;

        if (korisnik != null && korisnik.getUloga().equals("admin")) {
            tipovi = TipoviSoba.UzmiTipove();
            request.getSession().setAttribute("tipovi", tipovi);
        }
        request.getRequestDispatcher("/admin/tipovisoba/tipovisoba.jsp").forward(request, response);
    }
}
