package com.service;

import com.entity.User;

public interface UserService {

    public Integer queryByNameAndPwd(String username, String pwd);

    public Boolean add(User user);
}
