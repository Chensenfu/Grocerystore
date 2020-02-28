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
        User user = userService.queryByNameAndPwd(username);
        if(user == null){    //通过卡号查询时没有，代表卡号不存在
            return 1;
        }else if(!pwd.equals(user.getPassword())){ //如果存在，查询到的密码和传入的密码不一致，代表密码错误
            return 2;
        }else if(user.getStatus() == 0){ //状态码如果=0，代表冻结
            return 3;
        }else {
            HttpSession session = req.getSession();
            session.setAttribute("user",user);
            return 0;
        }
    }

    @RequestMapping("add")
    public Boolean add(User user){
        return userService.add(user);
    }
}
