package com.isep.HomeExchange.controller.backoffice;

import com.isep.HomeExchange.controller.service.UserService;
import com.isep.HomeExchange.model.Validator.UserRegistrationValidator;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class UserBackOffice {
    @Autowired
    UserRepository userRepository;

    @Autowired
    UserRegistrationValidator userValidator;

    @Autowired
    UserService userService;



    //User List
    @GetMapping(value = "/userList")
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
        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "addUser";
        }
        userService.saveRegistration(user);
        return "redirect:/userList";
    }


    //removeUser
    @GetMapping(value = "/removeUser")
    public String removeUser(Model model, @RequestParam("id") int id) {
        Optional<User> optionalUser =  userRepository.findById(id);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            model.addAttribute("user", user);
            return "removeUser";
        } else {
            return "redirect:/userList";
        }
    }

    @GetMapping(value = "/removeUserConfirmed")
    public String removeUserConfirmed(Model model,@RequestParam("id") int id) {
        userRepository.deleteById(id);
        return "redirect:/userList";
    }

    //EditUser
    @GetMapping(value = "/editUser")
    public String editUser(Model model, @RequestParam("id") int id) {
        Optional<User> optionalUser = userRepository.findById(id);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            model.addAttribute("user", user);
            return "editUser";
        } else {
            return "redirect:/userList";
        }
    }

    @PostMapping(value = "/editUser")
    public String editSubmit(@Valid User user, BindingResult bindingResult, Model model, @RequestParam("id") int id){
        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "editUser";
        }
        Optional<User> optionalUser = userRepository.findById(id);
        if (optionalUser.isPresent()) {
            User userFromDb = optionalUser.get();
            userService.saveEdit(userFromDb, user);
            return "redirect:/userList";
        } else {
            return "redirect:/userList";
        }
    }

}
