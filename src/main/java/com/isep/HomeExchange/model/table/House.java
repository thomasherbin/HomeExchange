package com.isep.HomeExchange.model.table;

import javax.persistence.Entity;

@Entity
public class House {
    private int id;
    private int owner;
    private String address;
    private int status;
    private String desription;
    private String service;
    private String constraint;
}
