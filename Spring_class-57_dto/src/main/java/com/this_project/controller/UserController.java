package com.this_project.controller;



import com.this_project.config.Properties;
import com.this_project.config.Utils;
import com.this_project.dao.LocationDAO;
import com.this_project.dao.UserDAO;
import com.this_project.dto.UserDTO;
import com.this_project.entity.Attachment;
import com.this_project.entity.Location;
import com.this_project.entity.Role;
import com.this_project.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LocationDAO locationDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping(value = "/create")
    public ModelAndView createUser(Model model){

//      retrieving location list from database
        List<Location> locationList = locationDAO.getLocationList();
        List<String> stringLocationList = new ArrayList<>();

        for (Location location: locationList){
            stringLocationList.add(location.getLocationName());
        }


//        model.addAttribute("roleList", Arrays.asList("USER", "ADMIN"));
        model.addAttribute("stringLocationList", stringLocationList);
        model.addAttribute("userDTO",new UserDTO());
        return new ModelAndView("/user/create","model", model);
    }

    @PostMapping(value = "/save")

    public String saveUser(Model model, @Valid @ModelAttribute("userDTO") UserDTO userDTO, BindingResult result, @RequestParam("image") MultipartFile file){

        if(result.hasErrors())
        {
            List<Location> locationList = locationDAO.getLocationList();
            List<String> stringLocationList = new ArrayList<>();

            for (Location location: locationList){
                stringLocationList.add(location.getLocationName());
            }
            model.addAttribute("stringLocationList", stringLocationList);

            return "/user/create";
        }else {
            Location location = locationDAO.getLocationByName(userDTO.getLocation());

            Attachment attachment = Utils.saveFile(file, Properties.USER_FOLDER);

//        attachmentDAO.insert(attachment);

            User user = new User();
            user.setUserName(userDTO.getName());
            user.setUserEmail(userDTO.getEmail());
            user.setUserPassword(passwordEncoder.encode(userDTO.getPassword()));
            user.setRole(Role.USER);
            user.setLocation(location);
            user.setAttachment(attachment);
            userDAO.saveUser(user);

//            location.getUserList().add(user);
            locationDAO.updateLocation(location);

            model.addAttribute("user", user);

            return "redirect:/user/show/" + user.getId();
        }

    }

    @GetMapping(value = "/show/{id}")
    public String show(Model model, @PathVariable(value = "id") String id) {

        User user = userDAO.getUserById(Long.parseLong(id));
        model.addAttribute("user", user);

        return "user/show";
    }

    @GetMapping( value = "/list")
    public String allUsers(Model model) {

        List<User> userList = userDAO.getUserList();

        model.addAttribute("userList", userList);
        return "user/list";
    }

//    @GetMapping(value = "/update/{id}")
//    public String update(Model model,  @PathVariable(value = "id") String id){
//
//        User user = userDAO.getUserById(Long.parseLong(id));
//
//        List<Location> locationList = locationDAO.getLocationList();
//        List<String> stringLocationList = new ArrayList<>();
//
//        for(Location location: locationList){
//            stringLocationList.add(location.getLocationName());
//        }
//
//        model.addAttribute("stringLocationList", stringLocationList);
//        UserDTO userDTO = new UserDTO();
//        userDTO.setId(user.getId());
//        userDTO.setName(user.getUserName());
//        userDTO.setEmail(user.getUserEmail());
//        userDTO.setPassword(user.getUserPassword());
//        userDTO.setLocation(user.getLocation().getLocationName());
//
//        model.addAttribute("userDTO", userDTO);
//
//        return "user/update";
//    }

    @GetMapping(value = "/getUser")
    public String getUser(Model model, Authentication authentication)
    {

//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        if( principal instanceof UserDetails)
//        {
//            String userEmail = ((UserDetails) principal).getUsername();
//        }else {
//            String userEmail = principal.toString();
//        }

//        Above-mentioned code is hard-wired so not a good practice. So we will prefer using dependency injection and let Spring provide us the userDetails

        String userEmail = authentication.getName();
        User user = userDAO.findByEmail(userEmail);

        List<Location> locationList = locationDAO.getLocationList();
        List<String> stringLocationList = new ArrayList<>();

        for(Location location: locationList){
            stringLocationList.add(location.getLocationName());
        }

        model.addAttribute("stringLocationList", stringLocationList);
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setName(user.getUserName());
        userDTO.setEmail(user.getUserEmail());
        userDTO.setPassword(user.getUserPassword());
        userDTO.setLocation(user.getLocation().getLocationName());

        model.addAttribute("userDTO", userDTO);

    return "user/update";
    }

    @PostMapping(value = "/update")
    public String postUpdate(Model model, @ModelAttribute("userDTO") UserDTO userDTO ){
        Location location = locationDAO.getLocationByName(userDTO.getLocation());

//        Catching ID from UserDTO
        Long id = userDTO.getId();
//        User user = new User();
        User user = userDAO.getUserById(id);
        user.setUserName(userDTO.getName());
        user.setUserEmail(userDTO.getEmail());
        user.setUserPassword(userDTO.getPassword());
        user.setLocation(location);
        userDAO.updateUser(user);


//        location.getUserList().add(user);
        locationDAO.updateLocation(location);

        return "redirect:/user/show/" + user.getId();
//        return "user/list";
    }

    @GetMapping(value = "/delete/{id}")
    public String deleteUser(Model model, @PathVariable("id") Long id) {
        userDAO.deleteUser(id);
        return "redirect:/user/list";
    }
}
