package com.baizhi.service.impl;

import com.baizhi.dao.TeacherDAO;
import com.baizhi.entity.Teacher;
import com.baizhi.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-13.
 */
@Service("teacher")
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherDAO teacherDAO;

    public void save(Teacher teacher) {
        teacherDAO.insert(teacher);
    }


    public void delete(String id) {
        teacherDAO.delete(id);
    }


    public void update(Teacher teacher) {
        teacherDAO.update(teacher);
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Teacher queryById(String id) {
        return teacherDAO.selectById(id);
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Teacher> queryAll(Integer page, Integer rows) {
        return teacherDAO.selectAll1((page-1)*rows,rows);
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Teacher> queryAll() {
        return teacherDAO.selectAll();
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryCount() {
        return teacherDAO.selectCount();
    }
}
