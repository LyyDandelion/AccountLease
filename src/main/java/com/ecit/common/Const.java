package com.ecit.common;

import com.google.common.collect.Sets;
import org.apache.commons.lang3.StringUtils;

import java.util.Set;

public class Const {

    public static final String THIS_USER = "thisUser";
    public static final String EMAIL = "email";
    public static final String USERNAME = "username";

    public interface Role{
        int ROLE_CUSTOMER = 0; //普通用户
        int ROLE_ADMIN = 1;//管理员
        int ROLE_BUYER =2;//买家
        int ROLE_BUSINESS=3;//商家
    }

    public interface Cart{
        String CHECKED = "Y";//即购物车选中状态
        String UN_CHECKED = "N";//购物车中未选中状态

        String LIMIT_NUM_FAIL = "LIMIT_NUM_FAIL";
        String LIMIT_NUM_SUCCESS = "LIMIT_NUM_SUCCESS";
    }



    public enum ProductStatusEnum{
        ON_SALE(1,"在售"),
        UN_SALE(2,"下架"),
        DELETE(3,"删除"),
        RENTING(4,"出租中");

        private String value;
        private int code;
        ProductStatusEnum(int code,String value){
            this.code = code;
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }
    }


    public enum OrderStatusEnum{
        CANCELED("CANCEL","已取消"),
        NO_PAY("NO_PAY","未支付"),
        PAID("PAID","已支付"),
        SHIPPED("SHIPPED","已发货"),
        ORDER_SUCCESS("SUCCESS","订单完成"),
        ORDER_CLOSE("CLOSED","订单关闭")
        ;


        OrderStatusEnum(String code,String value){
            this.code = code;
            this.value = value;
        }
        private String value;
        private String code;

        public String getValue() {
            return value;
        }

        public String getCode() {
            return code;
        }

        public static OrderStatusEnum codeOf(String code){
            for(OrderStatusEnum orderStatusEnum : values()){
                if(StringUtils.equals(orderStatusEnum.getCode(),code)){
                    return orderStatusEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }
    }
    public interface  AlipayCallback{
        String TRADE_STATUS_WAIT_BUYER_PAY = "WAIT_BUYER_PAY";
        String TRADE_STATUS_TRADE_SUCCESS = "TRADE_SUCCESS";

        String RESPONSE_SUCCESS = "success";
        String RESPONSE_FAILED = "failed";
    }



    public enum PayPlatformEnum{
        ALIPAY(1,"支付宝");

        PayPlatformEnum(int code,String value){
            this.code = code;
            this.value = value;
        }
        private String value;
        private int code;

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }
    }

    public interface  PaymentType{
        int ONLINE_PAY=1;

    }
    public enum PaymentTypeEnum{
        ONLINE_PAY(1,"在线支付");

        PaymentTypeEnum(int code,String value){
            this.code = code;
            this.value = value;
        }
        private String value;
        private int code;

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }


        public static PaymentTypeEnum codeOf(int code){
            for(PaymentTypeEnum paymentTypeEnum : values()){
                if(paymentTypeEnum.getCode() == code){
                    return paymentTypeEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }

    }

    public interface ProductListOrderBy{
        Set<String> FILED_ASC_DESC = Sets.newHashSet("price-desc","price-asc","last_update_date-desc","last_update_date-asc");

    }

}
