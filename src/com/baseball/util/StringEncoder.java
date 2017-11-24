package com.baseball.util;

import java.io.UnsupportedEncodingException;

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

}