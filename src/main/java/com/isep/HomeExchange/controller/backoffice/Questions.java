package com.isep.HomeExchange.controller.backoffice;

import com.isep.HomeExchange.controller.Validator.TicketEditValidator;
import com.isep.HomeExchange.model.service.TicketService;
import com.isep.HomeExchange.controller.Validator.TicketRegistrationValidator;
import com.isep.HomeExchange.model.repository.TicketRepository;
import com.isep.HomeExchange.model.table.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
public class Questions {

    @Autowired
    TicketRepository ticketRepository;

    @Autowired
    TicketRegistrationValidator ticketRegistrationValidator;

    @Autowired
    TicketEditValidator ticketEditValidator;

    @Autowired
    TicketService ticketService;

    //Ticket List
    @GetMapping(value = "/ticketList")
    public String home(Model model) {
        Iterable<User> tickets = ticketRepository.findAll();
        for (Ticket ticket : tickets) {
            if (ticket.ticketIsAdmin()) {
                ticket.setRole("Admin");
            } else {
                ticket.setRole("Ticket");
            }
        }
        model.addAttribute("ticket", tickets);
        return "ticketView";
    }

    //addTicket
    @GetMapping(value ="/addTicket")
    public String addTicket(Model model){
        model.addAttribute("ticket", new Ticket());
        return "addTicket";
    }

    @PostMapping (value ="/addTicket")
    public String confirmSubmit(@valid Ticket ticket, BindingResult bindingResult, Model model){
        ticketRegistrationValidator.validate(ticket, bindingResult);
        if (bindingResult.hasErrors()){
            return "addTicket";
        }
        ticketService.saveRegistration(ticket, false);
        return "redirect:/ticketList";
    }

    //deleteTicket
    @GetMapping(value = "/deleteTicket")
    public String deleteTIcket(Model model, @RequestParam("id") int id){
        Optional<Ticket> optionalTicket =  TicketRepository.findById(id);
        if (optionalTicket.isPresent()) {
            Ticket ticket = optionalTicket.get();
            model.addAttribute("ticket", ticket);
            return "deleteTicket";
        } else {
            return "redirect:/ticketList";
        }
    }

    @GetMapping(value = "/deleteTicketConfirmed")
    public String removeTicketConfirmed(Model model,@RequestParam("id") int id) {
        userRepository.deleteById(id);
        return "redirect:/TicketList";
    }

    //EditTicket
    @GetMapping(value ="/editTicket")
    public String editTicket(Model model, @requestParam("id") int id){



    }



}
