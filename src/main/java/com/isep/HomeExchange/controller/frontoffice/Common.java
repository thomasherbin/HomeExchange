package com.isep.HomeExchange.controller.frontoffice;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Common {

    @GetMapping(value = {"/", "/index"})
    public String init() {
        return "home";
    }
}
