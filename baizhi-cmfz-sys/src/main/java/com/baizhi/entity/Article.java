package com.baizhi.entity;

import java.util.Date;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class Article {
    private String id;
    private String title;
    private String author;
    private Date createdate;
    private String content;
    private String authorpath;
    private String picpath;
    private String type;

    @Override
    public String toString() {
        return "Article{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", createdate='" + createdate + '\'' +
                ", content='" + content + '\'' +
                ", authorpath='" + authorpath + '\'' +
                ", picpath='" + picpath + '\'' +
                ", type='" + type + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthorpath() {
        return authorpath;
    }

    public void setAuthorpath(String authorpath) {
        this.authorpath = authorpath;
    }

    public String getPicpath() {
        return picpath;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
