package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

//    @Autowired
//    private UserDao userDao;

//    public ModelAndView helloWorld(){
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("name", "Hello Everyone!");
//        mv.setViewName("hello");
//        return mv;
//    }

    @GetMapping("/")
    public String home(){
        return "home";
    }
}
