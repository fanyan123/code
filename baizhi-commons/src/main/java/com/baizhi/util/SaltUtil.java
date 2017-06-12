package com.baizhi.util;

import java.util.Random;

public class SaltUtil {
	public static String getSalt(int n){
		String string = "qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
		char[] charArray = string.toCharArray();
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		//从charArray数组中随机取n位字符
		for (int i = 0; i < n; i++) {
			sb.append(charArray[random.nextInt(charArray.length)]);
		}
		return sb.toString();
	}
	public static void main(String[] args) {
		String salt = SaltUtil.getSalt(9);
		System.out.println(salt);
	}
}
