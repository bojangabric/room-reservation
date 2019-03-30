package com.bojan.admin.hotel;

import com.bojan.database.ConnectionProvider;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CreateHotel", urlPatterns = {"/CreateHotel"})
public class CreateHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/hotels/create_hotel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/hotels");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("INSERT INTO hotels(name, address, city, "
                        + "country, description, stars, picture) "
                        + "values(?, ?, ?, ?, ?, ?, ?)");

                ps.setString(1, request.getParameter("name"));
                ps.setString(2, request.getParameter("address"));
                ps.setString(3, request.getParameter("city"));
                ps.setString(4, request.getParameter("country"));
                ps.setString(5, request.getParameter("description"));
                ps.setInt(6, Integer.parseInt(request.getParameter("stars")));
                ps.setString(7, request.getParameter("picture"));

                ps.execute();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/hotels");
        }
    }
}
