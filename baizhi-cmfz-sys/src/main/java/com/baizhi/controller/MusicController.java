package com.baizhi.controller;

import com.baizhi.entity.Music;
import com.baizhi.entity.Province;
import com.baizhi.service.MusicService;
import com.baizhi.service.ProvinceService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("music")
public class MusicController {
    @Resource
    private MusicService musicService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Music> musics = musicService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",musics);
            map.put("total",musicService.queryCount());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("delete")
    @ResponseBody
    public String delete(String id){
        try {
            musicService.delete(id);
            return "successful";
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "fail";
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Music queryById(String id){
        try {
            Music music = musicService.queryById(id);
            return music;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(Music music){
        try {
            musicService.update(music);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("save")
    @ResponseBody
    public String save(Music music, MultipartFile aaa, HttpServletRequest request){
        String realPath = request.getSession().getServletContext().getRealPath("/back/static/images");
        File file = new File(realPath);
        String newFileName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(aaa.getOriginalFilename());
        String s = UUID.randomUUID().toString();
        music.setId(s);
        music.setPicpath(newFileName);
        try {
            musicService.save(music);
            //上传文件
            aaa.transferTo(new File(file,newFileName));
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            musicService.delete(s);
            return "fail";
        }
    }
    @RequestMapping("queryAll1")
    @ResponseBody
    public List<Music> queryAll(){
        try {
            List<Music> music = musicService.queryAll();
            return music;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
