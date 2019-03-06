package com.ecit.service;

import com.github.pagehelper.PageInfo;
import com.ecit.common.ResponseData;
import com.ecit.bean.Shipping;

public interface IShippingService {

    ResponseData add(Integer userId, Shipping shipping);
    ResponseData<String> del(Integer userId, Integer shippingId);
    ResponseData update(Integer userId, Shipping shipping);
    ResponseData<Shipping> select(Integer userId, Integer shippingId);
    ResponseData<PageInfo> list(Integer userId, int pageNum, int pageSize);

}
