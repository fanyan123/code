package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class Counter {
    private String id;
    private String name;
    @JSONField(format = "yyyy-MM-dd")
    private Date  createdate;
    private Integer count;
    private Record record;

    @Override
    public String toString() {
        return "Counter{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", createdate=" + createdate +
                ", count=" + count +
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

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Record getRecord() {
        return record;
    }

    public void setRecord(Record record) {
        this.record = record;
    }
}
