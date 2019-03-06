package com.ecit.service.impl;

import com.ecit.common.ResponseData;
import com.ecit.dao.SysCodeValueMapper;
import com.ecit.dto.SysCodeDto;
import com.ecit.service.ISysCodeService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysCodeServiceImpl implements ISysCodeService {

    @Autowired
    private SysCodeValueMapper sysCodeValueMapper;


    @Override
    public ResponseData<PageInfo> getView(String code) {
        if(StringUtils.isBlank(code))
        {
            return ResponseData.fail("is null");

        }
        List<SysCodeDto> list=sysCodeValueMapper.getCodeView(code);
        PageInfo pageInfo=new PageInfo(list);
        return ResponseData.success(pageInfo);
    }
}
