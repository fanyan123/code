package com.baizhi.service.impl;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;
    @Override
    public void save(User user) {
        user.setId(UUID.randomUUID().toString());
        userDAO.insert(user);
    }

    @Override
    public void delete(String id) {
        userDAO.delete(id);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public User queryById(String id) {
        User user = userDAO.selectById(id);
        return user;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> queryAll(Integer page,Integer rows) {
        List<User> user =  userDAO.selectAll1((page-1)*rows,rows);
        return user;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryCount() {
        return userDAO.selectCount();
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> queryAll(){
        return userDAO.selectAll();
    }
}
