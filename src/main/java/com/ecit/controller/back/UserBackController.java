package com.ecit.controller.back;
import com.ecit.common.Const;
import com.ecit.common.ResponseData;
import com.ecit.bean.User;
import com.ecit.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/back/user")
public class UserBackController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value="login.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<User> login(String username, String password, HttpSession session){
        ResponseData<User> response = userService.login(username,password);
        if(response.isSuccess()){
            User user = response.getData();
            if(user.getRole() == Const.Role.ROLE_ADMIN){
                //说明登录的是管理员
                session.setAttribute(Const.THIS_USER,user);
                return response;
            }else{
                return ResponseData.fail("不是管理员,无法登录");
            }
        }
        return response;
    }

}
