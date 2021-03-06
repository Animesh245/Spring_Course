package controller;

import config.Utils;
import dao.LocationDAO;
import dao.UserDAO;
import entity.Attachment;
import entity.Location;
import entity.User;
import model.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LocationDAO locationDAO;

    @Autowired
    private  FileController fileController;

    @GetMapping("/create")
    public ModelAndView create(Model model) {

        List<Location> locations = locationDAO.getAll();
        List<String> locationList = new ArrayList<>();

        for (Location location : locations) {
            locationList.add(location.getLocationName());
        }

        model.addAttribute("locationList", locationList);
        model.addAttribute("userDto", new UserDto());

        return new ModelAndView("user/create", "model", model);
    }

    @PostMapping(value = "/store")
    public String store(Model model, @ModelAttribute("userDto") UserDto userDto, @RequestParam("file") MultipartFile file) throws IOException {

        Location location = locationDAO.getByName(userDto.getLocation());

        Attachment attachment = fileController.uploadFile(file);

        User user = new User();
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setPassword(userDto.getPassword());
        user.setLocation(location);
        user.setAttachment(attachment);
        userDAO.insert(user);

        location.getUsers().add(user);
        locationDAO.update(location);


        model.addAttribute("user", user);

        return "redirect:/user/show/" + user.getId();
    }

    @GetMapping(value = "/show/{id}")
    public String show(Model model, @PathVariable(value = "id") String id) {

        User user = userDAO.getById(Long.parseLong(id));

        model.addAttribute("user", user);

        return "user/show";
    }

    @PostMapping("/update")
    public String update(Model model, @ModelAttribute("user") User user) {
        model.addAttribute("user", user);

        userDAO.update(user);

        return "user/show";
    }

    @PostMapping("/delete")
    public String update(Model model, @PathVariable("id") Long id) {

        return "user/show";
    }


    @GetMapping("/list")
    public String maintain(Model model) {

        List<User> userList = userDAO.getAll();
        model.addAttribute("userList", userList);

        return "user/list";
    }
}
