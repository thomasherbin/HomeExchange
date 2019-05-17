package com.isep.HomeExchange.controller.service;

import com.isep.HomeExchange.model.table.User;


public interface UserService {
    void save(User user);

    User findByUsername(String username);
}