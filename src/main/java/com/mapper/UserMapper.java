package com.mapper;

import com.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    public User queryByNameAndPwd(@Param("username") String username);

    public Integer add(@Param("user") User user);

    public User queryUsernameAndTel(@Param("username") String username);

    public User queryTel(@Param("tel") String tel);

    public Integer updatePwd(@Param("tel") String tel, @Param("pwd") String password);
}
