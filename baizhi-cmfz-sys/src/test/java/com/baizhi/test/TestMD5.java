package com.baizhi.test;

import com.baizhi.util.MD5Util;

/**
 * Created by ASUS-PC on 2017-06-12.
 */
public class TestMD5 {
    public static void main(String[] args) {
        String md5Code = MD5Util.getMD5Code("123456abcd");
        System.out.println(md5Code);
    }
}
