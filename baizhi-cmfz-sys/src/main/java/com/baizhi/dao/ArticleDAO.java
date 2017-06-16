package com.baizhi.dao;

import com.baizhi.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface ArticleDAO extends BaseDAO<Article>{
    public List<Article> selectAll(@Param("start") Integer start, @Param("rows") Integer rows);
    public Integer selectCount();

}
