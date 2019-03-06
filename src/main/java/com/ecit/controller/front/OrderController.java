package com.ecit.controller.front;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.internal.util.StringUtils;
import com.alipay.demo.trade.config.Configs;
import com.google.common.collect.Maps;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.bean.User;
import com.ecit.service.IOrderService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Map;



/**
 * 订单管理
 */
@Controller
@RequestMapping("/order/")
public class OrderController {

    private static  final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private IOrderService iOrderService;

    /**
     * 前端传入
     * @param session
     * @param shippingId
     * @return
     */
    @RequestMapping("create.do")
    @ResponseBody
    public ResponseData create(HttpSession session, Integer shippingId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iOrderService.createOrder(user.getUserId(),shippingId);
    }

    /**
     * 前端传入
     * @param session
     * @param productId
     * @return
     */
    @RequestMapping(value = "create_order.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData createOrder(HttpSession session,Integer productId,Integer quantity){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iOrderService.createOrder(user.getUserId(),productId,quantity);
    }

    @RequestMapping("cancel.do")
    @ResponseBody
    public ResponseData cancel(HttpSession session, Long orderNo){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iOrderService.cancel(user.getUserId(),orderNo);
    }


    @RequestMapping("get_order_cart_product.do")
    @ResponseBody
    public ResponseData getOrderCartProduct(HttpSession session){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iOrderService.getOrderCartProduct(user.getUserId());
    }



    @RequestMapping("detail.do")
    @ResponseBody
    public ResponseData detail(HttpSession session,Long orderNo){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return iOrderService.getOrderDetail(user.getUserId(),orderNo);
    }

    @RequestMapping("list.do")
    @ResponseBody
    public ResponseData list(HttpSession session,@RequestParam(value = "orderStatus",defaultValue = "ALL")String orderStatus, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        if(orderStatus.equals("ALL"))
        {
            //所有状态
            return iOrderService.getOrderList(user.getUserId(),pageNum,pageSize);
        }
        //具体状态
        return iOrderService.getOrderList(user.getUserId(),orderStatus,pageNum,pageSize);
    }

    @RequestMapping("pay.do")
    @ResponseBody
    public ResponseData pay(HttpSession session, Long orderNo, HttpServletRequest request){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        String path = request.getSession().getServletContext().getRealPath("/upload");
        return iOrderService.pay(orderNo,user.getUserId(),path);
    }

    @RequestMapping("alipay_callback.do")
    @ResponseBody
    public Object alipayCallback(HttpServletRequest request){
        Map<String,String> params = Maps.newHashMap();

        Map requestParams = request.getParameterMap();
        for(Iterator iter = requestParams.keySet().iterator();iter.hasNext();){
            String name = (String)iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for(int i = 0 ; i <values.length;i++){

                valueStr = (i == values.length -1)?valueStr + values[i]:valueStr + values[i]+",";
            }
            params.put(name,valueStr);
        }
        logger.info("支付宝回调,sign:{},trade_status:{},参数:{}",params.get("sign"),params.get("trade_status"),params.toString());

        //非常重要,验证回调的正确性,是不是支付宝发的.并且呢还要避免重复通知.

        params.remove("sign_type");
        try {
            boolean alipayRSACheckedV2 = AlipaySignature.rsaCheckV2(params, Configs.getAlipayPublicKey(),"utf-8",Configs.getSignType());

            if(!alipayRSACheckedV2){
                return ResponseData.fail("非法请求,验证不通过,再恶意请求我就报警找网警了");
            }
        } catch (AlipayApiException e) {
            logger.error("支付宝验证回调异常",e);
        }

        //todo 验证各种数据


        //
        ResponseData ResponseData = iOrderService.aliCallback(params);
        if(ResponseData.isSuccess()){
            return Const.AlipayCallback.RESPONSE_SUCCESS;
        }
        return Const.AlipayCallback.RESPONSE_FAILED;
    }


    @RequestMapping("query_order_pay_status.do")
    @ResponseBody
    public ResponseData<Boolean> queryOrderPayStatus(HttpSession session, Long orderNo){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }

        ResponseData ResponseData = iOrderService.queryOrderPayStatus(user.getUserId(),orderNo);
        if(ResponseData.isSuccess()){
            return ResponseData.success(true);
        }
        return ResponseData.success(false);
    }

}
