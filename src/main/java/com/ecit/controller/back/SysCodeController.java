package com.ecit.controller.back;

import com.ecit.bean.User;
import com.ecit.common.Const;
import com.ecit.common.ResponseCode;
import com.ecit.common.ResponseData;
import com.ecit.service.ISysCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/back/sysCode/")
public class SysCodeController {


    @Autowired
    private ISysCodeService iSysCodeService;

    @RequestMapping("get_sys_code_view.do")
    @ResponseBody
    public ResponseData getSysCodeView(HttpSession session,String code){
        User user=(User)session.getAttribute(Const.THIS_USER);
        if(user==null)
        {
            ResponseData.fail(ResponseCode.NEED_LOGIN,"NEED_LOGIN");
        }
        return  iSysCodeService.getView(code);
    }

}
