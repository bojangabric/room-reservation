/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.sobe;

import com.bojan.baza.Sobe;
import com.bojan.models.Soba;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bojan
 */
@WebServlet(name = "SobeServlet", urlPatterns = {"/hoteli/*"})
public class SobeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int min_cena = 0;
        int max_cena = 500;
        if (request.getParameter("min_cena") != null) {
            min_cena = Integer.parseInt(request.getParameter("min_cena"));
        }
        if (request.getParameter("max_cena") != null) {
            max_cena = Integer.parseInt(request.getParameter("max_cena"));
        }

        int hotel_id = Integer.parseInt(request.getPathInfo().replace("/", ""));

        request.setAttribute("sobe", Sobe.UzmiSobe(hotel_id, min_cena, max_cena));
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
