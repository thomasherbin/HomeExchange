package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.Ticket;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface TicketRepository extends CrudRepository<Ticket, Long> {
    List<Ticket> findAllByStatusOrderBySentDate(String status);
}
