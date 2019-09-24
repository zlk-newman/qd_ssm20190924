package com.yuw.service;

import com.yuw.bean.UserInfoBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserInfoService {
    /**
     * 登录查询：根据登录传入用户名密码进行登录查询操作
     *
     * @param userInfoBean 登录参数信息实体类
     * @return 查询结果集
     */
    public List<UserInfoBean> doLogin(UserInfoBean userInfoBean);

    /**
     * 保存和修改用于信息
     *
     * @param userInfoBean 用户参数实体类
     * @return 操作结果
     */
    public int saveOrUpdateUserInfo(UserInfoBean userInfoBean);

    /**
     * 动态查询操作
     *
     * @param record 查询的参数实体
     * @return 查询结果集
     */
    List<UserInfoBean> selectUserInfoByParams(@Param("record") UserInfoBean record);
}
