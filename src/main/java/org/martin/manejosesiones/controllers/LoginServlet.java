package org.martin.manejosesiones.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.martin.manejosesiones.services.LoginService;
import org.martin.manejosesiones.services.LoginServiceSessionImplement;

import java.io.IOException;
import java.util.Optional;

// Definición del Servlet que manejará las rutas /login y /login.html
@WebServlet({"/login"})
public class LoginServlet extends HttpServlet {

    final static String USERNAME = "admin";
    final static String PASSWORD = "12345";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        LoginService auth = new LoginServiceSessionImplement();
        Optional<String> usernameOptional = auth.getUserName(req);

        if (usernameOptional.isPresent()) {
            // Aquí no deberías mostrar la pantalla nuevamente,
            // simplemente redirige a productos directamente.
            resp.sendRedirect("productos");
        } else {
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username.equals(USERNAME) && password.equals(PASSWORD)) {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            resp.sendRedirect("productos");
        } else {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Lo sentimos, no tiene acceso.");
        }
    }
}