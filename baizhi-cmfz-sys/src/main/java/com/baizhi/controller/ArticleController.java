package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("article")
public class ArticleController {
    @Resource
    private ArticleService articleService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Article> provinces = articleService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",provinces);
            map.put("total",articleService.queryCount());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("delete")
    @ResponseBody
    public String delete(String id){
        try {
            articleService.delete(id);
            return "successful";
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "fail";
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Article queryById(String id){
        try {
            Article article = articleService.queryById(id);
            return article;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    public void update(Article article){
        try {
            articleService.update(article);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    public void save(Article article){
        try {
            articleService.save(article);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   /* @RequestMapping("queryAll1")
    @ResponseBody
    public List<article> queryAll(){
        try {
            List<article> provinces = provinceService.queryAll();
            return provinces;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }*/
}
