/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.auth;

import com.bojan.connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bojan
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String redirect = "register.jsp";
        Connection kon = ConnectionProvider.getCon();

        Korisnik novi = new Korisnik();
        novi.setKorisnickoIme(request.getParameter("korisnicko_ime"));
        novi.setLozinka(request.getParameter("lozinka"));
        novi.setImePrezime(request.getParameter("ime_prezime"));
        novi.setEmail(request.getParameter("email"));
        novi.setTelefon(request.getParameter("telefon"));
        novi.setAdresa(request.getParameter("adresa"));
        novi.setGrad(request.getParameter("grad"));
        novi.setDrzava(request.getParameter("drzava"));
        novi.setPostanskiBroj(Integer.parseInt(request.getParameter("postanski_broj")));

        try {
            PreparedStatement ps = kon.prepareStatement(
                    "INSERT INTO korisnici(korisnicko_ime, lozinka, ime_prezime, email, telefon, adresa, grad, drzava, postanski_broj, uloga)"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1, novi.getKorisnickoIme());
            ps.setString(2, novi.getLozinka());
            ps.setString(3, novi.getImePrezime());
            ps.setString(4, novi.getEmail());
            ps.setString(5, novi.getTelefon());
            ps.setString(6, novi.getAdresa());
            ps.setString(7, novi.getGrad());
            ps.setString(8, novi.getDrzava());
            ps.setInt(9, novi.getPostanskiBroj());
            ps.setString(10, novi.getUloga());

            ps.executeUpdate();

            LoginBean user = new LoginBean();
            user.setEmail(novi.getEmail());
            user.setLozinka(novi.getLozinka());

            if (LoginDAO.validate(user)) {
                request.getSession().setAttribute("loggedInUser", true);
                redirect = "index.jsp";
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect(redirect);

    }
}
