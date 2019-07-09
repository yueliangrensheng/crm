package com.yazao.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {

    @RequestMapping(value = "/list")
    public String list(){

        return "customer";
    }
}
