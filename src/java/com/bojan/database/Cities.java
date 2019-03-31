package com.bojan.database;

import java.sql.*;
import java.util.*;

public class Cities {

    public static List<String> GetCities() {

        ArrayList<String> cities = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT DISTINCT city FROM hotels");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cities.add(rs.getString("city"));
            }

        } catch (SQLException ex) {
        }

        return cities;
    }
}
