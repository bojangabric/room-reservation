package com.bojan.database;

import java.sql.*;

public class ConnectionProvider {

    public static Connection getCon() {
        String CONNECTION_URL = "jdbc:mysql://localhost:3306/ipa_projekat";
        String USERNAME = "root";
        String PASSWORD = "123";

        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
        }

        return con;
    }

}
