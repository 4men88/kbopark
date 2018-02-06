package com.baseball.myinfo.service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class KakaoReadyServiceImpl implements KakaoReadyService {
	
	private static KakaoReadyService krs;
	
	static {
		krs = new KakaoReadyServiceImpl();
	}

	public static KakaoReadyService getKrs() {
		return krs;
	}

	@Override
	public String getReadyInfo(String adminid, int price) {

		double vat = price * 0.1;
		System.out.println("vat >>> " + vat);
		
		String result = "";
		try {
			String apiURL = "https://kapi.kakao.com/v1/payment/ready"; // curl 다음에오는 주소링크
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK " + adminid);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			con.setRequestProperty("charset", "utf-8");

			StringBuffer params = new StringBuffer();
			params.append("cid=TC0ONETIME" + "&");
			params.append("partner_order_id=partner_order_id" + "&");
			params.append("partner_user_id=partner_user_id" + "&");
			params.append("item_name=KBOPARK" + "&");
			params.append("quantity=1" + "&");
			params.append("total_amount=" + price + "&");
			params.append("vat_amount=" + (int)vat + "&");
			params.append("tax_free_amount=0" + "&");
			params.append("approval_url=http://localhost:8005/kbopark/myinfo?act=finrookie" + "&");
			params.append("fail_url=http://localhost:8005/kbopark/myinfo?act=failrookie" + "&");
			params.append("cancel_url=http://localhost:8005/kbopark/myinfo?act=cancelrookie");
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
	
}
