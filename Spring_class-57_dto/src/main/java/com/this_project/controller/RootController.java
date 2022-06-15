package com.this_project.controller;

import com.this_project.dao.UserDAO;
import com.this_project.entity.Role;
import com.this_project.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RootController {

    @Autowired
    public PasswordEncoder passwordEncoder;
    @Autowired
    public UserDAO userDAO;
    @GetMapping("/")
    public ModelAndView home(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("name", "Animesh Das");
        mv.setViewName("home");
        return mv;
    }

//  Not entering to this url

//    @GetMapping("/login")
//    public String login(Model model, @RequestParam(name="error", required = false) String error) {
//        generateUsers();
//        model.addAttribute("error", error);
//        return "auth/login";
//    }

    @GetMapping("/login")
    public String login(Model model) {
        generateUsers();
        return "auth/login";
    }

    private void generateUsers() {

        if (userDAO.findByUsername("admin") == null) {
            var user = new User();
            user.setId(1L);
            user.setUserName("admin");
            user.setUserPassword(passwordEncoder.encode("secret"));
            user.setRole(Role.ROLE_ADMIN);
            userDAO.saveUser(user);
        }

        if (userDAO.findByUsername("user") == null) {
            var user = new User();
            user.setId(3L);
            user.setUserName("user");
            user.setUserPassword(passwordEncoder.encode("secret"));
            user.setRole(Role.ROLE_USER);
            userDAO.saveUser(user);
        }
    }

}
