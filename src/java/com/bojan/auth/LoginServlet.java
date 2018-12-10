package com.bojan.auth;

import com.bojan.models.Korisnik;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Korisnik user = new Korisnik();
        user.setEmail(request.getParameter("email"));
        user.setLozinka(request.getParameter("lozinka"));
        String redirect = "/login";

        if (LoginDAO.validate(user)) {
            request.getSession().setAttribute("loggedInUser", user);
            redirect = "/hoteli";
        }
        response.sendRedirect(redirect);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
