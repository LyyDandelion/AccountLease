package com.ecit.controller.front;

import com.github.pagehelper.PageInfo;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.bean.Shipping;
import com.ecit.bean.User;
import com.ecit.service.IShippingService;
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
@RequestMapping("/shipping/")
public class ShippingController {


    @Autowired
    private IShippingService iShippingService;


    @RequestMapping("add.do")
    @ResponseBody
    public ResponseData add(HttpSession session,Shipping shipping){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iShippingService.add(user.getUserId(),shipping);
    }


    @RequestMapping("del.do")
    @ResponseBody
    public ResponseData del(HttpSession session,Integer shippingId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED LOGIN");
        }
        return iShippingService.del(user.getUserId(),shippingId);
    }

    @RequestMapping("update.do")
    @ResponseBody
    public ResponseData update(HttpSession session,Shipping shipping){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED LOGIN");
        }
        return iShippingService.update(user.getUserId(),shipping);
    }


    @RequestMapping("select.do")
    @ResponseBody
    public ResponseData<Shipping> select(HttpSession session,Integer shippingId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iShippingService.select(user.getUserId(),shippingId);
    }


    @RequestMapping("list.do")
    @ResponseBody
    public ResponseData<PageInfo> list(@RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize",defaultValue = "10")int pageSize,
                                         HttpSession session){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iShippingService.list(user.getUserId(),pageNum,pageSize);
    }














}
