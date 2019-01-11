package com.bojan.baza;

import com.bojan.modeli.TipSobe;
import java.sql.*;
import java.util.ArrayList;

public class TipoviSoba {

    public static ArrayList<TipSobe> UzmiTipove() {

        ArrayList<TipSobe> tipovi = new ArrayList<>();

        PreparedStatement ps;
        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM tipovi_soba");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TipSobe t = new TipSobe();
                t.setTip_id(rs.getInt("tip_id"));
                t.setTip(rs.getString("tip"));

                tipovi.add(t);
            }
        } catch (SQLException ex) {
        }

        return tipovi;
    }

    public static TipSobe UzmiTip(int tip_id) {

        PreparedStatement ps;
        TipSobe t = new TipSobe();

        try (Connection kon = ConnectionProvider.getCon()) {

            ps = kon.prepareStatement("SELECT * FROM tipovi_soba WHERE tip_id = ?");
            ps.setInt(1, tip_id);
            ResultSet rs = ps.executeQuery();
            rs.next();

            t.setTip_id(rs.getInt("tip_id"));
            t.setTip(rs.getString("tip"));

        } catch (SQLException ex) {
        }

        return t;
    }
}
