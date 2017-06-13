package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface BaseDAO<T> {
    public void insert(T t);
    public void update(T t);
    public void delete(String id);
    public T selectById(String id);
    public List<T> selectAll();
}
