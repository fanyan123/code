package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface UserService {
    public void save(User user);
    public void delete(String id);
    public void update(User user);
    public User queryById(String id);
    public List<User> queryAll(Integer page, Integer rows);
    public Integer queryCount();
    public List<User> queryAll();
}
