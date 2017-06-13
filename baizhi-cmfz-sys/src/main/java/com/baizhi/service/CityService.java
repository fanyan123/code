package com.baizhi.service;

import com.baizhi.entity.City;
import com.baizhi.entity.Province;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface CityService {
    public void save(City city);
    public void delete(String id);
    public void update(City city);
    public City queryById(String id);
    public List<City> queryAll(Integer page, Integer rows);
    public Integer queryCount();
}
