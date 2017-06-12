package com.baizhi.controller;

import com.baizhi.entity.Accordion;
import com.baizhi.service.AccordionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
@Controller
@RequestMapping("accordion")
public class AccordionController {
    @Resource
    private AccordionService accordionService;
    @RequestMapping("queryAll")
    @ResponseBody
    public List<Accordion> queryAll(){
        List<Accordion> accordions = accordionService.queryAll();
        /*for (Accordion accordion : accordions) {
            System.out.println(accordion);
        }*/
        return accordions;
    }
}
