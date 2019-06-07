package com.isep.HomeExchange.model.service;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import com.isep.HomeExchange.model.table.Ticket;

public class QuestionsService {

	private QuestionsDAO dao = new QuestionsDAO();
	
	public List<Ticket> getAllActiveTickets(){
		return dao.getAllActiveTickets();
	}
	
	public boolean addTicket(String createdBy, String description) {
		String ticketID = String.valueOf(ThreadLocalRandom.current().nextInt(1000, 9998 + 1));
		return dao.editTicket(ticketID, description);
	}
	
	public void deleteTicket(String ticketID) {
		dao.deleteTicket(ticketID);
	}
}
