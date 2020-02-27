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
    public Integer queryByNameAndPwd(String username,String pwd) {
        User user = userMapper.queryByNameAndPwd(username);
        if(user == null){    //通过卡号查询时没有，代表卡号不存在
            return 1;
        }else if(!pwd.equals(user.getPassword())){ //如果存在，查询到的密码和传入的密码不一致，代表密码错误
            return 2;
        }else if(user.getStatus() == 0){ //状态码如果=0，代表冻结
            return 3;
        }
        return 0;
    }

    @Override
    public Boolean add(User user) {
        return userMapper.add(user)==1;
    }
}
