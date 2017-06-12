package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.util.VerifyCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("admin")
public class AdminController {
    @Resource
    private AdminService adminService;
    @RequestMapping("login")
    public String login(Admin admin,HttpSession session,String code){
        String  imagecode = (String) session.getAttribute("imageCode");

        if(imagecode.equalsIgnoreCase(code)){
            Admin admin1 = adminService.queryByName(admin);
            if(admin1!=null){
                return "redirect:/back/main/main.jsp";
            }else{
                return "redirect:/back/admin/login.jsp";
            }
        }else {
            return "redirect:index.jsp";
        }
    }
    @RequestMapping("imageCode")
    public void imageCode(HttpSession session, HttpServletResponse response) throws Exception{

        String code = VerifyCodeUtil.generateVerifyCode(4);
        session.setAttribute("imageCode",code);
        //把图片响应回浏览器
        BufferedImage image = VerifyCodeUtil.getImage(100, 40, code);
        ServletOutputStream os = response.getOutputStream();
        response.setContentType("image/png");
        ImageIO.write(image, "png", os);
    }
}
