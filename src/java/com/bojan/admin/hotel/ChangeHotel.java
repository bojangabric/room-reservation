package com.bojan.admin.hotel;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.models.Hotel;
import com.bojan.models.User;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ChangeHotel", urlPatterns = {"/ChangeHotel/*"})
public class ChangeHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);

        if (user != null && (user.getRole().equals("admin") || user.getRole().equals("manager"))) {
 
            int hotel_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            Hotel h = new Hotel();
            try (Connection kon = ConnectionProvider.getCon()) {
                PreparedStatement ps = kon.prepareStatement("SELECT * FROM hotels WHERE hotel_id = ?");
                ps.setInt(1, hotel_id);

                ResultSet rs = ps.executeQuery();
                rs.next();

                h.setHotel_id(hotel_id);
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setCity(rs.getString("city"));
                h.setCountry(rs.getString("country"));
                h.setDescription(rs.getString("description"));
                h.setStars(Integer.parseInt(rs.getString("stars")));
                h.setPicture(rs.getString("picture"));

            } catch (SQLException ex) {
            }

            request.getSession().setAttribute("hotel_for_edit", h);
        }

        request.getRequestDispatcher("/admin/hotels/change_hotel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/hotels");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("UPDATE hotels SET name = ?, address = ?, city = ?, "
                        + "country = ?, description = ?, stars = ?, picture = ? "
                        + "WHERE hotel_id = ?");

                ps.setString(1, request.getParameter("name"));
                ps.setString(2, request.getParameter("address"));
                ps.setString(3, request.getParameter("city"));
                ps.setString(4, request.getParameter("country"));
                ps.setString(5, request.getParameter("description"));
                ps.setInt(6, Integer.parseInt(request.getParameter("stars")));
                ps.setString(7, request.getParameter("picture"));
                ps.setString(8, request.getParameter("hotel_id"));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/hotels");
        }
    }
}
