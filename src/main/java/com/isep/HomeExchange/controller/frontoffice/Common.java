package com.isep.HomeExchange.controller.frontoffice;


import com.isep.HomeExchange.model.repository.UserRepository;
import com.isep.HomeExchange.model.service.Session;
import com.isep.HomeExchange.model.table.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Common {

    @Autowired
    UserRepository userRepository;


    @GetMapping({"/home","/","/index"})
    public String home(Model model) {
        Session session = new Session(userRepository);
        User user = userRepository.findById(session.getUserId()).get();
        boolean userIsAdmin = false;
        if (user.userIsAdmin()) {
            userIsAdmin = true;
        }
        model.addAttribute("userIsAdmin", userIsAdmin);
        return "home";
    }
}
