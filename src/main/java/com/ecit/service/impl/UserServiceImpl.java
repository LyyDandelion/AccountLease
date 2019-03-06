package com.ecit.service.impl;

import com.ecit.bean.User;
import com.ecit.common.ResponseData;
import com.ecit.common.Const;
import com.ecit.common.TokenConfig;
import com.ecit.dao.UserMapper;
import com.ecit.service.IUserService;
import com.ecit.util.MD5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;


@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 登录
     *
     * @param username
     * @param password
     * @return
     */
    @Override
    public ResponseData<User> login(String username, String password) {
        int resultCount = userMapper.checkUsername(username);
        if (resultCount == 0) {
            return ResponseData.fail("用户名不存在");
        }

        String md5Password = MD5Util.MD5EncodeUtf8(password);
        User user = userMapper.selectLogin(username, md5Password);
        if (user == null) {
            return ResponseData.fail("密码错误");
        }

        user.setPassword(org.apache.commons.lang3.StringUtils.EMPTY);
        return ResponseData.success("登录成功", user);
    }

    /**
     * 注册
     *
     * @param user
     * @return
     */
    @Override
    public ResponseData<String> register(User user) {
        ResponseData validResponse = this.checkValid(user.getUsername(), Const.USERNAME);
        if (!validResponse.isSuccess()) {
            return validResponse;
        }
        validResponse = this.checkValid(user.getEmail(), Const.EMAIL);
        if (!validResponse.isSuccess()) {
            return validResponse;
        }
        user.setRole(Const.Role.ROLE_CUSTOMER);
        //MD5加密
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        int resultCount = userMapper.insert(user);
        if (resultCount == 0) {
            return ResponseData.fail("注册失败");
        }
        return ResponseData.success("注册成功");
    }

    /**
     * 验证用户名
     *
     * @param str
     * @param type
     * @return
     */
    @Override
    public ResponseData<String> checkValid(String str, String type) {
        if (org.apache.commons.lang3.StringUtils.isNotBlank(type)) {
            //开始校验
            if (Const.USERNAME.equals(type)) {
                int resultCount = userMapper.checkUsername(str);
                if (resultCount > 0) {
                    return ResponseData.fail("用户名已存在");
                }
            }
            if (Const.EMAIL.equals(type)) {
                int resultCount = userMapper.checkEmail(str);
                if (resultCount > 0) {
                    return ResponseData.fail("email已存在");
                }
            }
        } else {
            return ResponseData.fail("参数错误");
        }
        return ResponseData.success("校验成功");
    }


    public ResponseData selectQuestion(String username) {
        if(StringUtils.isBlank(username))
        {
            return ResponseData.fail("用户名为空");
        }
        ResponseData validResponse = this.checkValid(username, Const.USERNAME);
        if (validResponse.isSuccess()) {
            //用户不存在
            return ResponseData.fail("用户不存在");
        }
        String question = userMapper.selectQuestionByUsername(username);
        if (org.apache.commons.lang3.StringUtils.isNotBlank(question)) {
            return ResponseData.success(question);
        }
        return ResponseData.fail("找回密码的问题是空的");
    }

    public ResponseData<String> checkAnswer(String username, String question, String answer) {
        int resultCount = userMapper.checkAnswer(username, question, answer);
        if (resultCount > 0) {
            //说明问题及问题答案是这个用户的,并且是正确的
            String forgetToken = UUID.randomUUID().toString();
            TokenConfig.setKey(TokenConfig.TOKEN_PREFIX + username, forgetToken);
            return ResponseData.success(forgetToken);
        }
        return ResponseData.fail("问题的答案错误");
    }


    public ResponseData<String> forgetResetPassword(String username, String passwordNew, String forgetToken) {
        if (org.apache.commons.lang3.StringUtils.isBlank(forgetToken)) {
            return ResponseData.fail("参数错误,token需要传递");
        }
        ResponseData validResponse = this.checkValid(username, Const.USERNAME);
        if (validResponse.isSuccess()) {
            //用户不存在
            return ResponseData.fail("用户不存在");
        }
        String token = TokenConfig.getKey(TokenConfig.TOKEN_PREFIX + username);
        if (org.apache.commons.lang3.StringUtils.isBlank(token)) {
            return ResponseData.fail("token无效或者过期");
        }

        if (org.apache.commons.lang3.StringUtils.equals(forgetToken, token)) {
            String md5Password = MD5Util.MD5EncodeUtf8(passwordNew);
            int rowCount = userMapper.updatePasswordByUsername(username, md5Password);

            if (rowCount > 0) {
                return ResponseData.success("修改密码成功");
            }
        } else {
            return ResponseData.fail("token错误,请重新获取重置密码的token");
        }
        return ResponseData.fail("修改密码失败");
    }


    public ResponseData<String> resetPassword(String passwordOld, String passwordNew, User user) {
        //防止横向越权,要校验一下这个用户的旧密码,一定要指定是这个用户.因为我们会查询一个count(1),如果不指定id,那么结果就是true啦count>0;
        int resultCount = userMapper.checkPassword(MD5Util.MD5EncodeUtf8(passwordOld), user.getUserId());
        if (resultCount == 0) {
            return ResponseData.fail("旧密码错误");
        }

        user.setPassword(MD5Util.MD5EncodeUtf8(passwordNew));
        int updateCount = userMapper.updateByPrimaryKeySelective(user);
        if (updateCount > 0) {
            return ResponseData.success("密码更新成功");
        }
        return ResponseData.fail("密码更新失败");
    }


    public ResponseData<User> updateInformation(User user) {
        //username是不能被更新的
        //email也要进行一个校验,校验新的email是不是已经存在,并且存在的email如果相同的话,不能是我们当前的这个用户的.
        int resultCount = userMapper.checkEmailByUserId(user.getEmail(), user.getUserId());
        if (resultCount > 0) {
            return ResponseData.fail("email已存在,请更换email再尝试更新");
        }
        User updateUser = new User();
        updateUser.setUserId(user.getUserId())
                .setEmail(user.getEmail())
                .setPhone(user.getPhone())
                .setQuestion(user.getQuestion())
                .setAnswer(user.getAnswer());

        int updateCount = userMapper.updateByPrimaryKeySelective(updateUser);
        if (updateCount > 0) {
            return ResponseData.success("更新个人信息成功", updateUser);
        }
        return ResponseData.fail("更新个人信息失败");
    }


    public ResponseData<User> getInformation(Integer userId) {
        User user = userMapper.selectByPrimaryKey(userId);
        if (user == null) {
            return ResponseData.fail("找不到当前用户");
        }
        user.setPassword(org.apache.commons.lang3.StringUtils.EMPTY);
        return ResponseData.success(user);

    }


    /**
     * 校验是否是管理员
     *
     * @param user
     * @return
     */
    public ResponseData checkAdminRole(User user) {
        if (user != null && user.getRole().intValue() == Const.Role.ROLE_ADMIN) {
            return ResponseData.success();
        }
        return ResponseData.fail();
    }


    /**
     * 校验是否为买家
     * @param user
     * @return
     */
    public ResponseData checkBuyerRole(User user)
    {
        if(user!=null&&user.getRole().intValue()==Const.Role.ROLE_BUYER)
        {
            return ResponseData.success();
        }
        return ResponseData.fail();
    }

    /**
     * 校验是否为商家
     * @param user
     * @return
     */
    public ResponseData checkBusinessRole(User user)
    {
        if(user!=null&&user.getRole().intValue()==Const.Role.ROLE_BUSINESS)
        {
            return ResponseData.success();
        }
        return ResponseData.fail();
    }
}
