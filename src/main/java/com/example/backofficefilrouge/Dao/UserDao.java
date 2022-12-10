package com.example.backofficefilrouge.Dao;

import java.util.List;
import java.util.Optional;

public interface UserDao<E> {

    List<E> findAll();

    Optional<E> findById(int id);

    void delete(E e);

    void update(E e);

    E signUp(E e);

    E logIn(String email, String psw);

    List<E> findAllUser(int currentPage, int recordsPerPage);
}
