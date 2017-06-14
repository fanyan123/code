package com.baizhi.service.impl;

import com.baizhi.dao.MusicfileDAO;
import com.baizhi.entity.Musicfile;
import com.baizhi.service.MusicfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-14.
 */
@Service("musicfileService")
@Transactional
public class MusicfileServiceImpl implements MusicfileService{
    @Autowired
    private MusicfileDAO musicfileDAO;
    @Override
    public void save(Musicfile musicfile) {
        musicfileDAO.insert(musicfile);
    }

    @Override
    public void delete(String id) {
        musicfileDAO.delete(id);
    }

    @Override
    public void update(Musicfile musicfile) {
        musicfileDAO.update(musicfile);
    }

    @Override
    public Musicfile queryById(String id) {
        return musicfileDAO.selectById(id);
    }

    @Override
    public List<Musicfile> queryAll(Integer page, Integer rows) {
        return musicfileDAO.selectAll((page-1)*rows,rows);
    }

    @Override
    public Integer queryCount() {
        return musicfileDAO.selectCount();
    }
}
