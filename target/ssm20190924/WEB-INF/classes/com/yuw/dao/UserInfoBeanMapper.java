package com.yuw.dao;

import com.yuw.bean.UserInfoBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfoBeanMapper {

    /**
     * 登录查询操作
     *
     * @param record 参数实体类
     * @return 查询结果集
     */
    List<UserInfoBean> doLogin(UserInfoBean record);

    /**
     * 动态查询操作
     *
     * @param record 查询的参数实体
     * @return 查询结果集
     */
    List<UserInfoBean> selectUserInfoByParams(UserInfoBean record);

    int deleteByPrimaryKey(Integer userid);

    int insert(UserInfoBean record);

    /**
     * 进行数据新增操作
     *
     * @param record 参数实体
     * @return 操作结果
     */
    int insertSelective(UserInfoBean record);

    UserInfoBean selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(UserInfoBean record);

    int updateByPrimaryKey(UserInfoBean record);
}