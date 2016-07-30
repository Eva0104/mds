//package com.mds.pojo;
//
//import javax.inject.Named;
//import javax.persistence.*;
//import java.sql.Time;
//import java.sql.Timestamp;
//
//@Entity
//@Table(name = "t_log")
//public class Log {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Integer id;
//    private Integer userid;
//    private String realname;
//    private Timestamp logintime;
//    private String loginip;
//    private String username;
//    private String telphone;
//
//    public Integer getId() {
//        return id;
//    }
//
//    public void setId(Integer id) {
//        this.id = id;
//    }
//
//    public Integer getUserid() {
//        return userid;
//    }
//
//    public void setUserid(Integer userid) {
//        this.userid = userid;
//    }
//
//    public String getRealname() {
//        return realname;
//    }
//
//    public void setRealname(String realname) {
//        this.realname = realname;
//    }
//
//    public Timestamp getLogintime() {
//        return logintime;
//    }
//
//    public void setLogintime(Timestamp logintime) {
//        this.logintime = logintime;
//    }
//
//    public String getLoginip() {
//        return loginip;
//    }
//
//    public void setLoginip(String loginip) {
//        this.loginip = loginip;
//    }
//
//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }
//
//    public String getTelphone() {
//        return telphone;
//    }
//
//    public void setTelphone(String telphone) {
//        this.telphone = telphone;
//    }
//}
