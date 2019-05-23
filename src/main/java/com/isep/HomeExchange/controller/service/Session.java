package com.isep.HomeExchange.controller.service;

import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class Session {
    private String userName;
    private int userId;


    public Session(UserRepository userRepository) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        User user = userRepository.findByUserName(userName);
        userId =  user.getId();
    }



    public String getUserName() {
        return userName;
    }

    public int getUserId() {
        return userId;
    }
}
