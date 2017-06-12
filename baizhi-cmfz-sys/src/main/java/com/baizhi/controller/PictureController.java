package com.baizhi.controller;

import com.baizhi.entity.Picture;
import com.baizhi.service.PictureService;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("picture")
public class PictureController {
    @Resource
    private PictureService pictureService;
    public String queryAll(HttpServletRequest request){
        try {
            List<Picture> pictures = pictureService.queryAll();
            request.setAttribute("pictures",pictures);
            return "forward:/back/picture/showAll";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }
    @RequestMapping("upload")
    public  String  upload(MultipartFile aaa, HttpServletRequest request,String title) throws IOException {
        String realPath = request.getSession().getServletContext().getRealPath("/back/static/images");
        File file = new File(realPath);
        System.out.println(file.getAbsolutePath());
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
            return "redirect:/picture/queryAll";
        } catch (Exception e) {
            pictureService.delete(s);
            e.printStackTrace();
        }
        return "redirect:/picture/queryAll";
    }

}
