package com.ecit.controller.back;

import com.ecit.dto.ProductDetailDto;
import com.google.common.collect.Maps;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.bean.Product;
import com.ecit.bean.User;
import com.ecit.service.IFileService;
import com.ecit.service.IProductService;
import com.ecit.service.IUserService;
import com.ecit.util.PropertiesUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * lyy
 */

@Controller
@RequestMapping("/back/product")
public class ProductBackController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IFileService fileService;

    /**
     * 产品新增或更新
     *
     * @param session
     * @param product
     * @return
     */
    @RequestMapping("save.do")
    @ResponseBody
    public ResponseData productSave(HttpSession session, Product product){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
//            //填充我们增加产品的业务逻辑
            return productService.saveOrUpdateProduct(product);
        }else{
            product.setCreatedBy(user.getUserId().longValue());
            product.setLastUpdatedBy(user.getUserId().longValue());
            return productService.saveOrUpdateProduct(product);
        }
    }

    /**
     * 更新密码
     * @param session
     * @param product
     * @return
     */
    @RequestMapping(value="update_password.do",method = RequestMethod.PUT)
    @ResponseBody
    public ResponseData updatePassword(HttpSession session, Product product){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");
        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充我们增加产品的业务逻辑
            return productService.saveOrUpdateProduct(product);
        }else{
            product.setLastUpdatedBy(user.getUserId().longValue());
            return productService.updatePassword(product);
        }
    }


    /**
     * 修改状态
     * @param session
     * @param productId
     * @param status
     * @return
     */
    @RequestMapping(value = "set_sale_status.do",method=RequestMethod.POST)
    @ResponseBody
    public ResponseData setSaleStatus(HttpSession session, Integer productId,Integer status){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");
        }
        //TODO 权限判断，直接放开，预留
        if(userService.checkAdminRole(user).isSuccess()){
            return productService.setSaleStatus(productId,status);
        }else{
             return productService.setSaleStatus(user.getUserId().longValue(),productId,status);
        }
    }


    @RequestMapping("detail.do")
    @ResponseBody
    public ResponseData getDetail(HttpSession session, Integer productId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
            //权限
            return productService.manageProductDetail(productId);
        }else{
            return productService.manageProductDetail(user.getUserId().longValue(),productId);
        }
    }

    @RequestMapping("get_list.do")
    @ResponseBody
    public ResponseData getList(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充业务
            return productService.getProductList(pageNum,pageSize);
        }else{
            return productService.getProductList(user.getUserId().longValue(),pageNum,pageSize);
        }
    }

    @RequestMapping("get_list_for_status.do")
    @ResponseBody
    public ResponseData getListForStatus(HttpSession session,@RequestParam(value="status",defaultValue="-1")String status , @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");
        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充业务
            return productService.getProductList(pageNum,pageSize);
        }else{
            return productService.getProductList(user.getUserId().longValue(),Integer.parseInt(status),pageNum,pageSize);
        }
    }
    /**
     * 查询
     * @param session
     * @param productName
     * @param productId
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("search.do")
    @ResponseBody
    public ResponseData productSearch(HttpSession session,String productName,Integer productId, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,@RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");

        }
        if(userService.checkAdminRole(user).isSuccess()){
            //填充业务
            return productService.searchProduct(productName,productId,pageNum,pageSize);
        }else{
            return ResponseData.fail("无权限操作");
        }
    }


    /**
     * 文件上传
     * @param session
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value="upload.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData upload(HttpSession session,@RequestParam(value = "upload_file",required = false) MultipartFile file,HttpServletRequest request){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录管理员");
        }
//        if(userService.checkAdminRole(user).isSuccess()){
            String path = request.getSession().getServletContext().getRealPath("/upload");
            String targetFileName = fileService.upload(file,path);
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix")+targetFileName;

            Map fileMap = Maps.newHashMap();
            fileMap.put("uri",targetFileName);
            fileMap.put("url",url);
            return ResponseData.success(fileMap);
//        }else{
//            return ResponseData.fail("无权限操作");
//        }
    }

    /**
     * 富文本文件
     * @param session
     * @param file
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("richtext_img_upload.do")
    @ResponseBody
    public Map richtextImgUpload(HttpSession session, @RequestParam(value = "upload_file",required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response){
        Map resultMap = Maps.newHashMap();
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            resultMap.put("success",false);
            resultMap.put("msg","请登录管理员");
            return resultMap;
        }
        //富文本中对于返回值有自己的要求,我们使用是simditor所以按照simditor的要求进行返回
//        {
//            "success": true/false,
//                "msg": "error message", # optional
//            "file_path": "[real file path]"
//        }
        if(userService.checkAdminRole(user).isSuccess()){
            String path = request.getSession().getServletContext().getRealPath("/upload");
            String targetFileName = fileService.upload(file,path);
            if(StringUtils.isBlank(targetFileName)){
                resultMap.put("success",false);
                resultMap.put("msg","上传失败");
                return resultMap;
            }
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix")+targetFileName;
            resultMap.put("success",true);
            resultMap.put("msg","上传成功");
            resultMap.put("file_path",url);
            response.addHeader("Access-Control-Allow-Headers","X-File-Name");
            return resultMap;
        }else{
            resultMap.put("success",false);
            resultMap.put("msg","无权限操作");
            return resultMap;
        }
    }
}
