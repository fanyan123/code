package com.baizhi.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	public static String getMD5Code(String password){
		try {
			MessageDigest me = MessageDigest.getInstance("md5");
			byte[] bs = me.digest(password.getBytes());
			//将byte数组转化为32位16进制的字符串
			StringBuilder sb = new StringBuilder();
			for (byte b : bs) {
				int i = b & 0xff;
				//小于15的数在前边补0
				if(i<16){
					sb.append("0");
				}
				sb.append(Integer.toHexString(i));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		String code = MD5Util.getMD5Code("123456");
		System.out.println(code);
	}
}
