package com.yazao.ssm.mapper;

import com.yazao.ssm.pojo.Customer;
import com.yazao.ssm.pojo.QueryVo;

import java.util.List;

public interface CustomerMapper {

    public List<Customer> findByPage(QueryVo queryVo);

    public int findTotalCount(QueryVo queryVo);

    Customer findById(long id);

    void update(Customer customer);

    void delete(long id);
}
