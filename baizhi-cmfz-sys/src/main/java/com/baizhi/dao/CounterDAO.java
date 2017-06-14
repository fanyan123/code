package com.baizhi.dao;

import com.baizhi.entity.Counter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-14.
 */
public interface CounterDAO extends BaseDAO<Counter>{
    public List<Counter> selectAll1(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();
}
