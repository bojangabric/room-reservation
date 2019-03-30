package com.bojan.admin.roomtypes;

import com.bojan.auth.LoginDAO;
import com.bojan.database.RoomTypes;
import com.bojan.models.User;
import com.bojan.models.RoomType;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RoomTypesServlet", urlPatterns = {"/admin/roomtypes"})
public class RoomTypesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);
        ArrayList<RoomType> types;

        if (user != null && (user.getRole().equals("admin") || user.getRole().equals("manager"))) {
            types = RoomTypes.GetTypes();
            request.getSession().setAttribute("types", types);
        }
        request.getRequestDispatcher("/admin/room_type/room_types.jsp").forward(request, response);
    }
}
