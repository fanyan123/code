package com.baizhi.controller;

import com.baizhi.entity.Province;
import com.baizhi.entity.Rfc;
import com.baizhi.service.ProvinceService;
import com.baizhi.service.RfcService;
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
@RequestMapping("rfc")
public class RfcController {
    @Resource
    private RfcService rfcService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Rfc> pictures = rfcService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",pictures);
            map.put("total",rfcService.queryCount());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @ResponseBody
    @RequestMapping("delete")
    public String delete(String id){
        try {
            rfcService.delete(id);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }
    @ResponseBody
    @RequestMapping("save")
    public String save(Rfc rfc){
        try {
            rfcService.save(rfc);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

}
