package com.bojan.reservations;

import com.bojan.auth.LoginDAO;
import com.bojan.database.ConnectionProvider;
import com.bojan.database.Reservations;
import com.bojan.models.User;
import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ReservationsServlet", urlPatterns = {"/reservations"})
public class ReservationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);
        if (user != null) {
            request.getSession().setAttribute("reservations", Reservations.GetReservations(user.getUser_id()));
        }

        request.getRequestDispatcher("reservations.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("loggedInUser");

        if (user != null) {

            boolean valid = true;

            SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");

            PreparedStatement ps;

            db_call:
            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("INSERT INTO reservations(user_id, room_id, arrive_date, leave_date, money, points) VALUES(?, ?, ?, ?, ?, ?)");
                ps.setInt(1, user.getUser_id());
                ps.setInt(2, Integer.parseInt(request.getParameter("room_id_modal")));

                java.util.Date d = f.parse(request.getParameter("arrive_date_modal"));
                long time = d.getTime();
                ps.setDate(3, new java.sql.Date(time));

                d = f.parse(request.getParameter("leave_date_modal"));
                time = d.getTime();
                ps.setDate(4, new java.sql.Date(time));

                if (request.getParameter("pay").equals("money")) {
                    ps.setInt(5, Integer.parseInt(request.getParameter("room_price_modal")));
                    ps.setInt(6, 0);

                    PreparedStatement ps2 = kon.prepareStatement("UPDATE users SET points = points + 10 WHERE user_id = ?");
                    ps2.setInt(1, user.getUser_id());
                    ps2.executeUpdate();

                    user.setPoints(user.getPoints() + 10);

                } else if (user.getPoints() >= Integer.parseInt(request.getParameter("room_points_modal"))) {

                    user.setPoints(user.getPoints() - Integer.parseInt(request.getParameter("room_points_modal")));

                    PreparedStatement ps2 = kon.prepareStatement("UPDATE users SET points = ? WHERE user_id = ?");
                    ps2.setInt(1, user.getPoints());
                    ps2.setInt(2, user.getUser_id());
                    ps2.executeUpdate();

                    ps.setInt(5, 0);
                    ps.setInt(6, Integer.parseInt(request.getParameter("room_points_modal")));
                } else {
                    valid = false;
                    break db_call;
                }

                ps.executeUpdate();
            } catch (SQLException | ParseException ex) {
            }

            if (valid) {
                response.sendRedirect(request.getRequestURI());
            } else {
                request.setAttribute("error", "You don't have enough points.");
                request.getRequestDispatcher("/hotels/" + Integer.parseInt(request.getParameter("hotel_id_modal"))).forward(request, response);
            }
        } else {
            response.sendRedirect("/login");
        }
    }
}
