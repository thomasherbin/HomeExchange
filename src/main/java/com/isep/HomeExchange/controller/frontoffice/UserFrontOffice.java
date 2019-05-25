package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.controller.service.Session;
import com.isep.HomeExchange.model.Validator.UserChangePasswordValidator;
import com.isep.HomeExchange.model.Validator.UserRegistrationValidator;
import com.isep.HomeExchange.controller.service.SecurityService;
import com.isep.HomeExchange.controller.service.UserService;
import com.isep.HomeExchange.model.repository.MessageRepository;
import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.table.Message;
import com.isep.HomeExchange.model.table.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.awt.*;
import java.util.*;
import java.util.List;

@Controller
 public class UserFrontOffice {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserRegistrationValidator userRegistrationValidator;

    @Autowired
    UserChangePasswordValidator userChangePasswordValidator;

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserRepository userRepository;


    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userRegistrationValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.saveRegistration(userForm);
        securityService.autoLogin(userForm.getUserName(), userForm.getPasswordConfirm());
        return "redirect:/home";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");


        if (logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
        }

        return "login";
    }

    @GetMapping("/yourProfile")
    public String yourProfile(Model model) {
        Session session = new Session(userRepository);
        Optional<User> optionalUser =  userRepository.findById(session.getUserId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            model.addAttribute("user", user);
            return "yourProfile";
        } else {
            return "redirect:/home";
        }
    }

    @GetMapping(value = "/updateUser")
    public String editUser(Model model) {
        Session session = new Session(userRepository);
        Optional<User> optionalUser = userRepository.findById(session.getUserId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            model.addAttribute("user", user);
            return "updateUser";
        } else {
            return "redirect:/home";
        }
    }

    @PostMapping(value = "/updateUser")
    public String editSubmit(@Valid User user, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()) {
            return "updateUser";
        }
        Session session = new Session(userRepository);
        Optional<User> optionalUser = userRepository.findById(session.getUserId());
        if (optionalUser.isPresent()) {
            User userFromDb = optionalUser.get();
            userService.saveEdit(userFromDb,user);
            return "redirect:/yourProfile";
        } else {
            return "redirect:/yourProfile";
        }
    }

    @GetMapping(value = "/updatePassword")
    public String updatePassord(Model model) {
        Session session = new Session(userRepository);
        Optional<User> optionalUser = userRepository.findById(session.getUserId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            model.addAttribute("user", user);
            return "updatePassword";
        } else {
            return "redirect:/home";
        }
    }

    @PostMapping(value = "/updatePassword")
    public String updatePassordConfirm(@Valid User user, BindingResult bindingResult, Model model){
        userChangePasswordValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "updatePassword";
        }
        Session session = new Session(userRepository);
        Optional<User> optionalUser = userRepository.findById(session.getUserId());
        if (optionalUser.isPresent()) {
            User userFromDb = optionalUser.get();
            userService.savePassword(userFromDb, user);
            return "redirect:/yourProfile";
        } else {
            return "redirect:/yourProfile";
        }
    }


    /*-------------------------------------------- Messages ------------------------------------------- */
    @GetMapping("/messages")
    public String getConversation(ModelMap modelMap, Model model, @RequestParam("id") int id) {
        Session session = new Session(userRepository);
        int sessionId = session.getUserId();
        List<Message> senderMessages = messageRepository.findBySenderIdAndReceiverIdOrderBySentDate(id, sessionId);
        List<Message> recieverMessages = messageRepository.findBySenderIdAndReceiverIdOrderBySentDate(sessionId, id);
        List<Message> messages = senderMessages;
        messages.addAll(recieverMessages);
        Collections.sort(messages);

        User user = userRepository.findById(id).get();
        model.addAttribute("user", user);
        User SessionUser = userRepository.findById(sessionId).get();
        model.addAttribute("sessionUser", SessionUser);

        modelMap.put("messages", messages) ;
        model.addAttribute("message", new Message());
        return "message";
    }



    @PostMapping("/messages")
    public String submitMessage(@Valid @ModelAttribute("message") Message message, BindingResult bindingResult, @RequestParam("id") int id) {
        Session session = new Session(userRepository);
        if (bindingResult.hasErrors()) {
            return "message" ;
        }
        message.setSenderId(session.getUserId());
        message.setReceiverId(id);
        message.setSentDate(new Date());
        messageRepository.save(message);
        return "redirect:/messages";
    }


}