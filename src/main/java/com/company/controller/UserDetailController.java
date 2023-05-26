package com.company.controller;

import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserDetailController {
    @Autowired
    private UserServiceInter userService;

    @RequestMapping(method = RequestMethod.POST, value = "/update")
    public ModelAndView process() {
        ModelAndView mv = new ModelAndView("user");
        return mv;
    }
}
