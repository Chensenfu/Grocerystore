package com.service;

import com.entity.User;

public interface UserService {

    public User queryByNameAndPwd(String username);

    public Boolean add(User user);

    public Integer queryUsernameAndTel(String username, String tel);

    public Integer updatePwd(String tel, String password);

}
