package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<User> pictures = userService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",pictures);
            map.put("total",userService.queryCount());
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
            userService.delete(id);
            return "successful";
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "fail";
    }
    @RequestMapping("queryById")
    @ResponseBody
    public User queryById(String id){
        try {
            User user = userService.queryById(id);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody

    public void update(User user){
        try {
            userService.update(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    @ResponseBody
    public String save(User user, MultipartFile aaa, HttpServletRequest request){
        String realPath = request.getSession().getServletContext().getRealPath("/back/static/images");
        File file = new File(realPath);
        System.out.println(realPath+"------------------------------");
        String newFileName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(aaa.getOriginalFilename());
        String s = UUID.randomUUID().toString();
        user.setId(s);
        user.setPicpath(newFileName);
        try {
            userService.save(user);
            //上传文件
            aaa.transferTo(new File(file,newFileName));
            return "successful";
        } catch (Exception e) {
            userService.delete(s);
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping("queryAll1" )
    @ResponseBody
    public List<User> queryAll(){
        try {
            List<User> users = userService.queryAll();
            return users;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
