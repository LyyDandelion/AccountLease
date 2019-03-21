package com.ecit.controller.front;

import com.ecit.bean.User;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.dto.ProductDetailDto;
import com.github.pagehelper.PageInfo;
import com.ecit.common.ResponseData;
import com.ecit.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * lyy
 * 前台产品模块
 */
@Controller
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private IProductService iProductService;

    @RequestMapping("detail.do")
    @ResponseBody
    public ResponseData<ProductDetailDto> detail(HttpSession session,Integer productId) {
        User user= (User)session.getAttribute(Const.THIS_USER);
        if(user==null)
        {
            return  ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }

        return iProductService.getProductDetail(user.getUserId().longValue(),productId);
    }

    @RequestMapping("list.do")
    @ResponseBody
    public ResponseData<PageInfo> list(HttpSession session, @RequestParam(value = "keyword", required = false) String keyword,
                                       @RequestParam(value = "categoryId", required = false) Integer categoryId,
                                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                       @RequestParam(value = "orderBy", defaultValue = "") String orderBy) {
        User user=(User)session.getAttribute(Const.THIS_USER);
        if(user==null)
        {
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }

        //目前接口默认查询所有
        return iProductService.getProductByKeywordCategory(user.getUserId().longValue(),null,keyword, categoryId, pageNum, pageSize, orderBy);
    }




}
