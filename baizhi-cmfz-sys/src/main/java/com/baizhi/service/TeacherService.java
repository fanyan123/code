package com.baizhi.service;

import com.baizhi.entity.Province;
import com.baizhi.entity.Teacher;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface TeacherService {
    public void save(Teacher teacher);
    public void delete(String id);
    public void update(Teacher teacher);
    public Teacher queryById(String id);
    public List<Teacher> queryAll(Integer page, Integer rows);
    public List<Teacher> queryAll();
    public Integer queryCount();
}
