package com.yuw.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonControl {

    /**
     * 执行服务器端转发跳转动作
     *
     * @param pg 转发的目标路径[注意:不包含视图解析的前后缀]
     * @return 返回目标页面
     */
    @RequestMapping("/forward")
    public String doForward(String pg) {
        return pg;
    }
}
