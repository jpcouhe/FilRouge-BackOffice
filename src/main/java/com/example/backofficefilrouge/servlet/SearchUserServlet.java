package com.example.backofficefilrouge.servlet;

import com.example.backofficefilrouge.Dao.UserDaoJpa;
import com.example.backofficefilrouge.entity.UsersEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "SearchUserServlet ", value = SearchUserServlet.URL)

public class SearchUserServlet extends HttpServlet {
    public static final String URL = "/search";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Integer idUser = (Integer) req.getSession().getAttribute("id");
        req.setAttribute("idAdmin", idUser);


    if(req.getParameter("search") != null){
        UserDaoJpa userDao = new UserDaoJpa();
        String name = req.getParameter("search");

        Optional<List<UsersEntity>> user = userDao.findByvalue(name);

        if(user.isPresent()){



            req.setAttribute("users", user.get());
            req.getRequestDispatcher("/WEB-INF/user-search.jsp").forward(req, resp);
        }else{
            String errorMessage = "Aucun user trouvé avec ce nom";
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("/WEB-INF/user-search.jsp").forward(req, resp);
        }
    }else{
        req.getRequestDispatcher("/WEB-INF/user-search.jsp").forward(req, resp);
    }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
