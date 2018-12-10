package com.bojan.baza;

import java.sql.*;
import java.util.*;

public class Gradovi {

    public static List<String> UzmiGradove() {

        Connection kon = ConnectionProvider.getCon();
        List<String> gradovi = new ArrayList<>();

        PreparedStatement ps;
        try {

            ps = kon.prepareStatement("SELECT DISTINCT grad FROM hoteli");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                gradovi.add(rs.getString("grad"));
            }

        } catch (SQLException ex) {
        }

        return gradovi;
    }
}
