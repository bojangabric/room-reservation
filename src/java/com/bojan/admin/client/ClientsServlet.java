package com.bojan.admin.client;

import com.bojan.database.ConnectionProvider;
import com.bojan.models.User;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ClientsServlet", urlPatterns = {"/admin/clients"})
public class ClientsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<User> clients = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM users");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();

                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setCity(rs.getString("city"));
                user.setCountry(rs.getString("country"));
                user.setPostcode(rs.getInt("postcode"));
                user.setRole(rs.getString("role"));
                user.setPoints(rs.getInt("points"));

                clients.add(user);
            }
        } catch (SQLException ex) {
        }

        request.getSession().setAttribute("clients", clients);
        request.getRequestDispatcher("/admin/clients/clients.jsp").forward(request, response);
    }
}
