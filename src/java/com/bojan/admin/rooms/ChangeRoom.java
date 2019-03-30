package com.bojan.admin.rooms;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.database.Rooms;
import com.bojan.database.RoomTypes;
import com.bojan.models.User;
import com.bojan.models.Room;
import com.bojan.models.RoomType;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ChangeRoom", urlPatterns = {"/ChangeRoom/*"})
public class ChangeRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);
        if (user != null && (user.getRole().equals("admin") || user.getRole().equals("manager"))) {

            Room room = Rooms.GetRoom(Integer.parseInt(request.getPathInfo().replace("/", "")));
            ArrayList<RoomType> types = RoomTypes.GetTypes();

            request.getSession().setAttribute("types", types);
            request.getSession().setAttribute("room_for_edit", room);
        }

        request.getRequestDispatcher("/admin/rooms/change_room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/rooms");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("UPDATE rooms SET hotel_id = ?, type_id = ?, price = ?, points = ?, picture = ? "
                        + "WHERE room_id = ?");
                ps.setInt(1, Integer.parseInt(request.getParameter("hotel_id")));
                ps.setInt(2, Integer.parseInt(request.getParameter("type_id")));
                ps.setInt(3, Integer.parseInt(request.getParameter("price")));
                ps.setInt(4, Integer.parseInt(request.getParameter("points")));
                ps.setString(5, request.getParameter("picture"));
                ps.setInt(6, Integer.parseInt(request.getParameter("room_id")));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }
            
            response.sendRedirect("/admin/rooms");
        }
    }
}
