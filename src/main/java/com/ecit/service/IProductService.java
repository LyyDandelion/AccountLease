package com.ecit.service;

import com.github.pagehelper.PageInfo;
import com.ecit.common.ResponseData;
import com.ecit.bean.Product;
import com.ecit.dto.ProductDetailDto;


public interface IProductService {

    ResponseData saveOrUpdateProduct(Product product);

    ResponseData updatePassword(Product product);

    ResponseData<String> setSaleStatus(Integer productId, Integer status);

    ResponseData<String> setSaleStatus(Long userId,Integer productId, Integer status);

    ResponseData<ProductDetailDto> manageProductDetail(Integer productId);
    ResponseData<ProductDetailDto> manageProductDetail(Long userId,Integer productId);

    ResponseData<PageInfo> getProductList(int pageNum, int pageSize);
    ResponseData<PageInfo> getProductList(Long userId,int pageNum, int pageSize);

    ResponseData<PageInfo> searchProduct(String productName, Integer productId, int pageNum, int pageSize);

    ResponseData<ProductDetailDto> getProductDetail(Long userId,Integer productId);

    ResponseData<PageInfo> getProductByKeywordCategory(Long userId,String isMine,String keyword, Integer categoryId, int pageNum, int pageSize, String orderBy);


}
