package com.baizhi.webservice.impl;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.MD5Util;
import com.baizhi.util.SaltUtil;
import com.baizhi.webservice.UserWebService;
import org.springframework.beans.factory.annotation.Autowired;
import javax.jws.WebService;
import javax.ws.rs.*;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-16.
 */
@WebService
@Path("/user")
public class UserWebServiceImpl implements UserWebService{
    @Autowired
    private UserService userService;

    /**
     * 用户注册
     * @param user
     * @return
     */
    @POST
    @Path("/save")
    @Consumes("application/json;charset=UTF-8")
    @Produces("application/json;charset=UTF-8")
    public HashMap<String, Object> save(User user) {
        HashMap<String,Object> map = new HashMap<>();
        try {
            user.setId(UUID.randomUUID().toString());
            userService.save(user);
            map.put("status","1");
            map.put("message","注册成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status","0");
            map.put("message",e.getMessage());
        }
        return map;
    }
    /**
     * 修改用户个人信息
     * @param user
     * @return
     */

    @PUT
    @Path("/update")
    @Consumes("application/json;charset=UTF-8")
    @Produces("application/json;charset=UTF-8")
    public HashMap<String, Object> update(User user) {
        HashMap<String,Object> map = new HashMap<>();
        try {
            User user1 = userService.queryById(user.getId());
            if(user.getPassword()!=null){
                String salt = SaltUtil.getSalt(4);
                String pwd = MD5Util.getMD5Code(user.getPassword() + salt);
                user=user1;
                user.setPassword(pwd);
                user.setSalt(salt);
            }else{
                user.setPassword(user1.getPassword());
                user.setSalt(user1.getSalt());
                user.setTeacher(user1.getTeacher());
                //用户可能修改的信息
                if(user.getCity()==null){
                    user.setCity(user1.getCity());
                }
                if(user.getProvince()==null){
                    user.setProvince(user1.getProvince());
                }
                if(user.getLegalname()==null){
                    user.setLegalname(user1.getLegalname());
                }
                if(user.getSex()==null){
                    user.setSex(user1.getSex());
                }
                if(user.getLegalname()==null){
                    user.setLegalname(user1.getLegalname());
                }
                if(user.getLegalname()==null){
                    user.setLegalname(user1.getLegalname());
                }
                if(user.getName()==null){
                    user.setName(user1.getName());
                }
                if(user.getSignature()==null){
                    user.setSignature(user1.getSignature());
                }
                if(user.getSignature()==null){
                    user.setSignature(user1.getSignature());
                }
            }
            userService.update(user);
            map.put("status","1");
            map.put("message","修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status","0");
            map.put("message",e.getMessage());
        }
        return map;
    }
    @PUT
    @Path("/updatePassword")
    @Consumes("application/json;charset=UTF-8")
    @Produces("application/json;charset=UTF-8")
    public HashMap<String, Object> updatePassword(User user) {
        HashMap<String,Object> map = new HashMap<>();
        try {
            User user1 = userService.queryById(user.getId());
            userService.update(user);
            map.put("status","1");
            map.put("message","修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status","0");
            map.put("message",e.getMessage());
        }
        return map;
    }

    @GET
    @Path("/queryOne")
    @Produces("application/json;charset=UTF-8")
    public HashMap<String, Object> queryById(String id) {
        HashMap<String,Object> map = new HashMap<>();
        try {
            User user = userService.queryById(id);
            map.put("status","1");
            map.put("message","注册成功");
            map.put("result",user);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status","0");
            map.put("message",e.getMessage());
        }
        return map;
    }
    @GET
    @Path("/queryAll")
    @Produces("application/json;charset=UTF-8")
    public HashMap<String, Object> queryAll() {
        HashMap<String,Object> map = new HashMap<>();
        try {
            List<User> users = userService.queryAll();
            map.put("status","1");
            map.put("message","查询成功");
            map.put("result",users);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status","0");
            map.put("message",e.getMessage());
        }
        return map;
    }
    @POST
    @Path("/login")
    @Consumes("application/json;charset=UTF-8")
    @Produces("application/json;charset=UTF-8")
    public HashMap<String, Object> login(User user) {
        HashMap<String,Object> map = new HashMap<>();
        try {
            User DBuser = userService.queryByTel(user.getTel());
            if(DBuser!=null){
                if(DBuser.getPassword().equals(MD5Util.getMD5Code(user.getPassword()+DBuser.getSalt()))){
                    map.put("status","1");
                    map.put("message","登录成功");
                }else{
                    map.put("status","0");
                    map.put("message","密码错误");
                }
            }else{
                map.put("status","0");
                map.put("message","用户不存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status","0");
            map.put("message",e.getMessage());
        }
        return map;
    }

}
