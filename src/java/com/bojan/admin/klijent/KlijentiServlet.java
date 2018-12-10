package com.bojan.admin.klijent;

import com.bojan.baza.ConnectionProvider;
import com.bojan.models.Korisnik;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "KlijentiServlet", urlPatterns = {"/admin/klijenti"})
public class KlijentiServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection kon = ConnectionProvider.getCon();
        ArrayList<Korisnik> klijenti = new ArrayList<>();

        PreparedStatement ps;
        try {

            ps = kon.prepareStatement("SELECT * FROM korisnici");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Korisnik k = new Korisnik();

                k.setKorisnik_id(rs.getInt("korisnik_id"));
                k.setKorisnicko_ime(rs.getString("korisnicko_ime"));
                k.setLozinka(rs.getString("lozinka"));
                k.setIme_prezime(rs.getString("ime_prezime"));
                k.setEmail(rs.getString("email"));
                k.setTelefon(rs.getString("telefon"));
                k.setAdresa(rs.getString("adresa"));
                k.setGrad(rs.getString("grad"));
                k.setDrzava(rs.getString("drzava"));
                k.setPostanski_broj(rs.getInt("postanski_broj"));
                k.setUloga(rs.getString("uloga"));
                k.setPoeni(rs.getInt("poeni"));

                klijenti.add(k);
            }
        } catch (SQLException ex) {
        }

        request.getSession().setAttribute("klijenti", klijenti);
        request.getRequestDispatcher("/admin/klijenti.jsp").forward(request, response);
    }
}
