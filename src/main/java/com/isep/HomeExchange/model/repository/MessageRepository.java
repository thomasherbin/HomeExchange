package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.ArrayList;
import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Integer> {
    List<Message> findBySenderIdAndReceiverIdOrderBySentDate(int senderId, int receiverId);
}
