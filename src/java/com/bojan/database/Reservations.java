package com.bojan.database;

import com.bojan.models.Reservation;
import java.sql.*;
import java.util.ArrayList;

public class Reservations {

    public static ArrayList<Reservation> GetReservations(int user_id) {

        ArrayList<Reservation> reservations = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM reservations WHERE user_id = ?");
            ps.setInt(1, user_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservation_id(rs.getInt("reservation_id"));
                r.setUser_id(rs.getInt("user_id"));
                r.setRoom_id(rs.getInt("room_id"));
                r.setArrive_date(rs.getDate("arrive_date"));
                r.setLeave_date(rs.getDate("leave_date"));
                r.setPrice(rs.getInt("price"));
                r.setPoints(rs.getInt("points"));

                reservations.add(r);
            }
        } catch (SQLException ex) {
        }

        return reservations;
    }
}
