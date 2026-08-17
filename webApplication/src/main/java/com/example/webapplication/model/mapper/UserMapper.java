package com.example.webapplication.model.mapper;

import com.example.webapplication.model.Users;
import com.example.webapplication.model.dao.UsersDao;

public class UserMapper {
    public static Users userMapper(UsersDao user) {

        return new Users(user.getId(), user.getName());
    }
}
