package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.model.service.Session;
import com.isep.HomeExchange.model.repository.HouseRepository;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.House;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate localDate = LocalDate.now();
    String dateStr = formatter.format(localDate) ;
    Date currentDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr) ;

    private int k = 0 ;

    public Home() throws ParseException {
    }

    /*-------------------------------------------- Add a house ------------------------------------------- */

    @GetMapping(value = "/addHouse")
    public String ShowFormAddHouse(Model model){
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        model.addAttribute("house", new House());
        return "HomeAdd" ;

    }


    @PostMapping(value = "/addHouse")
    public String addHouse(@Valid @ModelAttribute("house") House house, BindingResult bindingResult, Model model) {
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        int sessionId = session.getUserId();
        house.setOwner(sessionId);

        if (bindingResult.hasErrors()) {
            return "HomeAdd" ;
        }

        if(house.getDateStart().compareTo(currentDate) > 0 || house.getDateStart().compareTo(currentDate) == 0){
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
        } else{
            return "HomeAdd" ;
        }

    }

    /*----------------------------------- Uploading photo ------------------------------------------*/

    @GetMapping(value = "/upload")
    public String showUploadForm(Model model, @RequestParam("id") int id){
        Optional<House> optionalHouse = houseRepository.findById(id);
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        if(optionalHouse.isPresent()){
            House house =optionalHouse.get() ;
            model.addAttribute("house", house) ;
            return "UploadPhoto" ;
        } else{
            return "UploadPhoto" ;
        }
    }
    @PostMapping(value = "/upload")
    public String uploadingFile(@RequestParam("file")MultipartFile file, @RequestParam("id") int id, RedirectAttributes redirectAttributes, Model model){
        int ID = id ;
        k++ ;
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        int sessionId = session.getUserId();

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:/errorUpload";
        }

        try{
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER +"U"+ sessionId +"_H" + id + "_" + k + "_" +file.getOriginalFilename() );

            Optional<House> optionalHouse = houseRepository.findById(id) ;
            if(optionalHouse.isPresent()){
                House house = optionalHouse.get() ;
                String[] splitPath= path.toString().split("(?<=webapp)");
                String photo = house.getPhoto() ;
                String photo2 = house.getPhoto2() ;
                String photo3 = house.getPhoto3() ;
                if(photo == null){
                    Files.write(path, bytes) ;
                    System.out.println("photo 1 empty");
                    house.setPhoto(splitPath[1]);
                    this.houseRepository.save(house) ;
                } else if(photo != null && photo2 == null){
                    Files.write(path, bytes) ;
                    System.out.println("photo 1 not empty and photo 2 empty");
                    house.setPhoto2(splitPath[1]);
                    this.houseRepository.save(house) ;
                } else if(photo != null && photo2 != null && photo3 == null){
                    Files.write(path, bytes) ;
                    System.out.println("photo 1 not empty and photo 2 not empty and photo 3 empty");
                    house.setPhoto3(splitPath[1]);
                    this.houseRepository.save(house) ;
                } else{
                    redirectAttributes.addFlashAttribute("message", "You can add 3 photos maximum. Please delete a photo if you want to upload a new one");
                    return "redirect:/errorUpload";
                }

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

    public String uploadStatus(Model model){
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        return "ErrorUpload" ;
    }

    /*--------------------------------- Deleting a photo ------------------------------------------*/

    @GetMapping(value = "/deletePhoto")
    public String showListPhoto(Model model, @RequestParam("id") int id){
        Optional<House> optionalHouse =  houseRepository.findById(id);
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        if (optionalHouse.isPresent()) {
            House house = optionalHouse.get();
            model.addAttribute("house", house);
            return "DeletePhoto";
        } else {
            return "error404";
        }
    }

    @GetMapping(value="/RemovePhotoConfirmed")
    public String removePhoto(Model model, @RequestParam("id") int id, @RequestParam("photoPath") String photoPath){
        Optional<House> optionalHouse =  houseRepository.findById(id);
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        if (optionalHouse.isPresent()) {
            House house = optionalHouse.get();
            File photoToDelete = new File(pathPrefix + houseRepository.findById(id).get().getPhoto()) ;
            photoToDelete.delete();
            house.setPhoto(null);
            this.houseRepository.save(house) ;
            return "redirect:/housesView";
        } else {
            return "error404";
        }
    }

    @GetMapping(value="/RemovePhoto2Confirmed")
    public String removePhoto2(Model model, @RequestParam("id") int id, @RequestParam("photo2Path") String photoPath){
        Optional<House> optionalHouse =  houseRepository.findById(id);
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        if (optionalHouse.isPresent()) {
            House house = optionalHouse.get();
            File photoToDelete = new File(pathPrefix + houseRepository.findById(id).get().getPhoto2()) ;
            photoToDelete.delete();
            house.setPhoto2(null);
            this.houseRepository.save(house) ;
            return "redirect:/housesView";
        } else {
            return "error404";
        }
    }

    @GetMapping(value="/RemovePhoto3Confirmed")
    public String removePhoto3(Model model, @RequestParam("id") int id, @RequestParam("photo3Path") String photoPath){
        Optional<House> optionalHouse =  houseRepository.findById(id);
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        if (optionalHouse.isPresent()) {
            House house = optionalHouse.get();
            File photoToDelete = new File(pathPrefix + houseRepository.findById(id).get().getPhoto3()) ;
            photoToDelete.delete();
            house.setPhoto3(null);
            this.houseRepository.save(house) ;
            return "redirect:/housesView";
        } else {
            return "error404";
        }
    }

    /*-------------------------------------------- Edit a house ------------------------------------------- */

    @GetMapping(value = "/editHouse")
    public String ShowFormEditHouse(Model model, @RequestParam("id") int id){
        Optional<House> optionalHouse = houseRepository.findById(id);
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
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
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
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
                    house.setPhoto2(houseFromDB.getPhoto2());
                    house.setPhoto3(houseFromDB.getPhoto3());
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
    public String housesCount( ModelMap modelMap, Model model){
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        int sessionId = session.getUserId();
        for(House house : houseRepository.findByOwner(sessionId) ){
            System.out.println(house.toString());
        }
        List<House> houses = houseRepository.findByOwner(sessionId) ;
        modelMap.put("houses", houses) ;
        return "HousesView" ;
    }

    @GetMapping(value = "/HouseDetails")
    public String showHouse(ModelMap model, @RequestParam("id") int id){
        Optional<House> optionalHouse = houseRepository.findById(id) ;
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
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
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
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
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        File photoToDelete = new File(pathPrefix + houseRepository.findById(id).get().getPhoto()) ;
        File photo2ToDelete = new File(pathPrefix + houseRepository.findById(id).get().getPhoto2()) ;
        File photo3ToDelete = new File(pathPrefix + houseRepository.findById(id).get().getPhoto3()) ;
        photoToDelete.delete();
        photo2ToDelete.delete();
        photo3ToDelete.delete();
        houseRepository.deleteById(id);
        return "redirect:/housesView";
    }


}
