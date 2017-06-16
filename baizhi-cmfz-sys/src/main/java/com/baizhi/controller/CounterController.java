package com.baizhi.controller;

import com.baizhi.entity.Counter;
import com.baizhi.service.CounterService;
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
@RequestMapping("counter")
public class CounterController {
    @Resource
    private CounterService counterService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Counter> counters = counterService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",counters);
            map.put("total",counterService.queryCount());
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
            counterService.delete(id);
            return "successful";
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "fail";
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Counter queryById(String id){
        try {
            Counter counter = counterService.queryById(id);
            return counter;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(Counter counter){
        try {
            counterService.update(counter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    @ResponseBody
    public void save(Counter counter){
        try {
            counterService.save(counter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("queryAll1")
    @ResponseBody
    public List<Counter> queryAll(){
        try {
            List<Counter> counters = counterService.queryAll();
            return counters;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
