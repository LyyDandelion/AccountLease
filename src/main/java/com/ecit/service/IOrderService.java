package com.ecit.service;

import com.github.pagehelper.PageInfo;
import com.ecit.common.ResponseData;
import com.ecit.dto.OrderDto;

import java.util.Map;


public interface IOrderService {
    ResponseData pay(Long orderNo, Integer userId, String path);
    ResponseData aliCallback(Map<String, String> params);
    ResponseData queryOrderPayStatus(Integer userId, Long orderNo);
    ResponseData createOrder(Integer userId, Integer shippingId);
    ResponseData<String> cancel(Integer userId, Long orderNo);
    ResponseData getOrderCartProduct(Integer userId);
    ResponseData<OrderDto> getOrderDetail(Integer userId, Long orderNo);
    ResponseData<PageInfo> getOrderList(Integer userId, int pageNum, int pageSize);

    ResponseData<PageInfo>  getOrderList(Integer userId, String orderStatus, int pageNum, int pageSize);


    //backend
    ResponseData<PageInfo> manageList(int pageNum, int pageSize);
    ResponseData<PageInfo> manageList(Integer userId,int pageNum, int pageSize);
    ResponseData<OrderDto> manageDetail(Long orderNo);
    ResponseData<PageInfo> manageSearch(Long orderNo, int pageNum, int pageSize);
    ResponseData<String> manageSendGoods(Long orderNo);


    ResponseData createOrder(Integer userId, Integer productId, Integer quantity);

    ResponseData updateOrderInfo(Integer userId, Long orderNo);

    ResponseData finishOrder(Map<String,Object> param);
}
