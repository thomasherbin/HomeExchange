package com.isep.HomeExchange.controller.backoffice;


import com.isep.HomeExchange.model.repository.TicketRepository;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.service.Session;
import com.isep.HomeExchange.model.table.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class TicketSupport {

	@Autowired
	UserRepository userRepository;

	@Autowired
	TicketRepository ticketRepository;

	@GetMapping("/ticketList")
	public String ticketSupport(Model model, ModelMap modelMap) {
		Session session = new Session(userRepository);
		model.addAttribute("userIsAdmin", session.isAdmin());
		List<Ticket> ticketsOpen = ticketRepository.findAllByStatusOrderBySentDate("OPEN");
		List<Ticket> ticketsClose = ticketRepository.findAllByStatusOrderBySentDate("CLOSED");
		List<Ticket> tickets = ticketsOpen;
		tickets.addAll(ticketsClose);
		modelMap.put("tickets", tickets);
		return "ticketList";
	}

	@GetMapping("/editTicket")
	public String editTicket(Model model, @RequestParam("id") Long id) {
		Session session = new Session(userRepository);
		model.addAttribute("userIsAdmin", session.isAdmin());
		model.addAttribute("ticket", ticketRepository.findById(id).get());
		return "editTicket";
	}

	@GetMapping("/editTicketConfirmed")
	public String editTicketSubmit(Model model, @RequestParam("id") Long id) {
		Session session = new Session(userRepository);
		model.addAttribute("userIsAdmin", session.isAdmin());


		Ticket ticket = ticketRepository.findById(id).get();
		if (ticket.getStatus().equals("OPEN")) {
			ticket.setStatus("CLOSED");
		} else {
			ticket.setStatus("OPEN");
		}
		ticketRepository.save(ticket);

		return "redirect:/ticketList";
	}
}
