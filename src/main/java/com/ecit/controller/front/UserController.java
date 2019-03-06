package com.ecit.controller.front;
import com.ecit.bean.User;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService userService;

    //登录
    @RequestMapping(value="login.do",method =RequestMethod.POST)
    @ResponseBody
    public ResponseData<User> login(HttpSession session, String username, String password){
        if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password))
        {
            return ResponseData.fail("用户名或密码不能为空");
        }
        ResponseData<User> responseData= userService.login(username,password);
        if(responseData.isSuccess())
        {
            session.setAttribute(Const.THIS_USER,responseData.getData());
        }
        return responseData;
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping(value = "register.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData register(User user){
        return userService.register(user);
    }


    /**
     * 验证用户名
     * @param value
     * @param type
     * @return
     */
    @RequestMapping(value = "valid.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<String> checkValid(String value,String type){
        return userService.checkValid(value,type);
    }

    /**
     * 获取登录用户信息
     * @param session
     * @return
     */
    @RequestMapping(value = "get_user_info.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<User> getUserInfo(HttpSession session){
        User user = (User) session.getAttribute(Const.THIS_USER);
        if(user != null){
            return ResponseData.success(user);
        }
        return ResponseData.fail("用户未登录,无法获取当前用户的信息");
    }

    /**
     * 忘记密码
     * @param username
     * @return
     */
    @RequestMapping(value = "forget_get_question.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<String> forgetGetQuestion(String username){
        return userService.selectQuestion(username);
    }

    /**
     * 问题答案
     * @param username
     * @param question
     * @param answer
     * @return
     */
    @RequestMapping(value = "forget_check_answer.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<String> forgetCheckAnswer(String username,String question,String answer){
        return userService.checkAnswer(username,question,answer);
    }

    /**
     * 忘记密码功能中的重设密码
     * @param username
     * @param passwordNew
     * @param forgetToken
     * @return
     */
    @RequestMapping(value = "forget_reset_password.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<String> forgetRestPassword(String username,String passwordNew,String forgetToken){
        return userService.forgetResetPassword(username,passwordNew,forgetToken);
    }


    /**
     * 登录以后之后重新设置密码
     * @param session
     * @param passwordOld
     * @param passwordNew
     * @return
     */
    @RequestMapping(value = "reset_password.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<String> resetPassword(HttpSession session,String passwordOld,String passwordNew){
        User user = (User)session.getAttribute(Const.THIS_USER);
        if(user == null){
            return ResponseData.fail("用户未登录");
        }
        return userService.resetPassword(passwordOld,passwordNew,user);
    }


    /**
     * 登录以后更新个人信息
     * @param session
     * @param user
     * @return
     */
    @RequestMapping(value = "update_information.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<User> update_information(HttpSession session,User user){
        User currentUser = (User)session.getAttribute(Const.THIS_USER);
        if(currentUser == null){
            return ResponseData.fail("用户未登录");
        }
        user.setUserId(currentUser.getUserId());
        user.setUsername(currentUser.getUsername());
        ResponseData<User> response = userService.updateInformation(user);
        if(response.isSuccess()){
            response.getData().setUsername(currentUser.getUsername());
            session.setAttribute(Const.THIS_USER,response.getData());
        }
        return response;
    }

    /**
     * 获取当前登录用户的详细信息，并强制登录
     * @param session
     * @return
     */
    @RequestMapping(value = "get_information.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<User> get_information(HttpSession session){
        User currentUser = (User)session.getAttribute(Const.THIS_USER);
        if(currentUser == null){
            return ResponseData.fail(ResponseCode.NEED_LOGIN,"未登录,需要强制登录");
        }
        return userService.getInformation(currentUser.getUserId());
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "logout.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseData<String> logout(HttpSession session){
        session.removeAttribute(Const.THIS_USER);
        return ResponseData.success();
    }






}






