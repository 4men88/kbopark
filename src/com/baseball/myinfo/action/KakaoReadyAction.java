package com.baseball.myinfo.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.baseball.action.Action;
import com.baseball.myinfo.service.KakaoReadyServiceImpl;

public class KakaoReadyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String adminid = "ef14ab1d8a7c90d7c1554c92b377b6e9";
		int value = Integer.parseInt(request.getParameter("value"));
		System.out.println("KakaoReadyAction value >>>>>> " + value);
		
		String ready = KakaoReadyServiceImpl.getKrs().getReadyInfo(adminid, value);
		System.out.println(ready);
		String redirect_url = "";
		String tid = "";
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) parser.parse(ready);
			tid = (String) jsonObj.get("tid");
			String next_redirect_mobile_url = (String) jsonObj.get("next_redirect_mobile_url");
			String next_redirect_pc_url = (String) jsonObj.get("next_redirect_pc_url");
			redirect_url = next_redirect_pc_url;
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		HttpSession paysession = request.getSession();
		paysession.setAttribute("kakaotid", tid);
//		session.setAttribute("kakaotid", tid);
		
		System.out.println("Redirect url >>>>>>>" + redirect_url);
		return redirect_url;
	}

}
