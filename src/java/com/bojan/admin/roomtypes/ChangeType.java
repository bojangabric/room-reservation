package com.bojan.admin.roomtypes;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.database.RoomTypes;
import com.bojan.models.User;
import com.bojan.models.RoomType;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ChangeType", urlPatterns = {"/ChangeType/*"})
public class ChangeType extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);
        if (user != null && (user.getRole().equals("admin") || user.getRole().equals("manager"))) {

            RoomType type = RoomTypes.GetType(Integer.parseInt(request.getPathInfo().replace("/", "")));
            request.getSession().setAttribute("type_for_edit", type);
        }

        request.getRequestDispatcher("/admin/room_type/change_room_type.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/roomtypes");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("UPDATE room_types SET type = ? WHERE type_id = ?");

                ps.setString(1, request.getParameter("type"));
                ps.setInt(2, Integer.parseInt(request.getParameter("type_id")));

                ps.executeUpdate();
            } catch (SQLException ex) {
            }

            response.sendRedirect("/admin/roomtypes");
        }
    }
}
