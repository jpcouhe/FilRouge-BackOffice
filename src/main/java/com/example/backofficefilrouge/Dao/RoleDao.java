package com.example.backofficefilrouge.Dao;

import com.example.backofficefilrouge.entity.RolesEntity;
import com.example.backofficefilrouge.entity.UsersEntity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import java.util.Optional;

public class RoleDao {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    public Optional<RolesEntity> findById(int id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction et = entityManager.getTransaction();

        try {
            et.begin();
            RolesEntity role = entityManager.createQuery("SELECT c FROM RolesEntity c WHERE c.id = :idParam", RolesEntity.class)
                    .setParameter("idParam", id)
                    .getSingleResult();

            et.commit();
            return Optional.of(role);
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
}
