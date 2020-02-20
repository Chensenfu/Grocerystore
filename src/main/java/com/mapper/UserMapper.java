package com.mapper;

import com.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    public User queryByNameAndPwd(@Param("name") String name, @Param("pwd") String password);

    public int add(@Param("user") User user);
}
