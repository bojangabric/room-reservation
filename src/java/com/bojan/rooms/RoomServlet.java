package com.bojan.rooms;

import com.bojan.database.Rooms;
import com.bojan.models.Room;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RoomServlet", urlPatterns = {"/hotels/*"})
public class RoomServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String room_type = request.getParameter("room_type");
        int min_price = 0;
        int max_price = 500;
        if (request.getParameter("min_price") != null) {
            min_price = Integer.parseInt(request.getParameter("min_price"));
        }
        if (request.getParameter("max_price") != null) {
            max_price = Integer.parseInt(request.getParameter("max_price"));
        }

        int hotel_id = Integer.parseInt(request.getPathInfo().replace("/", ""));

        ArrayList<Room> rooms = Rooms.GetRooms(hotel_id, min_price, max_price);

        if (room_type != null) {
            Iterator<Room> iter = rooms.iterator();
            while (iter.hasNext()) {
                Room room = iter.next();

                if (!room.getType().equals(room_type)) {
                    iter.remove();
                }
            }
        }

        if (rooms.isEmpty()) {
            request.setAttribute("error", "There are no rooms with selected options.");
        }

        request.setAttribute("rooms", rooms);
        request.setAttribute("hotel_id", hotel_id);
        request.setAttribute("types", Rooms.GetTypes(hotel_id));
        request.getRequestDispatcher("/rooms.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
