package com.baizhi.controller;

import com.baizhi.entity.Province;
import com.baizhi.service.ProvinceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("province")
public class ProvinceController {
    @Resource
    private ProvinceService provinceService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Province> pictures = provinceService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",pictures);
            map.put("total",provinceService.queryCount());
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
            provinceService.delete(id);
            return "successful";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Province queryById(String id){
        try {
            Province province = provinceService.queryById(id);
            return province;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(Province province){
        try {
            provinceService.update(province);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    @ResponseBody
    public void save(Province province){
        try {
            provinceService.save(province);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("queryAll1")
    @ResponseBody
    public List<Province> queryAll(){
        try {
            List<Province> provinces = provinceService.queryAll();
            return provinces;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
