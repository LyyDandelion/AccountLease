package com.ecit.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import com.ecit.common.ResponseData;
import com.ecit.dao.ShippingMapper;
import com.ecit.bean.Shipping;
import com.ecit.service.IShippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * lyy
 */
@Service
public class ShippingServiceImpl implements IShippingService {


    @Autowired
    private ShippingMapper shippingMapper;

    public ResponseData add(Integer userId, Shipping shipping){
        shipping.setUserId(userId);
        int rowCount = shippingMapper.insert(shipping);
        if(rowCount > 0){
            Map result = Maps.newHashMap();
            result.put("shippingId",shipping.getShippingId());
            return ResponseData.success("新建地址成功",result);
        }
        return ResponseData.fail("新建地址失败");
    }

    public ResponseData<String> del(Integer userId,Integer shippingId){
        int resultCount = shippingMapper.deleteByShippingIdUserId(userId,shippingId);
        if(resultCount > 0){
            return ResponseData.success("删除地址成功");
        }
        return ResponseData.fail("删除地址失败");
    }


    public ResponseData update(Integer userId, Shipping shipping){
        shipping.setUserId(userId);
        int rowCount = shippingMapper.updateByShipping(shipping);
        if(rowCount > 0){
            return ResponseData.success("更新地址成功");
        }
        return ResponseData.fail("更新地址失败");
    }

    public ResponseData<Shipping> select(Integer userId, Integer shippingId){
        Shipping shipping = shippingMapper.selectByShippingIdUserId(userId,shippingId);
        if(shipping == null){
            return ResponseData.fail("无法查询到该地址");
        }
        return ResponseData.success("更新地址成功",shipping);
    }


    public ResponseData<PageInfo> list(Integer userId,int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Shipping> shippingList = shippingMapper.selectByUserId(userId);
        PageInfo pageInfo = new PageInfo(shippingList);
        return ResponseData.success(pageInfo);
    }







}
