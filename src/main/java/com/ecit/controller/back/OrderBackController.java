package com.ecit.controller.back;

import com.github.pagehelper.PageInfo;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.bean.User;
import com.ecit.service.IOrderService;
import com.ecit.service.IUserService;
import com.ecit.dto.OrderDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * lyy
 */

@Controller
@RequestMapping("/back/order")
public class OrderBackController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IOrderService orderService;

    @RequestMapping("list.do")
    @ResponseBody
    public ResponseData<PageInfo> orderList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                              @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){

        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充我们增加产品的业务逻辑
            return orderService.manageList(pageNum,pageSize);
        }else{
            return ResponseData.fail("无权限操作");
        }
    }

    @RequestMapping("detail.do")
    @ResponseBody
    public ResponseData<OrderDto> orderDetail(HttpSession session, Long orderNo){

        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充我们增加产品的业务逻辑

            return null;// iOrderService.manageDetail(orderNo);
        }else{
            return ResponseData.fail("无权限操作");
        }
    }



    @RequestMapping("search.do")
    @ResponseBody
    public ResponseData<PageInfo> orderSearch(HttpSession session, Long orderNo,@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                               @RequestParam(value = "pageSize",defaultValue = "10")int pageSize){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充我们增加产品的业务逻辑
            return orderService.manageSearch(orderNo,pageNum,pageSize);
        }else{
            return ResponseData.fail("无权限操作");
        }
    }



    @RequestMapping("send_goods.do")
    @ResponseBody
    public ResponseData<String> orderSendGoods(HttpSession session, Long orderNo){

        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充我们增加产品的业务逻辑
            return orderService.manageSendGoods(orderNo);
        }else{
            return ResponseData.fail("无权限操作");
        }
    }
}
