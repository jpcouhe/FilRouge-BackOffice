package com.example.backofficefilrouge.servlet;

import com.example.backofficefilrouge.Dao.UserDao;
import com.example.backofficefilrouge.Dao.UserDaoJpa;
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


        Integer idUser = (Integer) request.getSession().getAttribute("id");
        request.setAttribute("idAdmin", idUser);

        UserDao<UsersEntity> userDao = DaoFactory.getUserDao();

        List<UsersEntity> userList = userDao.findAll();
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        int recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));

        /*------------------------------------------------------------------*/
        List<UsersEntity> userListFilter = userDao.findAllUser(currentPage, recordsPerPage);

        int rows = userList.size();

        int nOfPages = rows / recordsPerPage;

        if (nOfPages % recordsPerPage > 0) {
            nOfPages++;
        }

        request.setAttribute("noOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        /*------------------------------------------------------------------*/


        List<UsersEntity> usersActives = userList.stream().filter(user -> user.getIsActive() == 0).collect(Collectors.toList());
        List<UsersEntity> usersAdmins = userList.stream().filter(user -> user.getRoleId() == 2 ||  user.getRoleId() == 3).collect(Collectors.toList());


        request.setAttribute("usersAdmins", usersAdmins );
        request.setAttribute("usersSize", userList);
        request.setAttribute("users", userListFilter);
        request.setAttribute("usersActives", usersActives);
        request.getRequestDispatcher("/WEB-INF/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
