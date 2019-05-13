package com.isep.HomeExchange.model.table;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Ticket {
    @Id @GeneratedValue private int id ;
    private int sender ;
    private  int status ;
    private  String content ;
}
