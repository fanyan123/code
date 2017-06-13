package com.baizhi.service;

import com.baizhi.entity.Rfc;

import java.util.List;


/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface RfcService {
    public List<Rfc> queryAll(Integer page, Integer rows);
    public Integer queryCount();
    public void save(Rfc rfc);
    public void delete(String id);
}
