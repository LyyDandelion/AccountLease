package com.ecit.service;

import com.ecit.common.ResponseData;
import com.ecit.dto.SysCodeDto;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ISysCodeService {
    ResponseData<PageInfo> getView(String code);


}
