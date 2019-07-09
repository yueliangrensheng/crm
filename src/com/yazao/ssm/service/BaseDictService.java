package com.yazao.ssm.service;

import java.util.List;

public interface BaseDictService {
    /**
     *  查询 可选择的条件 结果
     * @param typeCode
     * @return
     */
    public List<com.yazao.ssm.pojo.BaseDict> findByTypeCode(String typeCode);
}
