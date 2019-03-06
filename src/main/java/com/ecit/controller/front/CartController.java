package com.ecit.controller.front;

import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.bean.User;
import com.ecit.service.ICartService;
import com.ecit.dto.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * lyy
 */
@Controller
@RequestMapping("/cart/")
public class CartController {

    @Autowired
    private ICartService cartService;



    @RequestMapping("list.do")
    @ResponseBody
    public ResponseData<CartDto> list(HttpSession session){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.list(user.getUserId());
    }

    @RequestMapping("add.do")
    @ResponseBody
    public ResponseData<CartDto> add(HttpSession session, Integer count, Integer productId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.add(user.getUserId(),productId,count);
    }



    @RequestMapping("update.do")
    @ResponseBody
    public ResponseData<CartDto> update(HttpSession session, Integer count, Integer productId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.update(user.getUserId(),productId,count);
    }

    @RequestMapping("delete_product.do")
    @ResponseBody
    public ResponseData<CartDto> deleteProduct(HttpSession session, String productIds){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.deleteProduct(user.getUserId(),productIds);
    }


    @RequestMapping("select_all.do")
    @ResponseBody
    public ResponseData<CartDto> selectAll(HttpSession session){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.selectOrUnSelect(user.getUserId(),null,Const.Cart.CHECKED);
    }

    @RequestMapping("un_select_all.do")
    @ResponseBody
    public ResponseData<CartDto> unSelectAll(HttpSession session){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.selectOrUnSelect(user.getUserId(),null,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("select.do")
    @ResponseBody
    public ResponseData<CartDto> select(HttpSession session, Integer productId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.selectOrUnSelect(user.getUserId(),productId,Const.Cart.CHECKED);
    }

    @RequestMapping("un_select.do")
    @ResponseBody
    public ResponseData<CartDto> unSelect(HttpSession session, Integer productId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return cartService.selectOrUnSelect(user.getUserId(),productId,Const.Cart.UN_CHECKED);
    }



    @RequestMapping("get_cart_product_count.do")
    @ResponseBody
    public ResponseData<Integer> getCartProductCount(HttpSession session){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user ==null){
            return ResponseData.fail("0");
        }
        return cartService.getCartProductCount(user.getUserId());
    }




    //全选
    //全反选

    //单独选
    //单独反选

    //查询当前用户的购物车里面的产品数量,如果一个产品有10个,那么数量就是10.




}
