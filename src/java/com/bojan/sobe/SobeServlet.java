package com.bojan.sobe;

import com.bojan.baza.Sobe;
import com.bojan.modeli.Soba;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SobeServlet", urlPatterns = {"/hoteli/*"})
public class SobeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tip_sobe = request.getParameter("tip_sobe");
        int min_cena = 0;
        int max_cena = 500;
        if (request.getParameter("min_cena") != null) {
            min_cena = Integer.parseInt(request.getParameter("min_cena"));
        }
        if (request.getParameter("max_cena") != null) {
            max_cena = Integer.parseInt(request.getParameter("max_cena"));
        }

        int hotel_id = Integer.parseInt(request.getPathInfo().replace("/", ""));

        ArrayList<Soba> sobe = Sobe.UzmiSobe(hotel_id, min_cena, max_cena);

        if (tip_sobe != null) {
            Iterator<Soba> iter = sobe.iterator();
            while (iter.hasNext()) {
                Soba soba = iter.next();

                if (!soba.getTip().equals(tip_sobe)) {
                    iter.remove();
                }
            }
        }

        if (sobe.isEmpty()) {
            request.setAttribute("error", "Nema nijedne sobe koja odgovara odabranim opcijama.");
        }

        request.setAttribute("sobe", sobe);
        request.setAttribute("hotel_id", hotel_id);
        request.setAttribute("tipovi", Sobe.UzmiTipove(hotel_id));
        request.getRequestDispatcher("/sobe.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
