package com.baizhi.dao;

import com.baizhi.entity.Admin;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface AdminDAO extends BaseDAO<Admin>{
    public Admin selectByName(String name);
}
