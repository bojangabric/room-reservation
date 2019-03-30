package com.bojan.admin.roomtypes;

import com.bojan.database.ConnectionProvider;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CreateType", urlPatterns = {"/CreateType"})
public class CreateType extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/room_type/create_room_type.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/roomtypes");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("INSERT INTO room_type(type) values(?)");
                ps.setString(1, request.getParameter("type"));
                ps.execute();
            } catch (SQLException ex) {
            }
            response.sendRedirect("/admin/roomtypes");
        }
    }
}
