package com.bojan.admin.tipovisoba;

import com.bojan.baza.ConnectionProvider;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "KreirajTip", urlPatterns = {"/KreirajTip"})
public class KreirajTip extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/tipovisoba/kreirajtipsobe.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn").equals("cancel")) {
            response.sendRedirect("/admin/tipovisoba");
        } else {
            PreparedStatement ps;

            try (Connection kon = ConnectionProvider.getCon()) {
                ps = kon.prepareStatement("INSERT INTO tipovi_soba(tip) values(?)");
                ps.setString(1, request.getParameter("tip"));
                ps.execute();
            } catch (SQLException ex) {
            }
            response.sendRedirect("/admin/tipovisoba");
        }
    }
}
