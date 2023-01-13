package com.example.backofficefilrouge.servlet;

import com.example.backofficefilrouge.Dao.UserDaoJpa;
import com.example.backofficefilrouge.entity.UsersEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "LoginServlet", value = LoginServlet.URL)
public class LoginServlet extends HttpServlet {

    public static final String URL = "/login";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if(session != null && session.getAttribute("mail") != null){
            // Filtrage OK
            resp.sendRedirect(UserListServlet.URL);
        }else {
            req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String mail = req.getParameter("mail");
        String password = req.getParameter("password");

        UserDaoJpa userDao = new UserDaoJpa();

        Optional<UsersEntity> userMailAndPsw = userDao.findByMailAndPsw(mail, password);

        try{
            if(userMailAndPsw.isPresent()){
                if(userMailAndPsw.get().getRoleId() == 2 || userMailAndPsw.get().getRoleId() == 3){
                    HttpSession session = req.getSession(true);
                    session.setAttribute("mail", mail);
                    session.setAttribute("id", userMailAndPsw.get().getUserId());
                    session.setAttribute("idRole", userMailAndPsw.get().getRoleId());
                    // Expiration after 30 minutes
                    session.setMaxInactiveInterval(30 * 60);

                    resp.sendRedirect(UserListServlet.URL+ "?currentPage=1&recordsPerPage=5");
                }
                else {
                    req.setAttribute("loginFail", true);
                    doGet(req, resp);
                }
            }
            else {
                req.setAttribute("loginFail", true);
                doGet(req, resp);
            }
        }catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
    }
}
