package com.baizhi.dao;

import com.baizhi.entity.Music;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-13.
 */
public interface MusicDAO extends BaseDAO<Music>{
    public List<Music> selectAll1(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();
}
