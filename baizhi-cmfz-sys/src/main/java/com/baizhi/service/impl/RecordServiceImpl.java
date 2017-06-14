package com.baizhi.service.impl;

import com.baizhi.dao.RecordDAO;
import com.baizhi.entity.Record;
import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-13.
 */
@Service("recordService")
@Transactional
public class RecordServiceImpl implements RecordService{
    @Autowired
    private RecordDAO recordDAO;
    @Override
    public void save(Record record) {
        record.setId(UUID.randomUUID().toString());
        recordDAO.insert(record);
    }

    @Override
    public void delete(String id) {
        recordDAO.delete(id);
    }

    @Override
    public void update(Record record) {
        recordDAO.update(record);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Record queryById(String id) {
        return recordDAO.selectById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Record> queryAll(Integer page, Integer rows) {
        return recordDAO.selectAll1((page-1)*rows,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryCount() {
        return recordDAO.selectCount();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Record> queryAll() {
        return recordDAO.selectAll();
    }
}
