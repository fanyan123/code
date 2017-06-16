package com.baizhi.service;

import com.baizhi.entity.Article;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface ArticleService {
    public void save(Article article);
    public void delete(String id);
    public void update(Article article);
    public Article queryById(String id);
    public List<Article> queryAll(Integer page, Integer rows);
    public Integer queryCount();
   // public List<Article> queryAll();
}
