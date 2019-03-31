package com.bojan.auth;

import com.bojan.models.User;
import com.bojan.database.ConnectionProvider;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String redirect = "register.jsp";

        User new_user = new User();
        new_user.setUsername(request.getParameter("username"));
        new_user.setPassword(request.getParameter("password"));
        new_user.setName(request.getParameter("name"));
        new_user.setEmail(request.getParameter("email"));
        new_user.setPhone(request.getParameter("phone"));
        new_user.setAddress(request.getParameter("address"));
        new_user.setCity(request.getParameter("city"));
        new_user.setCountry(request.getParameter("country"));
        new_user.setPostcode(Integer.parseInt(request.getParameter("postcode")));

        try (Connection kon = ConnectionProvider.getCon()) {
            PreparedStatement ps = kon.prepareStatement(
                    "INSERT INTO users(username, password, name, email, phone, address, city, country, country, role, points)"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1, new_user.getUsername());
            ps.setString(2, new_user.getPassword());
            ps.setString(3, new_user.getName());
            ps.setString(4, new_user.getEmail());
            ps.setString(5, new_user.getPhone());
            ps.setString(6, new_user.getAddress());
            ps.setString(7, new_user.getCity());
            ps.setString(8, new_user.getCountry());
            ps.setInt(9, new_user.getPostcode());
            ps.setString(10, new_user.getRole());
            ps.setInt(11, new_user.getPoints());

            ps.executeUpdate();

            User user = new User();
            user.setEmail(new_user.getEmail());
            user.setPassword(new_user.getPassword());

            if (LoginDAO.validate(user)) {
                request.getSession().setAttribute("loggedInUser", user);
                redirect = "/";
            }

        } catch (SQLException ex) {
        }

        response.sendRedirect(redirect);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
