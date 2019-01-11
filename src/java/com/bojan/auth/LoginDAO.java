package com.bojan.auth;

import com.bojan.modeli.Korisnik;
import com.bojan.baza.ConnectionProvider;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;

public class LoginDAO {

    public static boolean validate(Korisnik korisnik) {
        boolean status = false;
        try (Connection kon = ConnectionProvider.getCon()) {

            PreparedStatement ps = kon.prepareStatement(
                    "SELECT * FROM korisnici WHERE email=? AND lozinka=?");

            ps.setString(1, korisnik.getEmail());
            ps.setString(2, korisnik.getLozinka());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

            korisnik.setKorisnik_id(rs.getInt("korisnik_id"));
            korisnik.setKorisnicko_ime(rs.getString("korisnicko_ime"));
            korisnik.setIme_prezime(rs.getString("ime_prezime"));
            korisnik.setTelefon(rs.getString("telefon"));
            korisnik.setAdresa(rs.getString("adresa"));
            korisnik.setGrad(rs.getString("grad"));
            korisnik.setDrzava(rs.getString("drzava"));
            korisnik.setPostanski_broj(rs.getInt("postanski_broj"));
            korisnik.setUloga(rs.getString("uloga"));
            korisnik.setPoeni(rs.getInt("poeni"));

        } catch (SQLException e) {
        }

        return status;
    }

    public static Korisnik loggedIn(HttpServletRequest request) {
        return (Korisnik) request.getSession().getAttribute("loggedInUser");
    }
}
