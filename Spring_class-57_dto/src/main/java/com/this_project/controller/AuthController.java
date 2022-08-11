package com.this_project.controller;

import com.this_project.dao.UserDAO;
import com.this_project.entity.Role;
import com.this_project.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;

@Controller
@RequestMapping(value = "/auth")
public class AuthController {
    @Autowired
    public PasswordEncoder passwordEncoder;
    @Autowired
    public UserDAO userDAO;


    private void generateUsers() {

        if (userDAO.findByUsername("admin") == null) {
            var user = new User();
            user.setId(1L);
            user.setUserName("admin");
            user.setUserEmail("admin@gmail.com");
            user.setUserPassword(passwordEncoder.encode("1111"));
            user.setRole(Role.ADMIN);
            userDAO.saveUser(user);
        }

        if (userDAO.findByUsername("user") == null) {
            var user = new User();
            user.setId(3L);
            user.setUserName("user");
            user.setUserEmail("user@gmail.com");
            user.setUserPassword(passwordEncoder.encode("1111"));
            user.setRole(Role.USER);
            userDAO.saveUser(user);
        }
    }

    @GetMapping("/login")
    public String login(Model model, @RequestParam(name="error", required = false) String error) {
        generateUsers();
        model.addAttribute("error", error);
        return "auth/login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication){
    if(authentication != null)
    {
        new SecurityContextLogoutHandler().logout(request,response,authentication);
    }
        return "redirect:/auth/login";
    }

    @GetMapping("/403")
    public ModelAndView accessdeniedPage(Principal user)
    {
        ModelAndView mv = new ModelAndView();

        if (user != null) {
            mv.addObject("msg", "Hi " + user.getName()
                    + ", you do not have permission to access this page!");
        } else {
            mv.addObject("msg",
                    "You do not have permission to access this page!");
        }

        mv.setViewName("auth/403");
        return mv;
    }
}
