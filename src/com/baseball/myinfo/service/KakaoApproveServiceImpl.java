package com.baseball.myinfo.service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import com.baseball.myinfo.dao.MyinfoDaoImpl;

public class KakaoApproveServiceImpl implements KakaoApproveService {
	
	private static KakaoApproveService kas;
	
	static {
		kas = new KakaoApproveServiceImpl();
	}

	public static KakaoApproveService getKas() {
		return kas;
	}
	
	@Override
	public String getApproveInfo(Map<String, String> map) {

		String adminid = map.get("adminid");
		String pg_token = map.get("pg_token");
		String tid = map.get("tid");
		
		String result = "";
		try {
			String apiURL = "https://kapi.kakao.com/v1/payment/approve"; // curl 다음에오는 주소링크
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK " + adminid); // -H "X-Naver-Client-ID: {12314124}"
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			con.setRequestProperty("charset", "utf-8");

			StringBuffer params = new StringBuffer();
			params.append("cid=TC0ONETIME" + "&");
			params.append("tid=" + tid + "&");
			params.append("partner_order_id=partner_order_id" + "&");
			params.append("partner_user_id=partner_user_id" + "&");
			params.append("pg_token=" + pg_token);

			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(params.toString());
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer respapa = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				respapa.append(inputLine);
			}
			br.close();
			result = respapa.toString();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}

	@Override
	public int updateRookie(String mid, int price) {
		return MyinfoDaoImpl.getMyinfoDao().updateRookie(mid, price);
	}

}
