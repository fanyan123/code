package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.beans.Transient;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class City {
    private String id;
    private String name;

    private Province province;

    @Override
    public String toString() {
        return "City{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
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

    public Province getProvince() {
        return province;
    }
    @Transient
    public void setProvince(Province province) {
        this.province = province;
    }
}
