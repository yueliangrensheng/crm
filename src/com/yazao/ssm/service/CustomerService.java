package com.yazao.ssm.service;

import com.yazao.ssm.pojo.Customer;
import com.yazao.ssm.pojo.QueryVo;
import com.yazao.ssm.utils.PageBean;

public interface CustomerService {

    public PageBean findByPage(QueryVo queryVo);

    Customer findById(long id);

    boolean update(Customer customer);

    boolean delete(long id);
}
