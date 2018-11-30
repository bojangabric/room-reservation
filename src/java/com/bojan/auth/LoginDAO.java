/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.auth;

import com.bojan.models.Korisnik;
import com.bojan.baza.ConnectionProvider;
import java.sql.*;

/**
 *
 * @author bojan
 */
public class LoginDAO {

    public static boolean validate(Korisnik user) {
        boolean status = false;
        try {
            Connection kon = ConnectionProvider.getCon();

            PreparedStatement ps = kon.prepareStatement(
                    "SELECT * FROM korisnici WHERE email=? AND lozinka=?");

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getLozinka());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

            user.setKorisnikId(rs.getInt("korisnik_id"));
            user.setKorisnickoIme(rs.getString("korisnicko_ime"));
            user.setImePrezime(rs.getString("ime_prezime"));
            user.setTelefon(rs.getString("telefon"));
            user.setAdresa(rs.getString("adresa"));
            user.setGrad(rs.getString("grad"));
            user.setDrzava(rs.getString("drzava"));
            user.setPostanskiBroj(rs.getInt("postanski_broj"));
            user.setUloga(rs.getString("uloga"));
            user.setPoeni(rs.getInt("poeni"));

        } catch (Exception e) {
        }

        return status;

    }
}
