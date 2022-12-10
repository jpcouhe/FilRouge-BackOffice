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

@WebServlet(name = "ActivUserServlet", value = ActivUserServlet.URL)
public class ActivUserServlet extends HttpServlet {

    public static final String URL = "/user/activate";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String idStr = req.getParameter("id");

            UserDaoJpa userDao = new UserDaoJpa();
            Optional<UsersEntity> userToActiv = userDao.findById(Integer.parseInt(idStr));

            if(userToActiv.isPresent()){
                if(userToActiv.get().getIsActive().equals((byte) 0)){
                    userToActiv.get().setIsActive((byte) 1);
                    userDao.update(userToActiv.get());

                    resp.sendRedirect(req.getContextPath() + UserListServlet.URL+ "?currentPage=1&recordsPerPage=5");
                }else {
                    resp.sendRedirect(req.getContextPath() + UserListServlet.URL+ "?currentPage=1&recordsPerPage=5");
                }
            }else{
                System.out.println("Aucun user n'a été trouvé avec cet id");
            }
        }catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
    }

}
