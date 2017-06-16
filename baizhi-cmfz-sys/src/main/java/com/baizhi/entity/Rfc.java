package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class Rfc {
    private String id;
    private String content;
    @JSONField(format = "yyyy-MM-dd")
    private Date pushdate;
    private User user;

    @Override
    public String toString() {
        return "Rfc{" +
                "id='" + id + '\'' +
                ", content='" + content + '\'' +
                ", pushdate='" + pushdate + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPushdate() {
        return pushdate;
    }

    public void setPushdate(Date pushdate) {
        this.pushdate = pushdate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
