package com.baizhi.service;

import com.baizhi.entity.Musicfile;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface MusicfileService {
    public void save(Musicfile musicfile);
    public void delete(String id);
    public void update(Musicfile musicfile);
    public Musicfile queryById(String id);
    public List<Musicfile> queryAll(Integer page, Integer rows);
    public Integer queryCount();
}
