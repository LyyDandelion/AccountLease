package com.ecit.dao;

import com.ecit.bean.ProductDetail;

public interface ProductDetailMapper {
    int deleteByPrimaryKey(Long productDetailId);

    int insert(ProductDetail record);

    int insertSelective(ProductDetail record);

    ProductDetail selectByPrimaryKey(Long productDetailId);

    int updateByPrimaryKeySelective(ProductDetail record);

    int updateByPrimaryKey(ProductDetail record);
}