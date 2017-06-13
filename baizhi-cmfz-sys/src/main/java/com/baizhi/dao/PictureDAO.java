package com.baizhi.dao;

import com.baizhi.entity.Picture;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface PictureDAO extends BaseDAO<Picture>{
    public List<Picture> selectAll(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();
}
