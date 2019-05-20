package com.isep.HomeExchange.model.table;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Reservation {
    @Id @GeneratedValue private int id;
    private int ownerId;
    private int renterId;
    private int houseId;
    private int status;
}
