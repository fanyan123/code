package com.baizhi.entity;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class Picture {
    private String id;
    private String name;
    private String title;
    private String type;

    @Override
    public String toString() {
        return "Picture{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", type='" + type + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
