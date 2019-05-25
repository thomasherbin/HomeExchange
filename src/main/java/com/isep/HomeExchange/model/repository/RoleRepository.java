package com.isep.HomeExchange.model.repository;
import com.isep.HomeExchange.model.table.Role;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository extends JpaRepository<Role, Long>{
    List<Role> findByName(String Name);
}