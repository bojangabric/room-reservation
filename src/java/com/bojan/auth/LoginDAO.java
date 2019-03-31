package com.bojan.auth;

import com.bojan.models.User;
import com.bojan.database.ConnectionProvider;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;

public class LoginDAO {

    public static boolean validate(User korisnik) {
        boolean status = false;
        try (Connection kon = ConnectionProvider.getCon()) {

            PreparedStatement ps = kon.prepareStatement(
                    "SELECT * FROM users WHERE email=? AND password=?");

            ps.setString(1, korisnik.getEmail());
            ps.setString(2, korisnik.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

            korisnik.setUser_id(rs.getInt("user_id"));
            korisnik.setUsername(rs.getString("username"));
            korisnik.setName(rs.getString("name"));
            korisnik.setPhone(rs.getString("phone"));
            korisnik.setAddress(rs.getString("address"));
            korisnik.setCity(rs.getString("city"));
            korisnik.setCountry(rs.getString("country"));
            korisnik.setPostcode(rs.getInt("postcode"));
            korisnik.setRole(rs.getString("role"));
            korisnik.setPoints(rs.getInt("points"));

        } catch (SQLException e) {
        }

        return status;
    }

    public static User loggedIn(HttpServletRequest request) {
        return (User) request.getSession().getAttribute("loggedInUser");
    }
}
