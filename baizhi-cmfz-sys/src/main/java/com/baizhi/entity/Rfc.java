package com.baizhi.entity;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class Rfc {
    private String id;
    private String content;
    private String pushdate;
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

    public String getPushdate() {
        return pushdate;
    }

    public void setPushdate(String pushdate) {
        this.pushdate = pushdate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
