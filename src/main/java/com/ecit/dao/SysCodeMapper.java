package com.ecit.dao;

import com.ecit.bean.SysCode;

public interface SysCodeMapper {
    int deleteByPrimaryKey(Long codeId);

    int insert(SysCode record);

    int insertSelective(SysCode record);

    SysCode selectByPrimaryKey(Long codeId);

    int updateByPrimaryKeySelective(SysCode record);

    int updateByPrimaryKey(SysCode record);
}