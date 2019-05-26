package com.isep.HomeExchange.model.service;

import com.isep.HomeExchange.model.table.User;


public interface UserService {
    void saveRegistration(User user, boolean inFrontOffice);
    void saveEdit(User userFromDb, User user);
    void savePassword(User userFromDb, User user);
    User findByUsername(String username);
    String getCurrentEncyptPassword();
}