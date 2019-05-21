package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.model.repository.HouseRepository;
import com.isep.HomeExchange.model.repository.ReservationRepository;
import com.isep.HomeExchange.model.table.House;
import com.isep.HomeExchange.model.table.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class Booking {

    private int sessionId = 1 ;

    @Autowired
    public Booking(ReservationRepository reservationRepository, HouseRepository houseRepository ) {
        this.reservationRepository = reservationRepository ;
        this.houseRepository = houseRepository;
    }
    private final ReservationRepository reservationRepository ;
    private final HouseRepository houseRepository ;

    /*---------------------------------- Book a house -----------------------------------------*/

    @GetMapping(value = "/BookHouse")
    public String showBookingForm(Model model, @RequestParam("id") int id){
        Optional<House> optionalHouse = houseRepository.findById(id);
        if(optionalHouse.isPresent()){
            House house =optionalHouse.get() ;
            model.addAttribute("house", house) ;
            System.out.println("house to book " + house.toString());
            model.addAttribute("reservation", new Reservation());
            return "BookHouse" ;
        } else{
            return "BookHouse" ;
        }
    }

    @PostMapping(value = "/bookHouse")
    public String bookHouse(@Valid @ModelAttribute("reservation") Reservation reservation, BindingResult bindingResult,Model model, @RequestParam("id") int id){
        if (bindingResult.hasErrors()) {
            return "BookHouse";
        }
        Optional<House> optionalHouse = houseRepository.findById(id) ;
        if (optionalHouse.isPresent()){
            House house = optionalHouse.get();
            System.out.println("fuck here " + house.toString());

            if(reservation.getDateEnd().compareTo(reservation.getDateStart()) > 0 || reservation.getDateEnd().compareTo(reservation.getDateStart()) == 0 ){
                reservation.setOwnerId(house.getOwner());
                reservation.setRenterId(sessionId);
                reservation.setHouseId(house.getId());
                reservation.setStatus("En cours");
                Reservation reservationAdded = reservationRepository.save(reservation) ;
                model.addAttribute("reservation",reservationAdded);
                return "redirect:/HouseDetails?id="+reservation.getHouseId();
            } else{
                return "BookHouse" ;
            }
        } else{
            return "error404" ;
        }
    }


}
