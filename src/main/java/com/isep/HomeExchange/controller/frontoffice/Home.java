package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.model.repository.HouseRepository;
import com.isep.HomeExchange.model.table.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import javax.validation.Valid;

@Controller
public class Home {
    private final String pathHome = "/view/pages/frontoffice/home/";

    @Autowired
    public Home(HouseRepository houseRepository) {
        this.houseRepository = houseRepository;
    }
    private final HouseRepository houseRepository ;

    @GetMapping(value = pathHome +  "add")
    public String addHouse(Model model){
        model.addAttribute("house", new House());
        return pathHome + "add" ;

    }


    @PostMapping(value = "/addHouse")
    public String addHouse(@Valid @ModelAttribute("house") House house, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return pathHome + "add";
        }
        House houseAdded =  houseRepository.save(house);

        model.addAttribute("house", houseAdded);
        return pathHome + "add" ;
    }


}
