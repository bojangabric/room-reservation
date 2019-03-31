package com.bojan.hotels;

import com.bojan.database.Hotels;
import com.bojan.models.Hotel;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HotelsServlet", urlPatterns = {"/hotels"})
public class HotelsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String query = "SELECT * FROM hotels ";

        int zvezdice = (request.getParameter("stars") != null) ? Integer.parseInt(request.getParameter("stars")) : 0;
        String grad = (request.getParameter("city") != null) ? request.getParameter("city") : "";

        if (!grad.equals("")) {
            query += "WHERE city = \"" + grad + "\" ";
        }

        if (zvezdice != 0 && !grad.equals("")) {
            query += "AND stars = " + zvezdice;
        } else if (zvezdice != 0) {
            query += "WHERE stars = " + zvezdice;
        }

        ArrayList<Hotel> hotels = Hotels.GetHotels(query);

        if (hotels.isEmpty()) {
            request.setAttribute("error", "There are no hotels with the selected options.");
        }
        
        request.setAttribute("hotels", hotels);
        request.getRequestDispatcher("hotels.jsp").forward(request, response);
    }
}
