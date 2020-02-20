package com.service.impl;

import com.entity.User;
import com.mapper.UserMapper;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User queryByNameAndPwd(String name,String pwd) {
        return userMapper.queryByNameAndPwd(name,pwd);
    }

    @Override
    public Boolean add(User user) {
        return userMapper.add(user)==1;
    }
}