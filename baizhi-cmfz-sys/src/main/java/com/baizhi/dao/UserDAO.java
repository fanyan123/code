package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface UserDAO extends BaseDAO<User>{
    public List<User> selectAll1(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();
}
