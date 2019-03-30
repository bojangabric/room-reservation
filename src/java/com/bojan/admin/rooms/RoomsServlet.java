package com.bojan.admin.rooms;

import com.bojan.auth.LoginDAO;
import com.bojan.database.Hotels;
import com.bojan.database.Rooms;
import com.bojan.models.User;
import com.bojan.models.Room;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RoomsServletAdmin", urlPatterns = {"/admin/rooms"})
public class RoomsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = LoginDAO.loggedIn(request);
        ArrayList<Room> rooms = null;

        if (user != null) {
            switch (user.getRole()) {
                case "admin":
                    rooms = Rooms.GetRooms();
                    break;
                case "manager":
                    int hotel_id = Hotels.GetHotels("SELECT * FROM hotels h JOIN managers m ON m.hotel_id = h.hotel_id WHERE m.user_id = " + user.getUser_id()).get(0).getHotel_id();
                    rooms = Rooms.GetRooms(hotel_id);
                    break;
            }
            
            request.getSession().setAttribute("rooms", rooms);
        }
        request.getRequestDispatcher("/admin/rooms/rooms.jsp").forward(request, response);
    }
}
