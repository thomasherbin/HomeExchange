package com.isep.HomeExchange.model.service;

import com.isep.HomeExchange.model.repository.RoleRepository;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.Role;
import com.isep.HomeExchange.model.table.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void saveRegistration(User user, boolean inFrontOffice) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        if (roleRepository.findAll().isEmpty()) {
            roleRepository.save(new Role("USER"));
            roleRepository.save(new Role("ADMIN"));
        }
        if (inFrontOffice) {
            user.setRoles(new HashSet<>(roleRepository.findByName("USER")));
        } else {
            if (user.getRole().equals("Admin")) {
                user.setRoles(new HashSet<>(roleRepository.findAll()));
            } else {
                user.setRoles(new HashSet<>(roleRepository.findByName("USER")));
            }
        }
        userRepository.save(user);
    }

    @Override
    public void saveEdit(User userFromDb, User user, boolean inFrontOffice) {
        if (!inFrontOffice) {
            if (user.getRole().equals("Admin")) {
                userFromDb.setRoles(new HashSet<>(roleRepository.findAll()));
            } else {
                userFromDb.setRoles(new HashSet<>(roleRepository.findByName("USER")));
            }
        }
        userFromDb.setFirstName(user.getFirstName());
        userFromDb.setLastName(user.getLastName());
        userFromDb.setEmail(user.getEmail());
        userFromDb.setUserName(user.getUserName());
        userRepository.save(userFromDb);
    }

    @Override
    public void savePassword(User userFromDb, User user) {
        userFromDb.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(userFromDb);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUserName(username);
    }

    @Override
    public String getCurrentEncyptPassword() {
        Session session = new Session(userRepository);
        return userRepository.findByUserName(session.getUserName()).getPassword();
    }

}