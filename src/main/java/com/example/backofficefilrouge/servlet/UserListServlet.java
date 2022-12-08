package com.example.backofficefilrouge.servlet;

import com.example.backofficefilrouge.Dao.UserDao;
import com.example.backofficefilrouge.entity.UsersEntity;
import com.example.backofficefilrouge.factory.DaoFactory;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "UserListServlet", value = UserListServlet.URL)
public class UserListServlet extends HttpServlet {

    public static final String URL = "/user";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao<UsersEntity> userDao = DaoFactory.getUserDao();
        List<UsersEntity> userList = userDao.findAll();


        List<UsersEntity> usersActives = userList.stream().filter(user -> user.getIsActive() == 0).collect(Collectors.toList());

        System.out.println(usersActives);
        request.setAttribute("users", userList);
        request.setAttribute("usersActives", usersActives);
        request.getRequestDispatcher("/WEB-INF/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
