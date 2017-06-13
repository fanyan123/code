package com.baizhi.service.impl;

import com.baizhi.dao.RfcDAO;
import com.baizhi.entity.Rfc;
import com.baizhi.service.RfcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("rfcService")
@Transactional
public class RfcServiceImpl implements RfcService {
    @Autowired
    private RfcDAO rfcDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Rfc> queryAll(Integer page, Integer rows) {
        List<Rfc> rfcs = rfcDAO.selectAll((page - 1) * rows, rows);
        return rfcs;
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryCount() {
        return rfcDAO.selectCount();
    }

    @Override
    public void save(Rfc rfc) {
        rfc.setId(UUID.randomUUID().toString());
        rfc.setPushdate(new Date());
        rfcDAO.insert(rfc);
    }

    @Override
    public void delete(String id) {
        rfcDAO.delete(id);
    }
}
