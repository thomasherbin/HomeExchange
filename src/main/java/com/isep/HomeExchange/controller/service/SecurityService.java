package com.isep.HomeExchange.controller.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}