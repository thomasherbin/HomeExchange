package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository

public interface HouseRepository extends JpaRepository<House, Integer> {

    //static House findById(int id);
    public House save(House house) ;
    List<House> findByOwner(int owner) ;
    List<House> findByAddress(String address) ;
    List<House> findByCityLike(String city) ;
    List<House> findByNameLike(String name) ;
    List<House> findByCityContaining(String city) ;
    List<House> findByNameContaining(String name) ;
    List<House> findByCityContainingIgnoreCase(String city) ;
    List<House> findByNameContainingIgnoreCase(String name) ;

    int countAllByOwner(int owner);

}
