package com.baizhi.service;

import com.baizhi.entity.Picture;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface PictureService {
    public void save(Picture picture);
    public void delete(String id);
    public void update(Picture picture);
    public Picture queryById(String id);
    public List<Picture> queryAll(Integer page,Integer rows);
    public Integer queryCount();
}
