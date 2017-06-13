package com.baizhi.service.impl;

import com.baizhi.dao.PictureDAO;
import com.baizhi.entity.Picture;
import com.baizhi.service.PictureService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("pictureService")
@Transactional
public class PictureServiceImpl implements PictureService{
    @Autowired
    private PictureDAO pictureDAO;
    @Override
    public void save(Picture picture) {
        pictureDAO.insert(picture);
    }

    @Override
    public void delete(String id) {
        pictureDAO.delete(id);
    }

    @Override
    public void update(Picture picture) {
        pictureDAO.update(picture);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Picture queryById(String id) {
        Picture picture = pictureDAO.selectById(id);
        return picture;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Picture> queryAll(Integer page,Integer rows) {
        List<Picture> pictures =  pictureDAO.selectAll((page-1)*rows,rows);
        return pictures;
    }

    @Override
    public Integer queryCount() {
        return pictureDAO.selectCount();
    }
}
