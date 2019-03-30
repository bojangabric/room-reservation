package com.bojan.admin.rooms;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.database.Hotels;
import com.bojan.database.RoomTypes;
import com.bojan.models.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CreateRoom", urlPatterns = {"/CreateRoom"})
public class CreateRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);

        if (user.getRole().equals("menadzer")) {
            request.getSession().setAttribute("hotel", Hotels.GetHotel(user.getUser_id()));
        } else {
            request.getSession().setAttribute("hotels", Hotels.GetHotels());
        }

        request.getSession().setAttribute("types", RoomTypes.GetTypes());

        request.getRequestDispatcher("/admin/rooms/create_room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/rooms");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("INSERT INTO rooms(hotel_id, type_id, price, points, picture) "
                        + "values(?, ?, ?, ?, ?)");

                ps.setInt(1, Integer.parseInt(request.getParameter("hotel_id")));
                ps.setInt(2, Integer.parseInt(request.getParameter("type_id")));
                ps.setInt(3, Integer.parseInt(request.getParameter("price")));
                ps.setInt(4, Integer.parseInt(request.getParameter("points")));
                ps.setString(5, request.getParameter("picture"));

                ps.execute();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/rooms");
        }
    }
}
