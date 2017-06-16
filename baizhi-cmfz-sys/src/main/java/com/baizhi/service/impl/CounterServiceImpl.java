package com.baizhi.service.impl;

import com.baizhi.dao.CounterDAO;
import com.baizhi.entity.Counter;
import com.baizhi.service.CounterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-13.
 */
@Service("counterService")
@Transactional
public class CounterServiceImpl implements CounterService {
    @Autowired
    private CounterDAO counterDAO;

    public void save(Counter counter) {
        counter.setId(UUID.randomUUID().toString());
        counter.setCreatedate(new Date());
        counterDAO.insert(counter);
    }


    public void delete(String id) {
        counterDAO.delete(id);
    }


    public void update(Counter counter) {
        counterDAO.update(counter);
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Counter queryById(String id) {
        return counterDAO.selectById(id);
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Counter> queryAll(Integer page, Integer rows) {
        return counterDAO.selectAll1((page-1)*rows,rows);
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Counter> queryAll() {
        return counterDAO.selectAll();
    }


    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryCount() {
        return counterDAO.selectCount();
    }
}
