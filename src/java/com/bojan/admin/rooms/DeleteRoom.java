package com.bojan.admin.rooms;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
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

@WebServlet(name = "DeleteRoom", urlPatterns = {"/DeleteRoom/*"})
public class DeleteRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);

        if (user != null && (user.getRole().equals("admin") || user.getRole().equals("manager"))) {

            int room_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            try (Connection kon = ConnectionProvider.getCon()) {
                PreparedStatement ps = kon.prepareStatement("DELETE FROM rooms WHERE room_id = ?");
                ps.setInt(1, room_id);
                ps.execute();
            } catch (SQLException ex) {
            }
        }

        response.sendRedirect("/admin/rooms");
    }

}
