package com.ecit.dao;

import com.ecit.bean.SysCodeValue;
import com.ecit.common.ResponseData;
import com.ecit.dto.SysCodeDto;

import java.util.List;

public interface SysCodeValueMapper {
    int deleteByPrimaryKey(Long codeValueId);

    int insert(SysCodeValue record);

    int insertSelective(SysCodeValue record);

    SysCodeValue selectByPrimaryKey(Long codeValueId);

    int updateByPrimaryKeySelective(SysCodeValue record);

    int updateByPrimaryKey(SysCodeValue record);

    List<SysCodeDto> getCodeView(String code);
}