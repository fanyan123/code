package com.baizhi.service;

import com.baizhi.entity.Province;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface ProvinceService {
    public void save(Province province);
    public void delete(String id);
    public void update(Province province);
    public Province queryById(String id);
    public List<Province> queryAll(Integer page, Integer rows);
    public Integer queryCount();
    public List<Province> queryAll();
}
