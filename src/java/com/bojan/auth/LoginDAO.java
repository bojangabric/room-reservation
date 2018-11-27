/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.auth;

import com.bojan.connection.ConnectionProvider;
import java.sql.*;

/**
 *
 * @author bojan
 */
public class LoginDAO {

    public static boolean validate(LoginBean user) {
        boolean status = false;
        try {
            Connection kon = ConnectionProvider.getCon();

            PreparedStatement ps = kon.prepareStatement(
                    "SELECT * FROM korisnici WHERE email=? AND lozinka=?");

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getLozinka());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (Exception e) {
        }

        return status;

    }
}
