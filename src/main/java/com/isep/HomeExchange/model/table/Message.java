package com.isep.HomeExchange.model.table;


import javax.persistence.*;
import java.util.Date;

@Entity
public class Message {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private int senderId;
    private int receiverId;
    private String content;
    private String object;
    @Temporal(TemporalType.DATE)
    private Date sentDate;

    public Message() {

    }

    public Date getSentDate() {
        return sentDate;
    }

    public void setSentDate(Date sentDate) {
        this.sentDate = sentDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }
}
