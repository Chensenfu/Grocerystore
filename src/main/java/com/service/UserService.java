package com.service;

import com.entity.User;

public interface UserService {

    public User queryByNameAndPwd(String username);

    public Boolean add(User user);
}
