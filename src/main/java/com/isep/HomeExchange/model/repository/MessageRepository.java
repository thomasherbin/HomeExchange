package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;

public interface MessageRepository extends JpaRepository<Message, Integer> {
    ArrayList<Message> findAllBySenderIdAndReceiverIdOrderBySentDate(int senderId, int receiverId);
}
