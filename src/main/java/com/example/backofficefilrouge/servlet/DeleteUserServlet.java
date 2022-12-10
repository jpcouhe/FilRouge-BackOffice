package com.example.backofficefilrouge.servlet;

import com.example.backofficefilrouge.Dao.UserDaoJpa;
import com.example.backofficefilrouge.entity.UsersEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "DeleteUserServlet", value = DeleteUserServlet.URL)
public class DeleteUserServlet extends HttpServlet {

    public static final String URL = "/user/delete";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");

        try {
            int id = Integer.parseInt(idStr);
            UserDaoJpa userDao = new UserDaoJpa();
            Optional<UsersEntity> user = userDao.findById(id);

            if (user.isPresent()) {
                userDao.delete(user.get());
                resp.sendRedirect(req.getContextPath() + UserListServlet.URL+ "?currentPage=1&recordsPerPage=5");
            } else {
                System.out.println("Aucun user");
            }

        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
    }
}
