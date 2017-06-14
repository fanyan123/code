package com.baizhi.controller;

import com.baizhi.entity.Record;
import com.baizhi.service.RecordService;
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
@RequestMapping("record")
public class RecordController {
    @Resource
    private RecordService recordService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Record> records = recordService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",records);
            map.put("total",recordService.queryCount());
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
            recordService.delete(id);
            return "successful";
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "fail";
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Record queryById(String id){
        try {
            Record record = recordService.queryById(id);
            return record;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(Record record){
        try {
            recordService.update(record);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    @ResponseBody
    public void save(Record record){
        try {
            recordService.save(record);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("queryAll1")
    @ResponseBody
    public List<Record> queryAll(){
        try {
            List<Record> record = recordService.queryAll();
            return record;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
