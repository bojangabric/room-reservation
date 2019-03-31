package com.bojan.database;

import com.bojan.models.Hotel;
import java.sql.*;
import java.util.*;

public class Hotels {

    public static ArrayList<Hotel> GetHotels() {

        ArrayList<Hotel> hotels = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM hotels");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Hotel h = new Hotel();
                h.setHotel_id(rs.getInt("hotel_id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setCity(rs.getString("city"));
                h.setCountry(rs.getString("country"));
                h.setDescription(rs.getString("description"));
                h.setStars(rs.getInt("stars"));
                h.setPicture(rs.getString("picture"));

                hotels.add(h);
            }
        } catch (SQLException ex) {
        }

        return hotels;
    }

    public static ArrayList<Hotel> GetHotels(String query) {

        ArrayList<Hotel> hotels = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Hotel h = new Hotel();
                h.setHotel_id(rs.getInt("hotel_id"));
                h.setName(rs.getString("name"));
                h.setAddress(rs.getString("address"));
                h.setCity(rs.getString("city"));
                h.setCountry(rs.getString("country"));
                h.setDescription(rs.getString("description"));
                h.setStars(rs.getInt("stars"));
                h.setPicture(rs.getString("picture"));

                h.setMin_room_price(Rooms.GetMinPrice(h.getHotel_id()));
                h.setMax_room_price(Rooms.GetMaxPrice(h.getHotel_id()));

                hotels.add(h);
            }
        } catch (SQLException ex) {
        }

        return hotels;
    }

    public static Hotel GetHotel(int user_id) {

        Hotel h = new Hotel();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM hotels h JOIN managers m ON h.hotel_id = m.hotel_id WHERE m.user_id = ?");
            ps.setInt(1, user_id);

            ResultSet rs = ps.executeQuery();

            rs.next();
            h.setHotel_id(rs.getInt("hotel_id"));
            h.setName(rs.getString("name"));
            h.setAddress(rs.getString("address"));
            h.setCity(rs.getString("city"));
            h.setCountry(rs.getString("country"));
            h.setDescription(rs.getString("description"));
            h.setStars(rs.getInt("stars"));
            h.setPicture(rs.getString("picture"));

        } catch (SQLException ex) {
        }

        return h;
    }
}
