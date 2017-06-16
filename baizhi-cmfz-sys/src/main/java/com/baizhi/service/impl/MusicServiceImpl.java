package com.baizhi.service.impl;

import com.baizhi.dao.MusicDAO;
import com.baizhi.entity.Music;
import com.baizhi.service.MusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("musicService")
@Transactional
public class MusicServiceImpl implements MusicService {
    @Autowired
    private MusicDAO musicDAO;
    @Override
    public void save(Music music) {
        musicDAO.insert(music);
    }

    @Override
    public void delete(String id) {
        musicDAO.delete(id);
    }

    @Override
    public void update(Music music) {
        musicDAO.update(music);
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Music queryById(String id) {
        Music music = musicDAO.selectById(id);
        return music;
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Music> queryAll(Integer page,Integer rows) {
        List<Music> musicS = musicDAO.selectAll1((page-1)*rows,rows);
        return musicS;
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryCount() {
        return musicDAO.selectCount();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Music> queryAll() {
        return musicDAO.selectAll();
    }
}
