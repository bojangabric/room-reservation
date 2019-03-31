package com.bojan.database;

import com.bojan.models.Room;
import java.sql.*;
import java.util.*;

public class Rooms {

    public static ArrayList<Room> GetRooms() {

        ArrayList<Room> rooms = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT r.room_id, r.hotel_id, r.type_id, r.price, r.picture, r.points, h.name, rt.type FROM rooms r "
                    + "join hotels h on h.hotel_id = r.hotel_id "
                    + "join room_types rt on rt.type_id = r.type_id");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Room room = new Room();

                room.setRoom_id(rs.getInt("room_id"));
                room.setHotel(rs.getString("name"));
                room.setType(rs.getString("type"));
                room.setPrice(rs.getInt("price"));
                room.setPoints(rs.getInt("points"));
                room.setPicture(rs.getString("picture"));

                rooms.add(room);
            }
        } catch (SQLException ex) {
        }

        return rooms;
    }

    public static ArrayList<Room> GetRooms(int hotel_id) {

        ArrayList<Room> rooms = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT r.room_id, r.hotel_id, r.type_id, r.price, r.picture, r.points, h.name, rt.type FROM rooms r "
                    + "join hotels h on h.hotel_id = r.hotel_id "
                    + "join room_types rt on rt.type_id = r.type_id "
                    + "where r.hotel_id = ?");

            ps.setInt(1, hotel_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Room room = new Room();
                room.setRoom_id(rs.getInt("room_id"));
                room.setHotel_id(rs.getInt("hotel_id"));
                room.setType_id(rs.getInt("type_id"));
                room.setPrice(rs.getInt("price"));
                room.setPicture(rs.getString("picture"));
                room.setType(rs.getString("type"));
                room.setHotel(rs.getString("name"));
                room.setPoints(rs.getInt("points"));

                rooms.add(room);
            }

        } catch (SQLException ex) {
        }
        return rooms;
    }

    public static ArrayList<Room> GetRooms(int hotel_id, int min_price, int max_price) {

        ArrayList<Room> rooms = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT r.room_id, r.hotel_id, r.type_id, r.price, r.picture, r.points, h.name, rt.type FROM rooms r "
                    + "join hotels h on h.hotel_id = r.hotel_id "
                    + "join room_types rt on rt.type_id = r.type_id "
                    + "where r.hotel_id = ? and r.price >= ? and r.price <= ?");

            ps.setInt(1, hotel_id);
            ps.setInt(2, min_price);
            ps.setInt(3, max_price);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Room room = new Room();
                room.setRoom_id(rs.getInt("room_id"));
                room.setHotel_id(rs.getInt("hotel_id"));
                room.setType_id(rs.getInt("type_id"));
                room.setPrice(rs.getInt("price"));
                room.setPicture(rs.getString("picture"));
                room.setType(rs.getString("type"));
                room.setHotel(rs.getString("name"));
                room.setPoints(rs.getInt("points"));

                rooms.add(room);
            }

        } catch (SQLException ex) {
        }
        return rooms;
    }

    public static Room GetRoom(int soba_id) {

        Room room = new Room();

        try (Connection kon = ConnectionProvider.getCon()) {
            PreparedStatement ps = kon.prepareStatement("SELECT * FROM rooms r "
                    + "join hotels h on h.hotel_id = r.hotel_id WHERE r.room_id = ?");
            ps.setInt(1, soba_id);

            ResultSet rs = ps.executeQuery();
            rs.next();

            room.setRoom_id(soba_id);
            room.setHotel_id(rs.getInt("hotel_id"));
            room.setType_id(rs.getInt("type_id"));
            room.setPrice(rs.getInt("price"));
            room.setPoints(rs.getInt("points"));
            room.setPicture(rs.getString("picture"));
            room.setHotel(rs.getString("name"));
            
        } catch (SQLException ex) {
        }

        return room;
    }

    public static ArrayList<String> GetTypes(int hotel_id) {

        ArrayList<String> types = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT type FROM room_types rt "
                    + "JOIN rooms r on r.type_id = rt.type_id "
                    + "WHERE r.hotel_id = ?");

            ps.setInt(1, hotel_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String tip = rs.getString("type");
                types.add(tip);
            }
        } catch (SQLException ex) {
        }

        return types;
    }

    public static int GetMinPrice(int hotel_id) {

        Comparator<Room> comp = Comparator.comparing(Room::getPrice);
        ArrayList<Room> rooms = Rooms.GetRooms(hotel_id);

        return rooms.isEmpty() ? 0 : Collections.min(rooms, comp).getPrice();
    }

    public static int GetMaxPrice(int hotel_id) {

        Comparator<Room> comp = Comparator.comparing(Room::getPrice);
        ArrayList<Room> rooms = Rooms.GetRooms(hotel_id);

        return rooms.isEmpty() ? 0 : Collections.max(rooms, comp).getPrice();
    }
}
