/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.baza;

import com.bojan.models.Soba;
import java.sql.*;
import java.util.*;

/**
 *
 * @author bojan
 */
public class Sobe {

    public static ArrayList<Soba> UzmiSobe(int hotel_id) {

        Connection kon = ConnectionProvider.getCon();
        ArrayList<Soba> sobe = new ArrayList<>();

        PreparedStatement ps;
        try {

            ps = kon.prepareStatement("SELECT s.soba_id, s.hotel_id, s.tip_id, s.cena, s.slika, h.naziv, ts.tip FROM sobe s "
                    + "join hoteli h on h.hotel_id = s.hotel_id "
                    + "join tipovi_soba ts on ts.tip_id = s.tip_id "
                    + "where s.hotel_id = ?");

            ps.setInt(1, hotel_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Soba s = new Soba();
                s.setSoba_id(rs.getInt("soba_id"));
                s.setHotel_id(rs.getInt("hotel_id"));
                s.setTip_id(rs.getInt("tip_id"));
                s.setCena(rs.getInt("cena"));
                s.setSlika(rs.getString("slika"));
                s.setTip(rs.getString("tip"));
                s.setHotel(rs.getString("naziv"));
                sobe.add(s);
            }

        } catch (SQLException ex) {
        }
        return sobe;
    }

    public static ArrayList<String> UzmiTipove(int hotel_id) {

        Connection kon = ConnectionProvider.getCon();
        ArrayList<String> tipovi = new ArrayList<>();

        PreparedStatement ps;
        try {

            ps = kon.prepareStatement("SELECT tip FROM tipovi_soba t "
                    + "JOIN sobe s on s.tip_id = t.tip_id "
                    + "WHERE s.hotel_id = ?");

            ps.setInt(1, hotel_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String tip = rs.getString("tip");
                tipovi.add(tip);
            }
        } catch (SQLException ex) {
        }

        return tipovi;
    }

    public static int UzmiNajmanjuCenu(int hotel_id) {
        Comparator<Soba> comp = Comparator.comparing(Soba::getCena);

        return Collections.min(Sobe.UzmiSobe(hotel_id), comp).getCena();
    }

    public static int UzmiNajvecuCenu(int hotel_id) {
        Comparator<Soba> comp = Comparator.comparing(Soba::getCena);

        return Collections.max(Sobe.UzmiSobe(hotel_id), comp).getCena();
    }
}
