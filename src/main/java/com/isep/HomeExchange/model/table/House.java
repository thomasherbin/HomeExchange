package com.isep.HomeExchange.model.table;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class House {

    @Id @GeneratedValue private int id;
    private int owner;
    private String address;

    private int status;
    private String description;
    private String service;
    private String constraintRule;


}


