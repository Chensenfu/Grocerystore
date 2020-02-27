package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("exit")
public class ExitController {
    @RequestMapping("exit")
    public Boolean exit(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return true;
    }
}
