package com.yazao.ssm.service;

import com.yazao.ssm.pojo.QueryVo;
import com.yazao.ssm.utils.PageBean;

public interface CustomerService {

    public PageBean findByPage(QueryVo queryVo);

}
