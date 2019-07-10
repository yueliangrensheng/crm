package com.yazao.ssm.controller;

import com.yazao.ssm.pojo.BaseDict;
import com.yazao.ssm.pojo.Customer;
import com.yazao.ssm.pojo.QueryVo;
import com.yazao.ssm.service.BaseDictService;
import com.yazao.ssm.service.CustomerService;
import com.yazao.ssm.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/list")
    public String list(QueryVo queryVo, Model model) {

        //初始化条件查询的数据
        //客户来源
        List<BaseDict> sourceList = baseDictService.findByTypeCode(baseDictSource);
        //客户行业
        List<BaseDict> industryList = baseDictService.findByTypeCode(baseDictIndustry);
        //客户等级
        List<BaseDict> levelList = baseDictService.findByTypeCode(baseDictLevels);

        model.addAttribute("sourceList", sourceList);
        model.addAttribute("industryList", industryList);
        model.addAttribute("levelList", levelList);


        //加载分页数据
        PageBean pageBean = customerService.findByPage(queryVo);
        model.addAttribute("page", pageBean); //page： 根据customer.jsp页面中的获取数据的参数定


        //回显数据 --- 选择查询条件后 结果后，页面上的查询条件依然显示 所选的条件
        model.addAttribute("custSource", queryVo.getCustSource());
        model.addAttribute("custIndustry", queryVo.getCustIndustry()); // custIndustry： 根据customer.jsp页面中的获取数据的参数定
        model.addAttribute("custLevel", queryVo.getCustLevel());
        model.addAttribute("custName", queryVo.getCustName());

        return "customer";
    }


    @RequestMapping(value = "/edit")
    @ResponseBody
    public Customer edit(long id){
        Customer customer = customerService.findById(id);
        return customer;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public boolean update(Customer customer){
        return customerService.update(customer);
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public boolean delete(long id){
        return customerService.delete(id);
    }
}
