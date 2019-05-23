package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.model.repository.HouseRepository;
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

    /*------------------------------------- Get search page -----------------------------------------*/

    @GetMapping(value = "/search")
    public String showSearchPage(Model model){
        model.addAttribute("house", new House());
        return "Search" ;
    }

    /*----------------------------------- Search by City --------------------------------------------*/

    @PostMapping(value="/searchByCity")

    public String searchByCity(ModelMap modelMap, String city){
        List<House> houses = houseRepository.findByCityLike(city) ;
        modelMap.put("houses", houses) ;
        return "SearchResults" ;
    }

    /*---------------------------------- Search by name ---------------------------------------------*/

    @PostMapping(value="/searchByName")

    public String searchByName(ModelMap modelMap, String name){
        List<House> houses = houseRepository.findByNameLike(name) ;
        modelMap.put("houses", houses) ;
        return "SearchResults" ;
    }
}
