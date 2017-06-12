package com.baizhi.dao;

import com.baizhi.entity.Accordion;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public interface AccordionDAO extends BaseDAO<Accordion>{
    public Accordion selectByParentId(String name);
}
