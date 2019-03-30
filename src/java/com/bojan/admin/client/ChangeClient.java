package com.bojan.admin.client;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.database.Hotels;
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

@WebServlet(name = "ChangeClient", urlPatterns = {"/ChangeClient/*"})
public class ChangeClient extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);

        if (user != null && user.getRole().equals("admin")) {

            ArrayList<Hotel> hotels = Hotels.GetHotels();
            int manager_hotel = 0;

            Connection kon = ConnectionProvider.getCon();
            int user_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            User u = new User();
            try {
                PreparedStatement ps = kon.prepareStatement("SELECT * FROM users WHERE user_id = ?");
                ps.setInt(1, user_id);

                ResultSet rs = ps.executeQuery();
                rs.next();

                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setCity(rs.getString("city"));
                u.setCountry(rs.getString("country"));
                u.setPostcode(rs.getInt("postcode"));
                u.setRole(rs.getString("role"));
                u.setPoints(rs.getInt("points"));
                
                manager_hotel = Hotels.GetHotel(rs.getInt("user_id")).getHotel_id();
            } catch (SQLException ex) {
            }

            request.getSession().setAttribute("manager_hotel", manager_hotel);
            request.getSession().setAttribute("hotels", hotels);
            request.getSession().setAttribute("client_for_edit", u);
        }

        request.getRequestDispatcher("/admin/clients/change_client.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/clients/clients.jsp");
        } else {
            Connection kon = ConnectionProvider.getCon();
            PreparedStatement ps;

            try {
                ps = kon.prepareStatement("UPDATE users SET username = ?, password = ?, name = ?,"
                        + "email = ?, phone = ?, address = ?, city = ?, country = ?, postcode = ?, role = ?, points = ? "
                        + "WHERE user_id = ?");

                ps.setString(1, request.getParameter("username"));
                ps.setString(2, request.getParameter("password"));
                ps.setString(3, request.getParameter("name"));
                ps.setString(4, request.getParameter("email"));
                ps.setString(5, request.getParameter("phone"));
                ps.setString(6, request.getParameter("address"));
                ps.setString(7, request.getParameter("city"));
                ps.setString(8, request.getParameter("country"));
                ps.setInt(9, Integer.parseInt(request.getParameter("postcode")));
                ps.setString(10, request.getParameter("role"));
                ps.setInt(11, Integer.parseInt(request.getParameter("points")));
                ps.setInt(12, Integer.parseInt(request.getParameter("user_id")));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/clients");
        }
    }
}
