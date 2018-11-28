/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.baza;

import java.sql.*;
import java.util.*;

/**
 *
 * @author bojan
 */
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
