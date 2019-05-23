package com.isep.HomeExchange.controller.frontoffice;

import com.isep.HomeExchange.controller.service.Session;
import com.isep.HomeExchange.model.UserValidator;
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
import java.util.*;

@Controller
 public class UserFrontOffice {
    private int id = 2;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

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
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

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




    /*-------------------------------------------- Messages ------------------------------------------- */
    @GetMapping("/messages")
    public String getConversation(ModelMap modelMap, Model model/*, @RequestParam("id") int id*/) {
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
    public String submitMessage(@Valid @ModelAttribute("message") Message message, BindingResult bindingResult, Model model) {
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