package com.baizhi.service;

import com.baizhi.entity.Counter;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface CounterService {
    public void save(Counter counter);
    public void delete(String id);
    public void update(Counter counter);
    public Counter queryById(String id);
    public List<Counter> queryAll(Integer page, Integer rows);
    public List<Counter> queryAll();
    public Integer queryCount();
}
