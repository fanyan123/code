package com.baizhi.controller;

import com.baizhi.entity.City;
import com.baizhi.entity.Province;
import com.baizhi.service.CityService;
import com.baizhi.service.ProvinceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("city")
public class CityController {
    @Resource
    private CityService cityService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<City> cities = cityService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",cities);
            map.put("total",cityService.queryCount());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("delete")
    @ResponseBody
    public String delete(String id){
        try {
            cityService.delete(id);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }
    @RequestMapping("queryById")
    @ResponseBody
    public City queryById(String id){
        try {
            City city = cityService.queryById(id);
            return city;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(City city){
        try {
            cityService.update(city);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    @ResponseBody
    public void save(City city){
        try {
            cityService.save(city);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("queryAll1")
    @ResponseBody
    public List<City> queryAll(){
        try {
            List<City> cities = cityService.queryAll();
            return cities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
