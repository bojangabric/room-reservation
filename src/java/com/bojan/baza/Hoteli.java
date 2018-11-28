/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.baza;

import com.bojan.models.Hotel;
import java.sql.*;
import java.util.*;

/**
 *
 * @author bojan
 */
public class Hoteli {

    public static List<Hotel> UzmiHotele() {

        Connection kon = ConnectionProvider.getCon();
        List<Hotel> hoteli = new ArrayList<>();

        PreparedStatement ps;
        try {

            ps = kon.prepareStatement("SELECT * FROM hoteli");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Hotel h = new Hotel();
                h.setHotel_id(rs.getInt("hotel_id"));
                h.setNaziv(rs.getString("naziv"));
                h.setAdresa(rs.getString("adresa"));
                h.setGrad(rs.getString("grad"));
                h.setDrzava(rs.getString("drzava"));
                h.setOpis(rs.getString("opis"));
                h.setZvezdice(rs.getInt("zvezdice"));
                h.setSlika(rs.getString("slika"));
                hoteli.add(h);
            }

        } catch (SQLException ex) {
        }

        return hoteli;
    }
}
