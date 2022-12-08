package com.example.backofficefilrouge.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = LogoutServlet.URL)
public class LogoutServlet extends HttpServlet {

    public static final String URL = "/logout";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession session = req.getSession();
      if(session != null){
          session.invalidate();
      }
        resp.sendRedirect(LoginServlet.URL);
    }
}
