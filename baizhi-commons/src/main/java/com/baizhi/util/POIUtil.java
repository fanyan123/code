package com.baizhi.util;

import java.util.HashMap;
import java.util.Map;

public class POIUtil {
	public static String getValue(String key){
		Map<String,String> map = new HashMap<>();
		map.put("id", "编号");
		map.put("name", "姓名");
		map.put("age", "年龄");
		map.put("salary", "薪资");
		return map.get(key);
	}
}
