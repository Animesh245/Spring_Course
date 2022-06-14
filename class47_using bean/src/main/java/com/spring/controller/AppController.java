package com.spring.controller;

import com.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {
@Autowired
    UserService userService;

    @GetMapping("/")
    public String helloWorld(Model model){
        model.addAttribute("msg", "World");
        System.out.println(userService.getUserDetails());
        model.addAttribute( "name", userService.getUserDetails().getName());
        model.addAttribute( "age", userService.getUserDetails().getAge());
        model.addAttribute( "country", userService.getUserDetails().getCountry());
        return "index";
    }
}
