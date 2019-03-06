package com.ecit.service;

import com.ecit.common.ResponseData;
import com.ecit.dto.CartDto;

/**
 * lyy
 */
public interface ICartService {
    ResponseData<CartDto> add(Integer userId, Integer productId, Integer count);
    ResponseData<CartDto> update(Integer userId, Integer productId, Integer count);
    ResponseData<CartDto> deleteProduct(Integer userId, String productIds);

    ResponseData<CartDto> list(Integer userId);
    ResponseData<CartDto> selectOrUnSelect(Integer userId, Integer productId, String checked);
    ResponseData<Integer> getCartProductCount(Integer userId);
}
