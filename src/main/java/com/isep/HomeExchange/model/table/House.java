package com.isep.HomeExchange.model.table;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
public class House {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer owner;
    @NotEmpty private String address;
    @NotEmpty private String status;
    @NotEmpty private String description;
    @NotEmpty  private String service;
    private String constraintRule;
    @NotEmpty private String name ;
    @NotEmpty private String city ;


    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @NotNull
    private Date dateStart;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @NotNull
    private Date dateEnd;

    public House() {
    }


    public House(String address, String description, String service, String constraintRule, String name, String city, Date dateStart, Date dateEnd) {
        this.address = address;
        this.description = description;
        this.service = service;
        this.constraintRule = constraintRule;
        this.name = name;
        this.city = city;
        this.dateStart = dateStart ;
        this.dateEnd = dateEnd ;

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id){
        this.id = id ;
    }


    public Integer getOwner() {
        return owner;
    }

    public void setOwner(Integer owner) {
        this.owner = owner;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", owner=" + owner +
                ", address='" + address + '\'' +
                ", status='" + status + '\'' +
                ", description='" + description + '\'' +
                ", service='" + service + '\'' +
                ", constraintRule='" + constraintRule + '\'' +
                ", name='" + name + '\'' +
                ", city='" + city + '\'' +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                '}';
    }
}


