package com.baseball.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class StringEncoder {
	public static String isoToMain(String tmp){
		String str = "";
		try {
			if(tmp!=null)
				str = new String(tmp.getBytes("ISO-8859-1"),Constance.MAIN_ENCODING);
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static String urlFormat(String tmp) {
		String url = "";
		try {
			if(tmp != null)
				url = URLEncoder.encode(tmp, Constance.MAIN_ENCODING);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return url;
	}
}