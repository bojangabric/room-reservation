package com.bojan.hoteli;

import com.bojan.baza.Hoteli;
import com.bojan.models.Hotel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bojan
 */
@WebServlet(name = "HoteliServlet", urlPatterns = {"/hoteli"})
public class HoteliServlet extends HttpServlet {

    /*      
        Comparator<Soba> comp = Comparator.comparing(Soba::getCena);
        return Collections.min(Sobe.UzmiSobe(hotel_id), comp).getCena();
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = "SELECT * FROM hoteli ";

        int zvezdice = (request.getParameter("zvezdice") != null) ? Integer.parseInt(request.getParameter("zvezdice")) : 0;
        String grad = (request.getParameter("grad") != null) ? request.getParameter("grad") : "";

        if (!grad.equals("")) {
            query += "WHERE grad = \"" + grad + "\" ";
        }

        if (zvezdice != 0 && !grad.equals("")) {
            query += "AND zvezdice = " + zvezdice;
        } else if (zvezdice != 0) {
            query += "WHERE zvezdice = " + zvezdice;
        }

        ArrayList<Hotel> hoteli = Hoteli.UzmiHotele(query);      
        
        request.setAttribute("hoteli", hoteli);
        request.getRequestDispatcher("hoteli.jsp").forward(request, response);
    }
}
