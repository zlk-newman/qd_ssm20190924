package com.yuw.control;

import com.yuw.bean.UserInfoBean;
import com.yuw.service.IUserInfoService;
import com.yuw.utils.MyUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class UserLoginControl {

    @Resource
    private IUserInfoService userInfoService;

    /*
    映射关系：要求实体类的属性名和前台页面的表单控件的name属性值一一对应
    课堂作业：
        如果使用 @RequestParam 对方法参数进行绑定，是否可行？
     */
    @RequestMapping("/login4")
    public ModelAndView doLogin4(UserInfoBean userInfoB) {
        System.out.println("basepath:" + System.getProperty("server.basePath"));
        // 返回的视图对象
        ModelAndView mav = new ModelAndView();
        // 设置modelandview要显示的页面名:默认进入登录成功页面
        mav.setViewName("logined");
        if (userInfoB != null) {
            System.out.println("后台登录处理：" + userInfoB.getUsername() + ":" + userInfoB.getUserpsw());
        } else {
            System.out.println("后台登录：null");
        }
        // 调用service的接口方法，进行登录的业务逻辑处理
        List<UserInfoBean> lstUserInfos = userInfoService.doLogin(userInfoB);

        // 登录判定
        if (lstUserInfos != null && lstUserInfos.size() > 0) {
            // 登录成功，缓存当前登录成功的数据
            // 课下作业：ModelAndView的缓存级别对应的是那个？  requestScope
            mav.addObject("loginedUserName", lstUserInfos.get(0).getUsername());
        } else {
            // 登录不成功
            System.out.println("登录失败");
            // 返回登录页面
            //mav.setViewName("../../login");  /// 注意：springmvc进行视图解析时，不会处理 ../ ,而是直接拼接字符串
            mav.setViewName("../../index");
            // 使用字符串方式作为响应函数的返回值
            // 扩展作业：是否还有其他的解决方案？
        }

        // 返回ModelAndView对象
        return mav;
    }

    /**
     * 保存和修改用于信息
     *
     * @param userInfoBean 用户参数实体类
     * @param file_userimg 用于接收客户端发送的流文件对象
     * @return 结果视图
     */
    //@RequestParam("file_userimg")  // 验证是不是必须的？
    @RequestMapping("/saveOrUpdateUserinfo")
    public String saveOrUpdateUserInfo(UserInfoBean userInfoBean, @RequestParam("file_userimg") MultipartFile file_userimg) {

        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_userimg, userInfoBean, "uploadfiles/userimgfiles/", "userimg");

        // 调用Service层进行用户信息数据保存和修改操作
        int i = userInfoService.saveOrUpdateUserInfo(userInfoBean);
        // 根据操作结果进行视图转发处理
        return "userInfoManager/userInfoAddDetail";
    }

    /**
     * 添加了 @ResponseBody 表名该方法响应的是一个ajax类型的请求，
     * retrun返回的就是对ajax请求的响应内容，而不再是视图的路径
     */
    @ResponseBody
    @RequestMapping("/doAjaxDemo")
    public String doAjaxDemo() {
        // 业务逻辑处理完成后获取的响应信息
        String strMsg = "ajax hello!";
        return strMsg;
    }

    /**
     * ajax进行数据查询处理
     *
     * @param userInfoBean 查询参数信息
     * @return 查询结果集
     */
    @ResponseBody
    @RequestMapping("/doAjaxUserInfoQueryByPramas")
    public List<UserInfoBean> doAjaxQueryByPramas(UserInfoBean userInfoBean) {

        // 调用service层经进行数据库查询操作
        List<UserInfoBean> lstUserInfos = userInfoService.selectUserInfoByParams(userInfoBean);
        // 在springmvc中直接放回数据结构，springmvc会自动把数据结果集转换为 json数据串发给客户端
        // 如果不是springmvc框架，则需要使用手动或者第三方工具将结果集转换为json字符串发回给客户端
        return lstUserInfos;

    }

}
