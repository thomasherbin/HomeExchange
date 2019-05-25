package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.controller.service.Session;
import com.isep.HomeExchange.model.repository.HouseRepository;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class Home {

    @Autowired
    HouseRepository houseRepository;

    @Autowired
    UserRepository userRepository;


    private static String UPLOADED_FOLDER = "src/main/webapp/ressources/image/";
    private static String pathPrefix = "src/main/webapp" ;

    /*-------------------------------------------- Add a house ------------------------------------------- */

    @GetMapping(value = "/addHouse")
    public String ShowFormAddHouse(Model model){
        model.addAttribute("house", new House());
        return "HomeAdd" ;

    }


    @PostMapping(value = "/addHouse")
    public String addHouse(@Valid @ModelAttribute("house") House house, BindingResult bindingResult, Model model) {
        Session session = new Session(userRepository);
        int sessionId = session.getUserId();
        house.setOwner(sessionId);

        if (bindingResult.hasErrors()) {
            return "HomeAdd" ;
        }

        if(house.getDateEnd().compareTo(house.getDateStart()) > 0){

            House houseAdded =  houseRepository.save(house) ;
            model.addAttribute("house", houseAdded);
            return "redirect:/housesView";
        } else if(house.getDateEnd().compareTo(house.getDateStart()) == 0){
            House houseAdded =  houseRepository.save(house) ;
            model.addAttribute("house", houseAdded);
            return "redirect:/housesView";
        }

        else{
            return "HomeAdd" ;
        }

    }

    /*----------------------------------- Uploading photo ------------------------------------------*/

    @GetMapping(value = "/upload")
    public String showUploadForm(Model model, @RequestParam("id") int id){
        Optional<House> optionalHouse = houseRepository.findById(id);
        if(optionalHouse.isPresent()){
            House house =optionalHouse.get() ;
            model.addAttribute("house", house) ;
            return "UploadPhoto" ;
        } else{
            return "UploadPhoto" ;
        }
    }
    @PostMapping(value = "/upload")
    public String uploadingFile(@RequestParam("file")MultipartFile file, @RequestParam("id") int id, RedirectAttributes redirectAttributes){
        int ID = id ;

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:/errorUpload";
        }

        try{
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes) ;
            Optional<House> optionalHouse = houseRepository.findById(id) ;
            if(optionalHouse.isPresent()){
                House house = optionalHouse.get() ;
                String[] splitPath= path.toString().split("(?<=webapp)");
                house.setPhoto(splitPath[1]);
                this.houseRepository.save(house) ;
            }
            else{
                return "UploadPhoto?id="+ID ;
            }

        } catch (IOException e){
            e.printStackTrace();
        }
        return "redirect:/housesView" ;
    }

    @GetMapping(value="/errorUpload")

    public String uploadStatus(){
        return "ErrorUpload" ;
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
        int ID = id ;
        if (bindingResult.hasErrors()) {
            return "redirect:/editHouse?id="+ID;
        }
        Optional<House> optionalHouse = houseRepository.findById(id);
        if(optionalHouse.isPresent()){
            System.out.println("house : " + house.toString());
            House houseFromDB = optionalHouse.get();
            System.out.println("house from db : " + houseFromDB.toString());
            if(house.getDateEnd().compareTo(house.getDateStart()) > 0 || house.getDateEnd().compareTo(house.getDateStart()) == 0){
                house.setPhoto(houseFromDB.getPhoto());
                houseFromDB = house ;
                System.out.println("house updated : " + houseFromDB.toString());
                this.houseRepository.save(houseFromDB) ;
                return "redirect:/housesView";
            } else{
                return "redirect:/editHouse?id="+ID ;
            }

        } else {
            return "HomeEdit" ;
        }
    }

    /*--------------------------------------- Show houses --------------------------------------------------*/



    @GetMapping(value = "/housesView")
    public String housesCount( ModelMap model){
        Session session = new Session(userRepository);
        int sessionId = session.getUserId();
        for(House house : houseRepository.findByOwner(sessionId) ){
            System.out.println(house.toString());
        }
        List<House> houses = houseRepository.findByOwner(sessionId) ;
        model.put("houses", houses) ;
        return "HousesView" ;
    }

    @GetMapping(value = "/HouseDetails")
    public String showHouse(ModelMap model, @RequestParam("id") int id){
        Optional<House> optionalHouse = houseRepository.findById(id) ;
        if(optionalHouse.isPresent()){
            House house = optionalHouse.get();
            model.put("house", house) ;
            return "ShowHouse" ;
        } else {
            return "error404" ;
        }
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
    public String removeHouseConfirmed(Model model,@RequestParam("id") int id) throws IOException {
        File photoToDelete = new File(pathPrefix + houseRepository.findById(id).get().getPhoto()) ;
        photoToDelete.delete();
        houseRepository.deleteById(id);
        return "redirect:/housesView";
    }


}
