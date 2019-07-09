package com.yazao.ssm.service.impl;

import com.yazao.ssm.mapper.BaseDictMapper;
import com.yazao.ssm.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseDictServiceImpl implements BaseDictService {


    @Autowired
    private BaseDictMapper baseDictMapper;


    @Override
    public List<com.yazao.ssm.pojo.BaseDict> findByTypeCode(String typeCode) {
        return baseDictMapper.findByTypeCode(typeCode);
    }
}
