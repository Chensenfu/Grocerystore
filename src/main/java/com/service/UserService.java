package com.service;

import com.entity.User;

public interface UserService {

    public User queryByNameAndPwd(String name, String pwd);

    public Boolean add(User user);
}
