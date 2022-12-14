package com.example.backofficefilrouge.servlet;

import com.example.backofficefilrouge.Dao.RoleDao;
import com.example.backofficefilrouge.Dao.UserDaoJpa;
import com.example.backofficefilrouge.entity.RolesEntity;
import com.example.backofficefilrouge.entity.UsersEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "UserProfilServlet", value = UserProfilServlet.URL)
public class UserProfilServlet extends HttpServlet {

    public static final String URL = "/user/edit";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Integer idUser = (Integer) req.getSession().getAttribute("id");
        Integer idRole = (Integer) req.getSession().getAttribute("idRole");
        req.setAttribute("idAdmin", idUser);
        req.setAttribute("idRole", idRole);

        String idStr = req.getParameter("id");
        try{
            UserDaoJpa userDao = new UserDaoJpa();
            Optional<UsersEntity> user = userDao.findById(Integer.parseInt(idStr));

            if(user.isPresent()){
                req.setAttribute("user", user.get());
                req.getRequestDispatcher("/WEB-INF/user-edit.jsp").forward(req, resp);
            }
            else{
                System.out.println("Nous n'avons pas trouvé de user avec cet identifiant.");
            }
        }catch (NumberFormatException e){
            System.err.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String idToUpd = req.getParameter("id");
            int id = Integer.parseInt(idToUpd);
            UserDaoJpa userDao = new UserDaoJpa();
            Optional<UsersEntity> userToUpd = userDao.findById(id);

            if(userToUpd.isPresent()){
                userToUpd.get().setUserName(req.getParameter("userName"));
                userToUpd.get().setUserFirstname(req.getParameter("userFirstname"));
                userToUpd.get().setUserCity(req.getParameter("userCity"));
                userToUpd.get().setRoleId(Integer.parseInt(req.getParameter("userRole")));

                userDao.update(userToUpd.get());

                resp.sendRedirect(req.getContextPath() + UserListServlet.URL+ "?currentPage=1&recordsPerPage=5");

            }
            else{
                System.out.println("Aucun user n'a été trouvé.");
            }
        }catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
    }
}
