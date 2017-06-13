package com.baizhi.dao;

import com.baizhi.entity.Province;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-13.
 */
public interface ProvinceDAO extends BaseDAO<Province>{
    public List<Province> selectAll1(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();
}
