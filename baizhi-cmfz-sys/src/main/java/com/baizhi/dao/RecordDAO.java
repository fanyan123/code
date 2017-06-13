package com.baizhi.dao;

import com.baizhi.entity.Music;
import com.baizhi.entity.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-13.
 */
public interface RecordDAO extends BaseDAO<Record>{
    public List<Record> selectAll1(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();
}
