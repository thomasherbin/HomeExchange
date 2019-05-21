package com.isep.HomeExchange.model.table;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
public class Reservation {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) private int id;
    private int ownerId;
    private int renterId;
    private int houseId;
    private String status;
    @NotNull private int nbGuests ;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @com.sun.istack.internal.NotNull
    private Date dateStart;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @com.sun.istack.internal.NotNull
    private Date dateEnd;

    public Reservation() {
    }

    public Reservation(@NotNull int nbGuests, Date dateStart, Date dateEnd) {
        this.nbGuests = nbGuests;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public int getRenterId() {
        return renterId;
    }

    public void setRenterId(int renterId) {
        this.renterId = renterId;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getNbGuests() {
        return nbGuests;
    }

    public void setNbGuests(int nbGuests) {
        this.nbGuests = nbGuests;
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
        return "Reservation{" +
                "id=" + id +
                ", ownerId=" + ownerId +
                ", renterId=" + renterId +
                ", houseId=" + houseId +
                ", status='" + status + '\'' +
                ", nbGuests=" + nbGuests +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                '}';
    }
}
