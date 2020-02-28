package com.controller;

import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
@ResponseBody
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public Integer login(@RequestParam("username") String username,
                         @RequestParam("pwd") String pwd,
                         HttpServletRequest req){
        HttpSession session = req.getSession();
        session.setAttribute("username",username);
        return userService.queryByNameAndPwd(username,pwd);
    }

    @RequestMapping("add")
    public Boolean add(User user){
        return userService.add(user);
    }
}
