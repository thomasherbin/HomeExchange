package com.isep.HomeExchange.model.service;

import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class Session {
    private String userName;
    private int userId;
    private boolean isAdmin;


    public Session(UserRepository userRepository) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
            User user = userRepository.findByUserName(userName);
            userId =  user.getId();
            isAdmin = user.userIsAdmin();
        } else {
            userName = principal.toString();
            userId = 0;
            isAdmin = false;
        }
    }



    public String getUserName() {
        return userName;
    }

    public int getUserId() {
        return userId;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }
}
