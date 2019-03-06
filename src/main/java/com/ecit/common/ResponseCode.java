package com.ecit.common;

public interface ResponseCode {
    //成功
    public final static String SUCCESS="200";
    //失败
    public final static String FAIL="100";
    //需要登录
    public final static String NEED_LOGIN="300";
    //非法参数
    public final static String ILLEGAL_ARGUMENT="400";
}
