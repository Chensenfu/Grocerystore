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
    public User queryByNameAndPwd(String username) {
        return userMapper.queryByNameAndPwd(username);
    }

    @Override
    public Boolean add(User user) {
        return userMapper.add(user)==1;
    }

    @Override
    public Integer queryUsernameAndTel(String username,String tel){
        User user = userMapper.queryUsernameAndTel(username);
        User user1 = userMapper.queryTel(tel);
        if (user!=null){
            return 1;   //用户名存在
        }else {
            if (user1 !=null){
                return 2;   //用户名不存在，手机号存在
            }else{
                return 0;   //用户名和手机号都不存在
            }
        }
    }

    @Override
    public Integer updatePwd(String tel,String password) {
        return userMapper.updatePwd(tel,password);
    }
}
