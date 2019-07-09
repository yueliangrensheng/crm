package com.yazao.ssm.mapper;

import com.yazao.ssm.pojo.BaseDict;

import java.util.List;

public interface BaseDictMapper {

    /**
     *  查询 可选择的条件 结果
     * @param typeCode
     * @return
     */
    public List<BaseDict> findByTypeCode(String typeCode);
}
