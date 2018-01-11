package com.baseball.myinfo.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.baseball.action.Action;
import com.baseball.myinfo.service.KakaoApproveServiceImpl;

public class KakaoApproveAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("KakaoApproveAction ����!");
		String path = "/myinfo/chargefail.jsp";

		String adminid = "ef14ab1d8a7c90d7c1554c92b377b6e9";
		String pg_token = request.getParameter("pg_token");
		HttpSession paysession = request.getSession();
		String tid = (String) paysession.getAttribute("kakaotid");	//session���־ �޾ƿ�������!!!!�Ф� �����ؾ��ϳ�..
		
		System.out.println("KakaoApproveAction >>>>>>> " + pg_token + " " + tid); 

		Map<String, String> map = new HashMap<String, String>();
		map.put("adminid", adminid);
		map.put("pg_token", pg_token);
		map.put("tid", tid);
		String approve = KakaoApproveServiceImpl.getKas().getApproveInfo(map);
		System.out.println("String approve >>>>>>>> " + approve);
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) parser.parse(approve);
			String code = (String) jsonObj.get("code");
			if(code == null) {
				int price = (int) jsonObj.get("");	//�迭��������,�����ϱ�
				KakaoApproveServiceImpl.getKas().updateRookie(price); //��񿡷�Ű�μ�Ʈ��Ű��!
				path = "/myinfo/chargeok.jsp";
			}
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		return path;
	}

}
