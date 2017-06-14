package com.baizhi.controller;

import com.baizhi.entity.Musicfile;
import com.baizhi.service.MusicfileService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("musicfile")
public class MusicfileController {
    @Resource
    private MusicfileService musicfileService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Musicfile> musicfiles = musicfileService.queryAll(page,rows);

            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",musicfiles);
            map.put("total",musicfileService.queryCount());
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
            musicfileService.delete(id);
            return "successful";
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "fail";
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Musicfile queryById(String id){
        try {
            Musicfile musicfile = musicfileService.queryById(id);
            return musicfile;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(Musicfile musicfile){
        try {
            musicfileService.update(musicfile);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("upload")
    @ResponseBody
    public  String  upload(MultipartFile aaa, HttpServletRequest request, Musicfile musicfile) throws IOException {
        String realPath = request.getSession().getServletContext().getRealPath("/back/static/media");
        File file = new File(realPath);
        String newFileName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(aaa.getOriginalFilename());
        //上传文件
        musicfile.setName(newFileName);
        String s = UUID.randomUUID().toString();
        long ll = 1000000L;
        musicfile.setId(s);
        musicfile.setSize(String.valueOf(aaa.getSize()/ll));
        try {
            aaa.transferTo(new File(file,newFileName));
            musicfileService.save(musicfile);
            return "success";
        } catch (Exception e) {
            musicfileService.delete(s);
            e.printStackTrace();
        }
        return "fail";
    }
}
