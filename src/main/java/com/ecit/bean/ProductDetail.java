package com.ecit.bean;

import java.util.Date;

public class ProductDetail {
    private Long productDetailId;

    private Long productId;

    private String productDetailCode;

    private String productDetailName;

    private String productDetailDesc;

    private String productDetailType;

    private String productDetailStatus;

    private Float productDetailInitPrice;

    private Long productDetailTime;

    private Long productDetailDiscount;

    private String productDetailViolation;

    private Float goodsDiscountPrice;

    private String productDetailRemark;

    private String productDetailReputationLevel;

    private String productDetailMethod;

    private Float productDetailDeposit;

    private Long createdBy;

    private Date creationDate;

    private Long lastUpdatedBy;

    private Date lastUpdateDate;

    public ProductDetail(Long productDetailId, Long productId, String productDetailCode, String productDetailName, String productDetailDesc, String productDetailType, String productDetailStatus, Float productDetailInitPrice, Long productDetailTime, Long productDetailDiscount, String productDetailViolation, Float goodsDiscountPrice, String productDetailRemark, String productDetailReputationLevel, String productDetailMethod, Float productDetailDeposit, Long createdBy, Date creationDate, Long lastUpdatedBy, Date lastUpdateDate) {
        this.productDetailId = productDetailId;
        this.productId = productId;
        this.productDetailCode = productDetailCode;
        this.productDetailName = productDetailName;
        this.productDetailDesc = productDetailDesc;
        this.productDetailType = productDetailType;
        this.productDetailStatus = productDetailStatus;
        this.productDetailInitPrice = productDetailInitPrice;
        this.productDetailTime = productDetailTime;
        this.productDetailDiscount = productDetailDiscount;
        this.productDetailViolation = productDetailViolation;
        this.goodsDiscountPrice = goodsDiscountPrice;
        this.productDetailRemark = productDetailRemark;
        this.productDetailReputationLevel = productDetailReputationLevel;
        this.productDetailMethod = productDetailMethod;
        this.productDetailDeposit = productDetailDeposit;
        this.createdBy = createdBy;
        this.creationDate = creationDate;
        this.lastUpdatedBy = lastUpdatedBy;
        this.lastUpdateDate = lastUpdateDate;
    }

    public ProductDetail() {
        super();
    }

    public Long getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(Long productDetailId) {
        this.productDetailId = productDetailId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductDetailCode() {
        return productDetailCode;
    }

    public void setProductDetailCode(String productDetailCode) {
        this.productDetailCode = productDetailCode == null ? null : productDetailCode.trim();
    }

    public String getProductDetailName() {
        return productDetailName;
    }

    public void setProductDetailName(String productDetailName) {
        this.productDetailName = productDetailName == null ? null : productDetailName.trim();
    }

    public String getProductDetailDesc() {
        return productDetailDesc;
    }

    public void setProductDetailDesc(String productDetailDesc) {
        this.productDetailDesc = productDetailDesc == null ? null : productDetailDesc.trim();
    }

    public String getProductDetailType() {
        return productDetailType;
    }

    public void setProductDetailType(String productDetailType) {
        this.productDetailType = productDetailType == null ? null : productDetailType.trim();
    }

    public String getProductDetailStatus() {
        return productDetailStatus;
    }

    public void setProductDetailStatus(String productDetailStatus) {
        this.productDetailStatus = productDetailStatus == null ? null : productDetailStatus.trim();
    }

    public Float getProductDetailInitPrice() {
        return productDetailInitPrice;
    }

    public void setProductDetailInitPrice(Float productDetailInitPrice) {
        this.productDetailInitPrice = productDetailInitPrice;
    }

    public Long getProductDetailTime() {
        return productDetailTime;
    }

    public void setProductDetailTime(Long productDetailTime) {
        this.productDetailTime = productDetailTime;
    }

    public Long getProductDetailDiscount() {
        return productDetailDiscount;
    }

    public void setProductDetailDiscount(Long productDetailDiscount) {
        this.productDetailDiscount = productDetailDiscount;
    }

    public String getProductDetailViolation() {
        return productDetailViolation;
    }

    public void setProductDetailViolation(String productDetailViolation) {
        this.productDetailViolation = productDetailViolation == null ? null : productDetailViolation.trim();
    }

    public Float getGoodsDiscountPrice() {
        return goodsDiscountPrice;
    }

    public void setGoodsDiscountPrice(Float goodsDiscountPrice) {
        this.goodsDiscountPrice = goodsDiscountPrice;
    }

    public String getProductDetailRemark() {
        return productDetailRemark;
    }

    public void setProductDetailRemark(String productDetailRemark) {
        this.productDetailRemark = productDetailRemark == null ? null : productDetailRemark.trim();
    }

    public String getProductDetailReputationLevel() {
        return productDetailReputationLevel;
    }

    public void setProductDetailReputationLevel(String productDetailReputationLevel) {
        this.productDetailReputationLevel = productDetailReputationLevel == null ? null : productDetailReputationLevel.trim();
    }

    public String getProductDetailMethod() {
        return productDetailMethod;
    }

    public void setProductDetailMethod(String productDetailMethod) {
        this.productDetailMethod = productDetailMethod == null ? null : productDetailMethod.trim();
    }

    public Float getProductDetailDeposit() {
        return productDetailDeposit;
    }

    public void setProductDetailDeposit(Float productDetailDeposit) {
        this.productDetailDeposit = productDetailDeposit;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(Long lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }
}