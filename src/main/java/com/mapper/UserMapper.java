package com.mapper;

import com.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    public User queryByNameAndPwd(@Param("username") String username);

    public int add(@Param("user") User user);
}
