package com.example.backofficefilrouge.utilitaire;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityManager {
    private static EntityManagerFactory emf;

    private EntityManager(){
    }

    public static void closeEntityManagerFactory() {
        if(emf != null && emf.isOpen()) emf.close();
    }

    public static EntityManagerFactory getEntityInstance(){
        if(emf == null){
            emf = Persistence.createEntityManagerFactory("myPU");
        }
        return emf;
    }
}
