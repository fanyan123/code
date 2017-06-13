package com.baizhi.service.impl;

import com.baizhi.dao.ProvinceDAO;
import com.baizhi.entity.Province;
import com.baizhi.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("provinceService")
@Transactional
public class ProvinceServiceImpl implements ProvinceService {
    @Autowired
    private ProvinceDAO provinceDAO;
    @Override
    public void save(Province province) {
        province.setId(UUID.randomUUID().toString());
        provinceDAO.insert(province);
    }

    @Override
    public void delete(String id) {
        provinceDAO.delete(id);
    }

    @Override
    public void update(Province province) {
        provinceDAO.update(province);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Province queryById(String id) {
        Province province = provinceDAO.selectById(id);
        return province;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Province> queryAll(Integer page,Integer rows) {
        List<Province> province =  provinceDAO.selectAll1((page-1)*rows,rows);
        return province;
    }

    @Override
    public Integer queryCount() {
        return provinceDAO.selectCount();
    }
    public List<Province> queryAll(){
        return provinceDAO.selectAll();
    }
}
