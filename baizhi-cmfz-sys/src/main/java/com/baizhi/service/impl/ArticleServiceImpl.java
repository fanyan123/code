package com.baizhi.service.impl;

import com.baizhi.dao.ArticleDAO;
import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("articleService")
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDAO articleDAO;

    public void save(Article article) {
        article.setId(UUID.randomUUID().toString());
        article.setCreatedate(new Date());
        articleDAO.insert(article);
    }


    public void delete(String id) {
        articleDAO.delete(id);
    }


    public void update(Article article) {
        article.setCreatedate(new Date());
        articleDAO.update(article);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Article queryById(String id) {
        Article article = articleDAO.selectById(id);
        return article;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Article> queryAll(Integer page,Integer rows) {
        List<Article> article =  articleDAO.selectAll((page-1)*rows,rows);
        return article;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryCount() {
        return articleDAO.selectCount();
    }

}
