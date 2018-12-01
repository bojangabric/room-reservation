/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.baza;

import com.bojan.models.Rezervacija;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author bojan
 */
public class Rezervacije {

    public static ArrayList<Rezervacija> UzmiRezervacije(int korisnik_id) {

        Connection kon = ConnectionProvider.getCon();
        ArrayList<Rezervacija> rezervacije = new ArrayList<>();

        PreparedStatement ps;
        try {

            ps = kon.prepareStatement("SELECT * FROM rezervacije WHERE korisnik_id = ?");
            ps.setInt(1, korisnik_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Rezervacija r = new Rezervacija();
                r.setRezervacija_id(rs.getInt("rezervacija_id"));
                r.setKorisnik_id(rs.getInt("korisnik_id"));
                r.setSoba_id(rs.getInt("soba_id"));
                r.setDatum_dolaska(rs.getDate("datum_dolaska"));
                r.setDatum_odlaska(rs.getDate("datum_odlaska"));
                r.setNovac(rs.getInt("novac"));
                r.setPoeni(rs.getInt("poeni"));

                rezervacije.add(r);
            }
        } catch (SQLException ex) {
        }

        return rezervacije;
    }
}
