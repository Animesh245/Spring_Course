package controller;

import dao.LocationDAO;
import entity.Location;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
    @RequestMapping("/location")
    public class LocationController {

        @Autowired
        private LocationDAO locationDAO;


        @GetMapping("/create")
        public ModelAndView createLocation(Model model){
            Location location = new Location();
//            LocationDTO locationDTO = new LocationDTO();
            model.addAttribute("location", location);
            return new ModelAndView("location/create", "model", model);
        }

        @PostMapping("/save")
        public String saveLocation(Model model, @ModelAttribute("locationDTO") Location locationDTO){
            Location location = new Location();
//        BeanUtils.copyProperties(locationDTO,location);
            location.setLocationName(locationDTO.getLocationName());
            locationDAO.insert(location);
            model.addAttribute("location", location);
//        JSP file [/WEB-INF/views/location/show1.jsp] not found if /
            return "redirect:/location/show/" + location.getId();
        }

        @GetMapping(value = "/show/{id}")
        public String show(Model model, @PathVariable(value = "id") String id) {

            Location location = locationDAO.getById(Long.parseLong(id));
            model.addAttribute("location", location);

            return "location/show";
        }


        @GetMapping("/list")
        public String getLocationList(Model model){
            List<Location> locationList = locationDAO.getAll();
            model.addAttribute("locationList", locationList);

            return "location/list";
        }

}
