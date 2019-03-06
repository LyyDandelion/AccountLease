package com.ecit.controller.back;

import com.ecit.bean.Category;
import com.ecit.bean.User;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.service.ICategoryService;
import com.ecit.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


/**
 * 分类
 *
 */
@Controller
@RequestMapping("/back/category/")
public class CategoryBackController {
    @Autowired
    private IUserService userService;

    @Autowired
    private ICategoryService categoryService;

    /**
     * 增加分类节点
     * @param session
     * @param categoryName
     * @param parentId
     * @return
     */
    @RequestMapping("add_category.do")
    @ResponseBody
    public ResponseData addCategory(HttpSession session,String categoryName,@RequestParam(value = "parentId",defaultValue = "0") int parentId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录");
        }
        //校验一下是否是管理员
        if(userService.checkAdminRole(user).isSuccess()){
            //是管理员
            //增加我们处理分类的逻辑
            return categoryService.addCategory(categoryName,parentId);

        }else{
            return ResponseData.fail("无权限操作,需要管理员权限");
        }
    }

    /**
     * 更新分类节点名
     * @param session
     * @param categoryId
     * @param categoryName
     * @return
     */
    @RequestMapping("update_category_name.do")
    @ResponseBody
    public ResponseData updateCategoryName(HttpSession session,Integer categoryId,String categoryName){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录");
        }
        if(userService.checkAdminRole(user).isSuccess()){
            //更新categoryName
            return categoryService.updateCategoryName(categoryId,categoryName);
        }else{
            return ResponseData.fail("无权限操作,需要管理员权限");
        }
    }

    /**
     * 获取分类
     * @param session
     * @param categoryId
     * @return
     */
    @RequestMapping("get_category.do")
    @ResponseBody
    public ResponseData getChildrenParallelCategory(HttpSession session,@RequestParam(value = "categoryId" ,defaultValue = "0") Integer categoryId,@RequestParam(value = "code",defaultValue = "") String code){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录");
        }
        ResponseData<Category> responseData=categoryService.getCategoryByCode(code);
        int id=  responseData.getData().getCategoryId();
        return categoryService.getChildrenParallelCategory(id);
//        if(userService.checkAdminRole(user).isSuccess()){
//            //查询子节点的category信息,并且不递归,保持平级
//            return categoryService.getChildrenParallelCategory(categoryId);
//        }
//        else if(userService.checkBuyerRole(user).isSuccess())
//        {
//           ResponseData<Category> responseData=categoryService.getCategoryByCode(code);
//            int id=  responseData.getData().getCategoryId();
//            return categoryService.getChildrenParallelCategory(id);
//        }
//        else{
//            return ResponseData.fail("无权限操作,需要管理员权限");
//        }
    }

    /**
     * 根据code获取当前节点信息
     * @param session
     * @param code
     * @return
     */
    @RequestMapping("get_category_info.do")
    @ResponseBody
    public ResponseData getCategoryInfo(HttpSession session,@RequestParam(value = "code") String code){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录");
        }
        return categoryService.getCategoryByCode(code);
    }

    @RequestMapping("get_deep_category.do")
    @ResponseBody
    public ResponseData getCategoryAndDeepChildrenCategory(HttpSession session, @RequestParam(value = "categoryId" ,defaultValue = "0") Integer categoryId){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"用户未登录,请登录");
        }
        if(userService.checkAdminRole(user).isSuccess()){
            //查询当前节点的id和递归子节点的id
//            0->10000->100000
            return categoryService.selectCategoryAndChildrenById(categoryId);

        }else{
            return ResponseData.fail("无权限操作,需要管理员权限");
        }
    }






}
