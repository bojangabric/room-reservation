package com.bojan.reservations;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.models.User;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CancelReservationServlet", urlPatterns = {"/CancelReservationServlet/*"})
public class CancelReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);

        if (user != null) {
            int reservation_id = Integer.parseInt(request.getPathInfo().replace("/", ""));
            try (Connection kon = ConnectionProvider.getCon()) {

                PreparedStatement ps2 = kon.prepareStatement("UPDATE users u "
                        + "JOIN reservations r on r.user_id = u.user_id "
                        + "SET u.points = "
                        + "IF ((SELECT points FROM reservations r1 WHERE r1.reservation_id = ?) > 0, u.points + (SELECT points FROM reservations r1 WHERE r1.reservation_id = ?), u.points - 10) "
                        + "WHERE r.reservation_id = ? AND u.user_id = ?");
                ps2.setInt(1, reservation_id);
                ps2.setInt(2, reservation_id);
                ps2.setInt(3, reservation_id);
                ps2.setInt(4, user.getUser_id());
                ps2.executeUpdate();

                PreparedStatement ps = kon.prepareStatement("DELETE FROM reservations WHERE reservation_id = ? AND user_id = ?");
                ps.setInt(1, reservation_id);
                ps.setInt(2, user.getUser_id());
                ps.executeUpdate();

                PreparedStatement ps3 = kon.prepareStatement("SELECT points FROM users WHERE user_id = ?");
                ps3.setInt(1, user.getUser_id());
                ResultSet rs = ps3.executeQuery();
                rs.next();
                user.setPoints(rs.getInt("points"));
            } catch (SQLException ex) {
            }
        }

        response.sendRedirect("/reservations");
    }
}
