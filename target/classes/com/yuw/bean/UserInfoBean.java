package com.yuw.bean;

import java.util.Date;

public class UserInfoBean {
    private Integer userid;

    private String username;

    private String userpsw;

    private Integer userage;
    // 查询使用的字段
    private Integer userage2;

    private String useraddress;

    private Date userregdate;
    // 查询使用字段
    private Date userregdate2;

    private Integer isdeleted;

    // 文件上传的头像字段
    private String userimg;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpsw() {
        return userpsw;
    }

    public void setUserpsw(String userpsw) {
        this.userpsw = userpsw;
    }

    public Integer getUserage() {
        return userage;
    }

    public void setUserage(Integer userage) {
        this.userage = userage;
    }

    public Integer getUserage2() {
        return userage2;
    }

    public void setUserage2(Integer userage2) {
        this.userage2 = userage2;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }

    public Date getUserregdate() {
        return userregdate;
    }

    public void setUserregdate(Date userregdate) {
        this.userregdate = userregdate;
    }

    public Date getUserregdate2() {
        return userregdate2;
    }

    public void setUserregdate2(Date userregdate2) {
        this.userregdate2 = userregdate2;
    }

    public Integer getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Integer isdeleted) {
        this.isdeleted = isdeleted;
    }

    public String getUserimg() {
        return userimg;
    }

    public void setUserimg(String userimg) {
        this.userimg = userimg;
    }

    @Override
    public String toString() {
        return "UserInfoBean{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", userpsw='" + userpsw + '\'' +
                ", userage=" + userage +
                ", userage2=" + userage2 +
                ", useraddress='" + useraddress + '\'' +
                ", userregdate=" + userregdate +
                ", userregdate2=" + userregdate2 +
                ", isdeleted=" + isdeleted +
                ", userimg='" + userimg + '\'' +
                '}';
    }
}