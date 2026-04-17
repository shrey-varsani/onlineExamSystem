package com.example.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomErrorController {

    @GetMapping("/error/404")
    public String handle404() {
        return "error/404";
    }

    @GetMapping("/error/403")
    public String handle403() {
        return "error/403";
    }

    @GetMapping("/error/500")
    public String handle500() {
        return "error/500";
    }
}
