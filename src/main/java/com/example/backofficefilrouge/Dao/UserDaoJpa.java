package com.example.backofficefilrouge.Dao;

import com.example.backofficefilrouge.entity.UsersEntity;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDaoJpa implements UserDao<UsersEntity> {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    @Override
    public List<UsersEntity> findAll() {
        List<UsersEntity> userList = new ArrayList<>();

        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction et = entityManager.getTransaction();

        try{
            et.begin();

            TypedQuery<UsersEntity> query = entityManager.createQuery("SELECT u from UsersEntity u JOIN FETCH u.rolesByRoleId", UsersEntity.class);
            userList = query.getResultList();
            et.commit();


        }catch (Exception e){
            e.printStackTrace();
            if(et.isActive()) {et.rollback();}
        } finally {
            entityManager.close();
        }
        return userList;
    }

    /*----------------------------------------------------------*/

    public List<UsersEntity> findAllUser(int currentPage, int recordsPerPage) {
        List<UsersEntity> userList = new ArrayList<>();

        int start = currentPage * recordsPerPage - recordsPerPage;
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction et = entityManager.getTransaction();

        try{
            et.begin();

            TypedQuery<UsersEntity> query = entityManager.createQuery("SELECT u from UsersEntity u JOIN FETCH u.rolesByRoleId", UsersEntity.class);
            query.setFirstResult((currentPage - 1)*recordsPerPage);
            query.setMaxResults(recordsPerPage);
            userList = query.getResultList();
            et.commit();


        }catch (Exception e){
            e.printStackTrace();
            if(et.isActive()) {et.rollback();}
        } finally {
            entityManager.close();
        }
        return userList;
    }

    @Override
    public Optional<UsersEntity> findById(int id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction et = entityManager.getTransaction();

        try {
            et.begin();
            UsersEntity user = entityManager.createQuery("SELECT c FROM UsersEntity c JOIN FETCH c.rolesByRoleId WHERE c.id = :idParam", UsersEntity.class)
                    .setParameter("idParam", id)
                    .getSingleResult();

            et.commit();
            return Optional.of(user);
        } catch (Exception e) {
            e.printStackTrace();
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            entityManager.close();
        }
        return Optional.empty();
    }

   /* public Optional<List<UsersEntity>> findByName(String name) {
        List<UsersEntity> userList = new ArrayList<>();
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            TypedQuery<UsersEntity> query = em.createQuery("SELECT u FROM UsersEntity u WHERE u.userName = :nameParam", UsersEntity.class)
                    .setParameter("nameParam", name);
            userList = query.getResultList();
            et.commit();
            return Optional.of(userList);
        } catch (Exception e) {
            if (et.isActive()){
                et.rollback();
            }
        } finally {
            em.close();
        }
        return Optional.empty();
    }*/
    public Optional<List<UsersEntity>> findByvalue(String value) {

        List<UsersEntity> userList = new ArrayList<>();
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            TypedQuery<UsersEntity> query = em.createQuery("SELECT u FROM UsersEntity u WHERE u.userName LIKE :value OR u.userEmail LIKE :value OR u.rolesByRoleId.roleName LIKE :value OR u.userCity LIKE :value", UsersEntity.class).setParameter("value", "%" + value + "%");
            userList = query.getResultList();
            et.commit();
            return Optional.of(userList);
        } catch (Exception e) {
            if (et.isActive()){
                et.rollback();
            }
        } finally {
            em.close();
        }
        return Optional.empty();
    }
    public Optional<List<UsersEntity>> findByFirstLetterName(String firstLetter) {
        //select nom from table where nom like 'a%'
        List<UsersEntity> userList = new ArrayList<>();
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            TypedQuery<UsersEntity> query = em.createQuery("SELECT u FROM UsersEntity u WHERE u.userName LIKE ''+:firstLetterParam+'%'", UsersEntity.class)
                    .setParameter("firstLetterParam", firstLetter);
            userList = query.getResultList();
            et.commit();
            return Optional.of(userList);
        } catch (Exception e) {
            if (et.isActive()){
                et.rollback();
            }
        } finally {
            em.close();
        }
        return Optional.empty();
    }

    public Optional<UsersEntity> findByMailAndPsw(String mail, String psw) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            UsersEntity user = em.createQuery("SELECT u FROM UsersEntity u WHERE u.userEmail = :mailParam AND u.userPassword = :pswParam", UsersEntity.class)
                    .setParameter("mailParam", mail)
                    .setParameter("pswParam", psw)
                    .getSingleResult();
            et.commit();
            return Optional.of(user);
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return Optional.empty();
    }

    @Override
    public void delete(UsersEntity user) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            UsersEntity userToDelete = em.find(UsersEntity.class, user.getUserId());
            em.remove(userToDelete);
            et.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public void update(UsersEntity userEntity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(userEntity);
            et.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public UsersEntity signUp(UsersEntity userrEntity) {
        return null;
    }

    @Override
    public UsersEntity logIn(String email, String psw) {
        return null;
    }
}
