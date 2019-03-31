package com.bojan.database;

import com.bojan.models.RoomType;
import java.sql.*;
import java.util.ArrayList;

public class RoomTypes {

    public static ArrayList<RoomType> GetTypes() {

        ArrayList<RoomType> types = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM room_types");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                RoomType type = new RoomType();
                type.setType_id(rs.getInt("type_id"));
                type.setType(rs.getString("type"));

                types.add(type);
            }
        } catch (SQLException ex) {
        }

        return types;
    }

    public static RoomType GetType(int type_id) {

        PreparedStatement ps;
        RoomType type = new RoomType();

        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM room_types WHERE type_id = ?");
            ps.setInt(1, type_id);
            ResultSet rs = ps.executeQuery();
            rs.next();

            type.setType_id(rs.getInt("type_id"));
            type.setType(rs.getString("type"));

        } catch (SQLException ex) {
        }

        return type;
    }
}
