package com.ecit.common;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ResponseData<T> {
    private String code;
    private String msg;
    private T data;

    private ResponseData(String code){
        this.code=code;
    }

    private ResponseData(String code,String msg){
        this.code=code;
        this.msg=msg;
    }

    private ResponseData(String code,T data){
        this.code=code;
        this.data=data;
    }

    private ResponseData(String code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public boolean isSuccess(){

        return StringUtils.equals(this.code,ResponseCode.SUCCESS);

    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public static<T> ResponseData<T> success(){
        return new ResponseData<T>(ResponseCode.SUCCESS);
    }

    public static<T> ResponseData<T> fail(){
        return new ResponseData<T>(ResponseCode.FAIL);
    }

    public static<T> ResponseData<T> success(String msg)
    {
        return new ResponseData<T>(ResponseCode.SUCCESS,msg);
    }
    public static<T> ResponseData<T> success(T data)
    {
        return new ResponseData<T>(ResponseCode.SUCCESS,data);
    }

    public static<T> ResponseData<T> success(String msg ,T data){
        return  new ResponseData<T>(ResponseCode.SUCCESS,msg,data);
    }

    public static<T> ResponseData<T> fail(String msg)
    {
        return new ResponseData<T>(ResponseCode.FAIL,msg);
    }

    public static<T> ResponseData<T> fail(String errorCode,String msg)
    {
        return new ResponseData<T>(errorCode,msg);
    }
}
