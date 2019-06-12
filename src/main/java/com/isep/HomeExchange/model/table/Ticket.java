package com.isep.HomeExchange.model.table;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Ticket {

	private String ticketID;
	
	private String createdBy;
	
	private String description;
	
	private boolean status;
	
	public String getTicketID() {
		return ticketID;
	}
	
	public void setTicketID(String ticketID) {
		this.ticketID = ticketID;
	}
	
	public String getCreatedBy() {
		return createdBy;
	}
	
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public boolean getStatus() {
		return status;
	}
	
	public void setStatus(boolean status) {
		this.status = status;
	}
}
