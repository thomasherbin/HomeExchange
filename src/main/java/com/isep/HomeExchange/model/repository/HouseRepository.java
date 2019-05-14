package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface HouseRepository extends JpaRepository<House, Integer> {

    House findById(int id);
    public House save(House house) ;
}
