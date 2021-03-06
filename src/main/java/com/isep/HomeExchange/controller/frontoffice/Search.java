package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.model.repository.HouseRepository;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.service.Session;
import com.isep.HomeExchange.model.table.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class Search {

    @Autowired
    HouseRepository houseRepository;

    @Autowired
    UserRepository userRepository;

    /*------------------------------------- Get search page -----------------------------------------*/

    @GetMapping(value = "/search")
    public String showSearchPage(Model model){
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        model.addAttribute("house", new House());
        return "Search" ;
    }

    /*----------------------------------- Search by City --------------------------------------------*/

    @PostMapping(value="/searchByCity")

    public String searchByCity(ModelMap modelMap, String city, Model model){
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        //List<House> houses = houseRepository.findByCityLike(city) ;
        //List<House> houses = houseRepository.findByCityContaining(city) ;
        List<House> houses = houseRepository.findByCityContainingIgnoreCase(city) ;
        modelMap.put("houses", houses) ;
        return "SearchResults" ;
    }

    /*---------------------------------- Search by name ---------------------------------------------*/

    @PostMapping(value="/searchByName")

    public String searchByName(ModelMap modelMap, String name, Model model){
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
       // List<House> houses = houseRepository.findByNameLike(name) ;
        // List<House> houses = houseRepository.findByNameContaining(name) ;
        List<House> houses = houseRepository.findByNameContainingIgnoreCase(name) ;
        modelMap.put("houses", houses) ;
        return "SearchResults" ;
    }
}
