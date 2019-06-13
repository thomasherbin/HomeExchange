package com.isep.HomeExchange.controller.frontoffice;


import com.isep.HomeExchange.model.repository.TicketRepository;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.service.Session;
import com.isep.HomeExchange.model.table.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Date;

@Controller
public class Common {

    @Autowired
    UserRepository userRepository;

    @Autowired
    TicketRepository ticketRepository;



    @GetMapping({"/home","/","/index"})
    public String home(Model model) {
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        return "home";
    }

    @GetMapping("/contact")
    public String contact(Model model) {
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());
        model.addAttribute("ticket", new Ticket());
        model.addAttribute("isSubmit", false);
        return "contactView";
    }

    @PostMapping("/contact")
    public String contactSubmit(Model model, @Valid Ticket ticket, BindingResult bindingResult) {
        Session session = new Session(userRepository);
        model.addAttribute("userIsAdmin", session.isAdmin());

        if (bindingResult.hasErrors()) {
            model.addAttribute("isSubmit", false);
            return "contactView";
        }

        Ticket ticketPost = new Ticket();
        ticketPost.setStatus("OPEN");
        ticketPost.setDescription(ticket.getDescription());
        ticketPost.setSenderEmail(ticket.getSenderEmail());
        ticketPost.setSentDate(new Date());
        ticketRepository.save(ticketPost);
        model.addAttribute("isSubmit", true);
        return "contactView";
    }
}
