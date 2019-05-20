package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.model.repository.HouseRepository;
import com.isep.HomeExchange.model.table.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
public class Home {
    private final String pathHome = "/view/pages/frontoffice/home/";
    private final String pathUser = "/view/pages/frontoffice/user/" ;

    @Autowired
    public Home(HouseRepository houseRepository) {
        this.houseRepository = houseRepository;
    }
    private final HouseRepository houseRepository ;

    /*-------------------------------------------- Add a house ------------------------------------------- */

    @GetMapping(value = "/addHouse")
    public String ShowFormAddHouse(Model model){
        model.addAttribute("house", new House());
        return "HomeAdd" ;

    }


    @PostMapping(value = "/addHouse")
    public String addHouse(@Valid @ModelAttribute("house") House house, BindingResult bindingResult, Model model) {
        house.setOwner(0);

        if (bindingResult.hasErrors()) {
            return "HomeAdd" ;
        }
        House houseAdded =  houseRepository.save(house) ;

        model.addAttribute("house", houseAdded);
        return "HomeAdd";
    }

    /*-------------------------------------------- Edit a house ------------------------------------------- */

    @GetMapping(value = "/editHouse")
    public String ShowFormEditHouse(Model model, @RequestParam("id") int id){
        Optional<House> optionalHouse = houseRepository.findById(id);
        if(optionalHouse.isPresent()){
            House house =optionalHouse.get() ;
            model.addAttribute("house", house) ;
            return "HomeEdit" ;
        } else{
            return "HomeEdit" ;
        }
    }

    @PostMapping(value = "/editHouse")
    public String editHouse(@Valid House house, BindingResult bindingResult, Model model, @RequestParam("id") int id, @RequestParam("owner") int owner) {
        if (bindingResult.hasErrors()) {
            return "error404";
        }
        Optional<House> optionalHouse = houseRepository.findById(id);
        if(optionalHouse.isPresent()){
            System.out.println("house : " + house.toString());
            House houseFromDB = optionalHouse.get();
            System.out.println("house from db : " + houseFromDB.toString());
            houseFromDB = house ;
            System.out.println("house updated : " + houseFromDB.toString());
            this.houseRepository.save(houseFromDB) ;
            return "HomeEdit";
        } else {
            System.out.print("here");
            return "HomeEdit" ;
        }
    }

    /*--------------------------------------- Show houses --------------------------------------------------*/



    @GetMapping(value = "/housesView")
    public String housesCount( ModelMap model, @RequestParam("id") int id){
        for(House house : houseRepository.findByOwner(id) ){
            System.out.println(house.toString());
        }
        List<House> houses = houseRepository.findByOwner(id) ;
        model.put("houses", houses) ;
        return "HousesView" ;
    }

    /*---------------------------------------- Delete house --------------------------------------------*/

    @GetMapping(value = "/removeHouse")
    public String removeHouse(Model model, @RequestParam("id") int id){
        Optional<House> optionalHouse =  houseRepository.findById(id);
        if (optionalHouse.isPresent()) {
            House house = optionalHouse.get();
            model.addAttribute("house", house);
            return "HomeRemove";
        } else {
            return "error404";
        }
    }

    @GetMapping(value = "/RemoveHouseConfirmed")
    public String removeHouseConfirmed(Model model,@RequestParam("id") int id) {
        houseRepository.deleteById(id);
        return "Home";
    }

}
