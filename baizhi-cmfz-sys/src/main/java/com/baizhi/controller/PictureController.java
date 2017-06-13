package com.baizhi.controller;

import com.baizhi.entity.Picture;
import com.baizhi.service.PictureService;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("picture")
public class PictureController {
    @Resource

    private PictureService pictureService;
    @RequestMapping("queryAll")
    @ResponseBody
    public Map<String,Object> queryAll(HttpServletRequest request,Integer page,Integer rows){
        try {
            List<Picture> pictures = pictureService.queryAll(page,rows);
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("rows",pictures);
            map.put("total",pictureService.queryCount());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("upload")
    @ResponseBody
    public  String  upload(MultipartFile aaa, HttpServletRequest request,String title) throws IOException {
        String realPath = request.getSession().getServletContext().getRealPath("/back/static/images");
        File file = new File(realPath);
        String newFileName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(aaa.getOriginalFilename());
        //上传文件
        Picture picture = new Picture();
        picture.setName(newFileName);
        picture.setTitle(title);
        picture.setType("0");
        String s = UUID.randomUUID().toString();
        picture.setId(s);
        try {
            pictureService.save(picture);
            aaa.transferTo(new File(file,newFileName));
            return "success";
        } catch (Exception e) {
            pictureService.delete(s);
            e.printStackTrace();
        }
        return "fail";
    }
    @RequestMapping("delete")
    @ResponseBody
    public String delete(String id){
        try {
            pictureService.delete(id);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    @RequestMapping("queryById")
    @ResponseBody
    public Picture queryById(String id){
        try {
            Picture picture = pictureService.queryById(id);
            return picture;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(Picture picture){
        try {
            pictureService.update(picture);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/download")
    public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
        File file = new File(request.getSession().getServletContext().getRealPath("/back/static/images"));
        //去指定上传目录获取当前下载文件的输入流
        FileInputStream fis = new FileInputStream(new File(file, fileName));
        //获取response响应流
        ServletOutputStream os = response.getOutputStream();
        //设置下载的响应类型
        response.setContentType("image/jpeg");
        response.setHeader("content-disposition","inline ;fileName="+ URLEncoder.encode(fileName,"UTF-8"));
        int len = 0;
        byte[] b = new byte[1024];
        while(true){
            len = fis.read(b);
            if(len==-1)break;
            os.write(b,0, len);
        }
        IOUtils.closeQuietly(fis);
        IOUtils.closeQuietly(os);

    }
}
