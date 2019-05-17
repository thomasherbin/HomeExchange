package com.isep.HomeExchange.model.repository;

import com.isep.HomeExchange.model.table.User;
import org.springframework.data.jpa.repository.JpaRepository;

//public interface UserRepository extends CrudRepository<Use, Long> {
//    List<Use> findByLastName(String lastName);
//
//}

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}