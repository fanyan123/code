package com.baizhi.webservice;

import com.baizhi.entity.User;

import javax.jws.WebService;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ASUS-PC on 2017-06-16.
 */
@WebService
public interface UserWebService {
    public Map<String,Object> save(User user);
    public Map<String,Object> update(User user);
    public Map<String,Object> queryById(String id);
    public Map<String,Object> queryAll();

}
