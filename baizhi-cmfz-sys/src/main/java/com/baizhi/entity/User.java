package com.baizhi.entity;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class User {
    private String id;
    private String name;
    private String legalname;
    private String tel;
    private String sex;
    private String signature;
    private String picpath;
    private String password;
    private String salt;
    //关系属性
    private Teacher teacher;
    private Province province;
    private City city;
}
