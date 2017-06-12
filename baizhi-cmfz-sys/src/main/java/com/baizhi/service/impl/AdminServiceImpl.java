package com.baizhi.service.impl;

import com.baizhi.dao.AdminDAO;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDAO adminDAO;
    @Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
    public Admin queryByName(Admin admin) {
        Admin DBadmin = adminDAO.selectByName(admin.getUsername());
        if(DBadmin!=null){
            System.out.println(admin.getPassword()+DBadmin.getSalt());
            System.out.println(MD5Util.getMD5Code(admin.getPassword() + DBadmin.getSalt()));
            System.out.println(DBadmin.getPassword());
            System.out.println(MD5Util.getMD5Code(admin.getPassword() + DBadmin.getSalt()).equals(DBadmin.getPassword()));
            if(MD5Util.getMD5Code(admin.getPassword()+DBadmin.getSalt()).equals(DBadmin.getPassword())){
                return DBadmin;
            }else {
               throw new RuntimeException("密码错误");
            }
        }else {
            throw new RuntimeException("用户名不存在");
        }
    }
}
