package com.baizhi.service;

import com.baizhi.entity.Music;
import java.util.List;
/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface MusicService {
    public void save(Music music);
    public void delete(String id);
    public void update(Music music);
    public Music queryById(String id);
    public List<Music> queryAll(Integer page, Integer rows);
    public Integer queryCount();
    public List<Music> queryAll();
}
