package com.baizhi.dao;

import com.baizhi.entity.Rfc;
import com.baizhi.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-13.
 */
public interface TeacherDAO extends BaseDAO<Teacher>{
    public List<Teacher> selectAll(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();

}
