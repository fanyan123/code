package com.baizhi.dao;

import com.baizhi.entity.Musicfile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-14.
 */
public interface MusicfileDAO extends BaseDAO<Musicfile>{
    public List<Musicfile> selectAll(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();
}
