package com.baizhi.service.impl;

import com.baizhi.dao.CityDAO;
import com.baizhi.dao.ProvinceDAO;
import com.baizhi.entity.City;
import com.baizhi.entity.Province;
import com.baizhi.service.CityService;
import com.baizhi.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService {
    @Autowired
    private CityDAO cityDAO;
    @Override
    public void save(City city) {
        city.setId(UUID.randomUUID().toString());
        cityDAO.insert(city);
    }

    @Override
    public void delete(String id) {
        cityDAO.delete(id);
    }

    @Override
    public void update(City city) {
        cityDAO.update(city);
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public City queryById(String id) {
        City city = cityDAO.selectById(id);
        return city;
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<City> queryAll(Integer page,Integer rows) {
        List<City> cities = cityDAO.selectAll((page - 1) * rows, rows);
        return cities;
    }
    @Override
    public Integer queryCount() {
        return cityDAO.selectCount();
    }
}
