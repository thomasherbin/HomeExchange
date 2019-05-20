package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.User;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface UserRepository extends CrudRepository<User, Integer> {
    List<User> findByLastName(String lastName);
}
