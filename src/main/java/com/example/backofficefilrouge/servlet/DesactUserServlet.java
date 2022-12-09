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

@WebServlet(name = "DesactServlet", value = DesactUserServlet.URL)
public class DesactUserServlet extends HttpServlet {

    public static final String URL = "/user/desactivate";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String idStr = req.getParameter("id");

        UserDaoJpa userDao = new UserDaoJpa();
        Optional<UsersEntity> userToDesact = userDao.findById(Integer.parseInt(idStr));


        if(userToDesact.isPresent()){
            if(userToDesact.get().getRoleId() == 1){
                if(userToDesact.get().getIsActive().equals((byte) 1)){
                    userToDesact.get().setIsActive((byte) 0);
                    //userDao.desactUser(userToDesact.get(), (byte) 0);
                    userDao.update(userToDesact.get());

                    resp.sendRedirect(req.getContextPath() + "/user");
                }else {
                    resp.sendRedirect(req.getContextPath() + "/user");
                }
            }else {
                resp.sendRedirect(req.getContextPath() + "/user");
                System.out.println("Cet utilisateur est administrateur. Il ne peux pas être supprimé.");
            }

        }else{
            System.out.println("Aucun user n'a été trouvé avec cet id");
        }
        }catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
    }
}
