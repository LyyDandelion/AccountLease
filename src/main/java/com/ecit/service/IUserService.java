package com.ecit.service;

import com.ecit.bean.User;
import com.ecit.common.ResponseData;

public interface IUserService {




    ResponseData<User> login(String username, String password);

    ResponseData<String> register(User user);

    ResponseData<String> checkValid(String str,String type);

    ResponseData selectQuestion(String username);

    ResponseData<String> checkAnswer(String username,String question,String answer);

    ResponseData<String> forgetResetPassword(String username,String passwordNew,String forgetToken);

    ResponseData<String> resetPassword(String passwordOld,String passwordNew,User user);

    ResponseData<User> updateInformation(User user);

    ResponseData<User> getInformation(Integer userId);

    ResponseData checkAdminRole(User user);

    ResponseData checkBuyerRole(User user);

    ResponseData checkBusinessRole(User user);

}
