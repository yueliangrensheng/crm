package com.yazao.ssm.service.impl;

import com.yazao.ssm.mapper.CustomerMapper;
import com.yazao.ssm.pojo.Customer;
import com.yazao.ssm.pojo.QueryVo;
import com.yazao.ssm.service.CustomerService;
import com.yazao.ssm.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {


    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public PageBean findByPage(QueryVo queryVo) {

        //设置默认的初始值
        if (queryVo.getCurrentPage() == 0) {
            queryVo.setCurrentPage(1);
        }
        if (queryVo.getPageSize() == 0) {
            queryVo.setPageSize(5);
        }

        queryVo.setStart(queryVo.getPageSize() * (queryVo.getCurrentPage() - 1));

        List<Customer> list = customerMapper.findByPage(queryVo);
        int totalCount = customerMapper.findTotalCount(queryVo);


        PageBean pageBean = new PageBean();
        pageBean.setCurrentPage(queryVo.getCurrentPage());
        pageBean.setList(list);
        pageBean.setPageSize(queryVo.getPageSize());
        pageBean.setTotalCount(totalCount);

        return pageBean;
    }

    @Override
    public Customer findById(long id) {
        return customerMapper.findById(id);
    }

    @Override
    public boolean update(Customer customer) {

        try {
            customerMapper.update(customer);
            return true;
        } catch (Exception e) {
            return false;
        } finally {
        }
    }

    @Override
    public boolean delete(long id) {

        try {
            customerMapper.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        } finally {

        }
    }
}
