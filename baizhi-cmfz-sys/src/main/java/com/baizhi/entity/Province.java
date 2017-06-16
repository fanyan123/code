package com.baizhi.entity;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class Province {
    private String id;
    private String name;



    @Override
    public String toString() {
        return "Province{" +
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


}
