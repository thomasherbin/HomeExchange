package com.isep.HomeExchange.controller.service;

import com.isep.HomeExchange.model.table.User;


public interface UserService {
    void saveRegistration(User user);
    void saveEdit(User userFromDb, User user);
    void savePassword(User userFromDb, User user);
    User findByUsername(String username);
}