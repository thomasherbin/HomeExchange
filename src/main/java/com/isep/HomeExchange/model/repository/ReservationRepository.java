package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    List<Reservation> findByOwnerId(int owner) ;
    List<Reservation> findByRenterId(int renter) ;
    List<Reservation> findByHouseId(int house) ;

}
