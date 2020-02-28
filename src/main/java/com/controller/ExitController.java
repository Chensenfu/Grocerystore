package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("exit")
@ResponseBody
public class ExitController {
    @RequestMapping("exits")
    public Boolean exit(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return true;
    }
}
