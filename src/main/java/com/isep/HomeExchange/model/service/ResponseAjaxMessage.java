package com.isep.HomeExchange.model.service;

import com.isep.HomeExchange.model.table.Message;

import java.util.List;

public class ResponseAjaxMessage {
    private String status;
    private List<Message> messages;
    private String firstName;
    private String LastName;

    public ResponseAjaxMessage() {
    }

    public ResponseAjaxMessage(String status, List<Message> messages, String firstName, String lastName) {
        this.status = status;
        this.messages = messages;
        this.firstName = firstName;
        LastName = lastName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }
}
