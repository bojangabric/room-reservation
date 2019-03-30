package com.bojan.admin.hotel;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.models.Hotel;
import com.bojan.models.User;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminHotelsServlet", urlPatterns = {"/admin/hotels"})
public class HotelsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);

        if (user != null && (user.getRole().equals("admin") || user.getRole().equals("manager"))) {

            PreparedStatement ps;
            ArrayList<Hotel> hotels = new ArrayList<>();

            try (Connection kon = ConnectionProvider.getCon()) {
                if (user.getRole().equals("admin")) {
                    ps = kon.prepareStatement("SELECT * FROM hotels");
                } else {
                    ps = kon.prepareStatement("SELECT * FROM hotels h JOIN managers m ON m.hotel_id = h.hotel_id WHERE m.user_id = " + user.getUser_id());
                }

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {

                    Hotel h = new Hotel();
                    h.setHotel_id(rs.getInt("hotel_id"));
                    h.setName(rs.getString("name"));
                    h.setAddress(rs.getString("address"));
                    h.setCity(rs.getString("city"));
                    h.setCountry(rs.getString("country"));
                    h.setDescription(rs.getString("description"));
                    h.setStars(rs.getInt("stars"));
                    h.setPicture(rs.getString("picture"));

                    hotels.add(h);
                }
            } catch (SQLException ex) {
            }

            request.getSession().setAttribute("hotels", hotels);
        }

        request.getRequestDispatcher("/admin/hotels/hotels.jsp").forward(request, response);
    }
}
