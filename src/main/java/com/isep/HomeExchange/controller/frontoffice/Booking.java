package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.model.repository.HouseRepository;
import com.isep.HomeExchange.model.repository.ReservationRepository;
import com.isep.HomeExchange.model.table.House;
import com.isep.HomeExchange.model.table.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class Booking {

    private int sessionId = 1;

    @Autowired
    public Booking(ReservationRepository reservationRepository, HouseRepository houseRepository) {
        this.reservationRepository = reservationRepository;
        this.houseRepository = houseRepository;
    }

    private final ReservationRepository reservationRepository;
    private final HouseRepository houseRepository;

    /*---------------------------------- Book a house -----------------------------------------*/

    @GetMapping(value = "/BookHouse")
    public String showBookingForm(Model model, @RequestParam("id") int id) {
        Optional<House> optionalHouse = houseRepository.findById(id);
        if (optionalHouse.isPresent()) {
            House house = optionalHouse.get();
            model.addAttribute("house", house);
            System.out.println("house to book " + house.toString());
            model.addAttribute("reservation", new Reservation());
            return "BookHouse";
        } else {
            return "BookHouse";
        }
    }

    @PostMapping(value = "/bookHouse")
    public String bookHouse(@Valid @ModelAttribute("reservation") Reservation reservation, BindingResult bindingResult, Model model, @RequestParam("id") int id) {
        int ID = id ;
        if (bindingResult.hasErrors()) {
            return "redirect:/BookHouse?id="+ID;
        }
        Optional<House> optionalHouse = houseRepository.findById(id);
        if (optionalHouse.isPresent()) {
            House house = optionalHouse.get();
            System.out.println(" here " + house.toString());

            if (reservation.getDateEnd().compareTo(reservation.getDateStart()) > 0 || reservation.getDateEnd().compareTo(reservation.getDateStart()) == 0) {
                reservation.setOwnerId(house.getOwner());
                reservation.setRenterId(sessionId);
                reservation.setHouseId(house.getId());
                reservation.setStatus("Ongoing");
                Reservation reservationAdded = reservationRepository.save(reservation);
                model.addAttribute("reservation", reservationAdded);
                return "redirect:/HouseDetails?id=" + reservation.getHouseId();
            } else {
                return "error404";
            }
        } else {
            return "error404";
        }
    }

    /*--------------------------------- Show client's booking list -----------------------------*/

    @GetMapping(value = "/yourBooking")
    public String showClientBooking(ModelMap modelMap, @RequestParam("id") int id, ModelMap model) {
        for (Reservation reservation : reservationRepository.findByRenterId(id)) {
            System.out.println(reservation.toString());
        }
        List<Reservation> reservations = reservationRepository.findByRenterId(id);
        modelMap.put("reservations", reservations);

        List<String> housesName = new ArrayList();

        for(int k =0 ; k < reservations.size() ; k++){
            int houseId = reservations.get(k).getHouseId();
            housesName.add(houseRepository.findById(houseId).get().getName()) ;
        }

        model.put("housesName", housesName) ;

        return "ClientBooking";
    }

    /*----------------------------- Show owner's booking list --------------------------------*/

    @GetMapping(value = "/bookingList")
    public String showOwnerBooking(ModelMap modelMap, @RequestParam("id") int id, ModelMap modelHouses) {
        for (Reservation reservation : reservationRepository.findByOwnerId(id)) {
            System.out.println(reservation.toString());
        }
        List<Reservation> reservations = reservationRepository.findByOwnerId(id);
        modelMap.put("reservations", reservations);
        List<String> housesName = new ArrayList();

        for(int i =0 ; i < reservations.size() ; i++){
            int houseId = reservations.get(i).getHouseId();
            housesName.add(houseRepository.findById(houseId).get().getName()) ;
        }

        modelHouses.put("housesName", housesName) ;


        return "OwnerBooking";
    }

    /*---------------------------- Cancel Booking ---------------------------------------------*/

    @GetMapping(value = "/cancelBooking")
    public String cancelBooking(Model model, @RequestParam("id") int id) {
        Optional<Reservation> optionalReservation = reservationRepository.findById(id);
        if (optionalReservation.isPresent()) {
            Reservation reservation = optionalReservation.get();
            model.addAttribute("reservation", reservation);
            return "CancelBooking";
        } else {
            return "error404";
        }
    }


    @GetMapping(value = "/CancelBookingConfirmed")
    public String cancelBookingConfirmed(@RequestParam("id") int id) {
        int houseId = reservationRepository.findById(id).get().getHouseId() ;
        Optional<House> houseOptional = houseRepository.findById(houseId) ;
        if(houseOptional.isPresent()){
            System.out.println("house exists");
            House houseFromDB = houseOptional.get() ;
            houseFromDB.setStatus("Non booked");
            this.houseRepository.save(houseFromDB) ;
        }
        reservationRepository.deleteById(id);

        return "redirect:/yourBooking?id=" + sessionId;
    }

    /*----------------------------- Accept Booking ------------------------------------------*/

    @PostMapping(value = "/acceptBooking")
    public String acceptBooking(@RequestParam("id") int id){
        Optional<Reservation> optionalReservation = reservationRepository.findById(id) ;
        if(optionalReservation.isPresent()){
            Reservation reservationFromDB = optionalReservation.get();
            reservationFromDB.setStatus("Accepted");
            System.out.println("reservation updated : " + reservationFromDB.toString());
            this.reservationRepository.save(reservationFromDB) ;
            int houseID = reservationFromDB.getHouseId() ;
            Optional<House> optionalHouse = houseRepository.findById(houseID) ;
            if(optionalHouse.isPresent()){
                House houseFromDB = optionalHouse.get();
                houseFromDB.setStatus("Booked");
                this.houseRepository.save(houseFromDB) ;
            }
            return "redirect:/bookingList?id=" + reservationFromDB.getOwnerId();
        } else {
            return "error404" ;
        }
    }

    /*---------------------------- Reject Booking ------------------------------------------*/

    @PostMapping(value = "/rejectBooking")
    public String rejectBooking(@RequestParam("id") int id){
        Optional<Reservation> optionalReservation = reservationRepository.findById(id) ;
        if(optionalReservation.isPresent()){
            Reservation reservationFromDB = optionalReservation.get();
            reservationFromDB.setStatus("Rejected");
            System.out.println("reservation updated : " + reservationFromDB.toString());
            this.reservationRepository.save(reservationFromDB) ;
            int houseID = reservationFromDB.getHouseId() ;
            Optional<House> optionalHouse = houseRepository.findById(houseID) ;
            if(optionalHouse.isPresent()){
                House houseFromDB = optionalHouse.get() ;
                houseFromDB.setStatus("Non Booked");
                this.houseRepository.save(houseFromDB) ;
            }
            return "redirect:/bookingList?id=" + reservationFromDB.getOwnerId();
        } else {
            return "error404" ;
        }
    }
}
