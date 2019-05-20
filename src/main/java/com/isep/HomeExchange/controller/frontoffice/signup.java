package com.isep.HomeExchange.controller.frontoffice;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

public class signup {
    @Autowired
    UserRepository userRepository;

    //User List
    @GetMapping(value = {"/index"})
    public String home(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "userView";
    }

    //addUser
    @GetMapping(value = "/addUser")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "addUser";
    }

    @PostMapping(value = "/addUser")
    public String confirmSubmit(@Valid User user, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()) {
            return "addUser";
        }
        this.userRepository.save(user);
        return "redirect:/index";
    }
}
