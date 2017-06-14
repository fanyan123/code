package com.baizhi.service;

import com.baizhi.entity.Music;
import com.baizhi.entity.Record;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface RecordService {
    public void save(Record record);
    public void delete(String id);
    public void update(Record record);
    public Record queryById(String id);
    public List<Record> queryAll(Integer page, Integer rows);
    public Integer queryCount();
    public List<Record> queryAll();
}
