package com.ecit.service.impl;

import com.ecit.dto.ProductDetailDto;
import com.ecit.dto.ProductListDto;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.dao.CategoryMapper;
import com.ecit.dao.ProductMapper;
import com.ecit.bean.Category;
import com.ecit.bean.Product;
import com.ecit.service.ICategoryService;
import com.ecit.service.IProductService;
import com.ecit.util.DateTimeUtil;
import com.ecit.util.PropertiesUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
 * lyy
 */
@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductMapper productMapper;


    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ICategoryService iCategoryService;

    public ResponseData saveOrUpdateProduct(Product product) {
        if (product != null) {
            if (StringUtils.isNotBlank(product.getSubImages())) {
                String[] subImageArray = product.getSubImages().split(",");
                if (subImageArray.length > 0) {
                    product.setMainImage(subImageArray[0]);
                }
            }
            //如果有productId,则为更新产品
            if (product.getProductId() != null) {
                int rowCount = productMapper.updateByPrimaryKey(product);
                if (rowCount > 0) {
                    return ResponseData.success("更新产品成功");
                }
                return ResponseData.success("更新产品失败");
            } else {
                int rowCount = productMapper.insert(product);
                if (rowCount > 0) {
                    return ResponseData.success("新增产品成功");
                }
                return ResponseData.success("新增产品失败");
            }
        }
        return ResponseData.fail("新增或更新产品参数不正确");
    }


    public ResponseData<String> setSaleStatus(Integer productId, Integer status) {
        if (productId == null || status == null) {
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT, "ILLEGAL_ARGUMENT");
        }
        Product product = new Product();
        product.setProductId(productId)
                .setStatus(status);
        int rowCount = productMapper.updateByPrimaryKeySelective(product);
        if (rowCount > 0) {
            return ResponseData.success("修改产品销售状态成功");
        }
        return ResponseData.fail("修改产品销售状态失败");
    }

    public ResponseData<String> setSaleStatus(Long userId,Integer productId, Integer status) {
        if (productId == null || status == null) {
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT, "ILLEGAL_ARGUMENT");
        }
        Product product = new Product();
        product.setProductId(productId)
                .setStatus(status).setCreatedBy(userId);
        int rowCount = productMapper.updateByPrimaryKeySelective(product);
        if (rowCount > 0) {
            return ResponseData.success("修改产品销售状态成功");
        }
        return ResponseData.fail("修改产品销售状态失败");
    }


    public ResponseData<ProductDetailDto> manageProductDetail(Integer productId) {
        if (productId == null) {
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT, "ILLEGAL_ARGUMENT");
        }
        Product product = productMapper.selectByPrimaryKey(productId);
        if (product == null) {
            return ResponseData.fail("产品已下架或者删除");
        }
        ProductDetailDto productDetailDto = assembleProductDetailVo(product);
        return ResponseData.success(productDetailDto);
    }

    private ProductDetailDto assembleProductDetailVo(Product product) {
        ProductDetailDto productDetailDto = new ProductDetailDto();
        productDetailDto.setProductId(product.getProductId())
                .setSubtitle(product.getSubtitle())
                .setPrice(product.getPrice())
                .setMainImage(product.getMainImage())
                .setSubImages(product.getSubImages())
                .setCategoryId(product.getCategoryId())
                .setDetail(product.getDetail())
                .setName(product.getName())
                .setStatus(product.getStatus())
                .setStock(product.getStock())
                .setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix", "http://img.happyecit.com/"));

        Category category = categoryMapper.selectByPrimaryKey(product.getCategoryId());
        if (category == null) {
            productDetailDto.setParentCategoryId(0);//默认根节点
        } else {
            productDetailDto.setParentCategoryId(category.getParentId());
        }

        productDetailDto.setCreateTime(DateTimeUtil.dateToStr(product.getCreationDate()))
                .setUpdateTime(DateTimeUtil.dateToStr(product.getLastUpdateDate()));
        return productDetailDto;
    }


    public ResponseData<PageInfo> getProductList(int pageNum, int pageSize) {
        //startPage--start
        //填充自己的sql查询逻辑
        //pageHelper-收尾
        PageHelper.startPage(pageNum, pageSize);
        List<Product> productList = productMapper.selectList();

        List<ProductListDto> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListDto productListDto = assembleProductListVo(productItem);
            productListVoList.add(productListDto);
        }
        PageInfo pageResult = new PageInfo(productList);
        pageResult.setList(productListVoList);
        return ResponseData.success(pageResult);
    }




    public ResponseData<PageInfo> getProductList(Long userId,int pageNum, int pageSize) {
        //startPage--start
        //填充自己的sql查询逻辑
        //pageHelper-收尾
        PageHelper.startPage(pageNum, pageSize);
        List<Product> productList = productMapper.selectByUserId(userId);
        List<ProductListDto> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListDto productListDto = assembleProductListVo(productItem);
            productListVoList.add(productListDto);
        }
        PageInfo pageResult = new PageInfo(productList);
        pageResult.setList(productListVoList);
        return ResponseData.success(pageResult);
    }

    private ProductListDto assembleProductListVo(Product product) {
        ProductListDto productListDto = new ProductListDto();
        productListDto.setProductId(product.getProductId())
                .setName(product.getName())
                .setCategoryId(product.getCategoryId())
                .setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix", "http://img.happyecit.com/"))
                .setMainImage(product.getMainImage())
                .setPrice(product.getPrice())
                .setSubtitle(product.getSubtitle())
                .setStatus(product.getStatus());
        return productListDto;
    }


    public ResponseData<PageInfo> searchProduct(String productName, Integer productId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        if (StringUtils.isNotBlank(productName)) {
            productName = new StringBuilder().append("%").append(productName).append("%").toString();
        }
        List<Product> productList = productMapper.selectByNameAndProductId(productName, productId);
        List<ProductListDto> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListDto productListDto = assembleProductListVo(productItem);
            productListVoList.add(productListDto);
        }
        PageInfo pageResult = new PageInfo(productList);
        pageResult.setList(productListVoList);
        return ResponseData.success(pageResult);
    }


    public ResponseData<ProductDetailDto> getProductDetail(Integer productId) {
        if (productId == null) {
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT, "ILLEGAL_ARGUMENT");
        }
        Product product = productMapper.selectByPrimaryKey(productId);
        if (product == null) {
            return ResponseData.fail("产品已下架或者删除");
        }
        if (product.getStatus() != Const.ProductStatusEnum.ON_SALE.getCode()) {
            return ResponseData.fail("产品已下架或者删除");
        }
        ProductDetailDto productDetailDto = assembleProductDetailVo(product);
        return ResponseData.success(productDetailDto);
    }


    public ResponseData<PageInfo> getProductByKeywordCategory(String keyword, Integer categoryId, int pageNum, int pageSize, String orderBy) {
        if (StringUtils.isBlank(keyword) && categoryId == null) {
            return ResponseData.fail(ResponseCode.ILLEGAL_ARGUMENT, "ILLEGAL_ARGUMENT");
        }
        List<Integer> categoryIdList = new ArrayList<Integer>();

        if (categoryId != null) {
            Category category = categoryMapper.selectByPrimaryKey(categoryId);
            if (category == null && StringUtils.isBlank(keyword)) {
                //没有该分类,并且还没有关键字,这个时候返回一个空的结果集,不报错
                PageHelper.startPage(pageNum, pageSize);
                List<ProductListDto> productListVoList = Lists.newArrayList();
                PageInfo pageInfo = new PageInfo(productListVoList);
                return ResponseData.success(pageInfo);
            }
            categoryIdList = iCategoryService.selectCategoryAndChildrenById(category.getCategoryId()).getData();
        }
        if (StringUtils.isNotBlank(keyword)) {
            keyword = new StringBuilder().append("%").append(keyword).append("%").toString();
        }

        PageHelper.startPage(pageNum, pageSize);
        //排序处理
        if (StringUtils.isNotBlank(orderBy)) {
            if (Const.ProductListOrderBy.FILED_ASC_DESC.contains(orderBy)) {
                String[] orderByArray = orderBy.split("-");
                PageHelper.orderBy(orderByArray[0] + " " + orderByArray[1]);
            }
        }
        List<Product> productList = productMapper.selectByNameAndCategoryIds(StringUtils.isBlank(keyword) ? null : keyword, categoryIdList.size() == 0 ? null : categoryIdList);

        List<ProductListDto> productListVoList = Lists.newArrayList();
        for (Product product : productList) {
            ProductListDto productListDto = assembleProductListVo(product);
            productListVoList.add(productListDto);
        }

        PageInfo pageInfo = new PageInfo(productList);
        pageInfo.setList(productListVoList);
        return ResponseData.success(pageInfo);
    }


}
