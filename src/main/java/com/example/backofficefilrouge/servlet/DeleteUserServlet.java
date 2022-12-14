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

        Integer idRole = (Integer) req.getSession().getAttribute("idRole");
        req.setAttribute("idRole", idRole);


        try {
            int id = Integer.parseInt(idStr);
            UserDaoJpa userDao = new UserDaoJpa();
            Optional<UsersEntity> user = userDao.findById(id);


                if (user.isPresent()) {
                    if(idRole == 3 || idRole == 2){
                        if(user.get().getRoleId() == 1){
                            userDao.delete(user.get());
                            resp.sendRedirect(req.getContextPath() + UserListServlet.URL+ "?currentPage=1&recordsPerPage=5");
                        }
                        else{
                            resp.sendRedirect(req.getContextPath() + UserListServlet.URL+ "?currentPage=1&recordsPerPage=5");
                            System.out.println("Cet utilisateur est administrateur. Il ne peux pas être supprimé.");
                        }
                    }
                } else {
                    System.out.println("Aucun user");
            }
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
    }
}
