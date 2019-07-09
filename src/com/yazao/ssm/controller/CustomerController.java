package com.yazao.ssm.controller;

import com.yazao.ssm.pojo.BaseDict;
import com.yazao.ssm.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CustomerController {

    @Value(value = "${base_dict.source}")
    private String baseDictSource;
    @Value(value = "${base_dict.industry}")
    private String baseDictIndustry;
    @Value(value = "${base_dict.level}")
    private String baseDictLevels;

    @Autowired
    private BaseDictService baseDictService;

    @RequestMapping(value = "/list")
    public String list(Model model) {
        //客户来源
        List<BaseDict> sourceList = baseDictService.findByTypeCode(baseDictSource);
        //客户行业
        List<BaseDict> industryList = baseDictService.findByTypeCode(baseDictIndustry);
        //客户等级
        List<BaseDict> levelList = baseDictService.findByTypeCode(baseDictLevels);

        model.addAttribute("sourceList", sourceList);
        model.addAttribute("industryList", industryList);
        model.addAttribute("levelList", levelList);
        return "customer";
    }
}
