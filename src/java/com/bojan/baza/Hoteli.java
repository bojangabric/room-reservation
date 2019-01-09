package com.bojan.baza;

import com.bojan.modeli.Hotel;
import java.sql.*;
import java.util.*;

public class Hoteli {

    public static ArrayList<Hotel> UzmiHotele() {

        Connection kon = ConnectionProvider.getCon();
        ArrayList<Hotel> hoteli = new ArrayList<>();

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

    public static ArrayList<Hotel> UzmiHotele(String query) {

        Connection kon = ConnectionProvider.getCon();
        ArrayList<Hotel> hoteli = new ArrayList<>();

        PreparedStatement ps;
        try {

            ps = kon.prepareStatement(query);

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

                h.setMin_cena_sobe(Sobe.UzmiNajmanjuCenu(h.getHotel_id()));
                h.setMax_cena_sobe(Sobe.UzmiNajvecuCenu(h.getHotel_id()));

                hoteli.add(h);
            }
        } catch (SQLException ex) {
        }

        return hoteli;
    }
}
