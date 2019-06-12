package com.isep.HomeExchange.controller.backoffice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller

public class Questions {


	private final QuestionsService questionService;

	@Autowired
	public Questions(QuestionsService hellowWorldService) {
		this.questionsService = hellowWorldService;
	}
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String index(Map<String, Object > model) {
		model.put("ticket", questionsService.getAllActiveTickets());
		return "index";
	}

	@RequestMapping(value = "/addTicket", method = RequestMethod.POST)
	public String addTicket(@RequestParam("description") String description) {
		questionsService.addTicket("Admin", description);
		return "redirect/";
	}

	@RequestMapping(value = "/delete/{ticketID: .+}", method = RequestMethod.GET)
	public String deleteTicket(@PathVariable("ticketID") String ticketID) {
		supportSystemService.deleteTicket(ticketID);
		return "redirect/";
	}

}
