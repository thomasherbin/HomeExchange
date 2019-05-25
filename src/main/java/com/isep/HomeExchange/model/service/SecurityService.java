package com.isep.HomeExchange.model.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}