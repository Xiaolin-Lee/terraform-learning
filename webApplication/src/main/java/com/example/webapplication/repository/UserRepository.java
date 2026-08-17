package com.example.webapplication.repository;

import com.example.webapplication.model.Users;
import com.example.webapplication.model.dao.UsersDao;
import com.example.webapplication.model.mapper.UserMapper;
import org.jdbi.v3.core.Jdbi;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public class UserRepository {
    public static final String SELECT_FROM_USERS_WHERE_ID_ID = "SELECT * FROM users WHERE id=:id";
    private final Jdbi jdbi;

    public UserRepository(Jdbi jdbi) {
        this.jdbi = jdbi;
    }

    public Optional<Users> getUserById(Long id) {
        Optional<UsersDao> usersDao = jdbi.withHandle(handle -> handle
                .createQuery(SELECT_FROM_USERS_WHERE_ID_ID)
                .bind("id", id)
                .mapToBean(UsersDao.class)
                .findFirst());
        return usersDao.map(UserMapper::userMapper);
    }
}
