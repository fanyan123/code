package com.baizhi.controller;

import com.baizhi.entity.Teacher;
import com.baizhi.service.TeacherService;
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
 * Created by ASUS-PC on 2017-06-13.
 */
@Controller
@RequestMapping("teacher")
public class TeacherController {
    @Resource
    private TeacherService teacherService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page, Integer rows){
        try {
            List<Teacher> pictures = teacherService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",pictures);
            map.put("total",teacherService.queryCount());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Teacher queryById(String id){
        try {
           Teacher teacher = teacherService.queryById(id);
            return teacher;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("delete")
    @ResponseBody
    public String delete(String id){
        try {
            teacherService.delete(id);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(Teacher teacher){
        try {
            teacherService.update(teacher);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    @ResponseBody
    public String save(Teacher teacher, MultipartFile aaa, HttpServletRequest request){


        String realPath = request.getSession().getServletContext().getRealPath("/back/static/images");
        File file = new File(realPath);
        String newFileName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(aaa.getOriginalFilename());
        String s = UUID.randomUUID().toString();
        teacher.setId(s);
        teacher.setPicpath(newFileName);
        try {
            teacherService.save(teacher);
            //上传文件
            aaa.transferTo(new File(file,newFileName));
            return "success";
        } catch (Exception e) {
            teacherService.delete(s);
            e.printStackTrace();
            return "fail";
        }
    }
}
