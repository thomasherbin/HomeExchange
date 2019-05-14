package com.isep.HomeExchange.model.table;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Entity
public class House {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)private int id;
    private int owner;
    @Size(min=2, max=30)  private String address;

    private int status;
    @Size(min=2, max=30)  private String description;
    @Size(min=2, max=30)  private String service;
    private String constraintRule;

    public House() {
    }

    public House(String address, String description, String service, String constraintRule) {
        this.address = address;
        this.description = description;
        this.service = service;
        this.constraintRule = constraintRule;
    }

    public int getId() {
        return id;
    }

    /*
    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }
    */

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    /*

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    */
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getConstraintRule() {
        return constraintRule;
    }

    public void setConstraintRule(String constraintRule) {
        this.constraintRule = constraintRule;
    }
}


