package com.baseball.gudan.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;

public class TimeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String curtime = request.getParameter("curtime");
		System.out.println("TimeAction curtime >>> " + curtime);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String result = "";
		
		try {
			Date reqDate = df.parse(curtime);
			Date curDate = df.parse(df.format(new Date()));

			// 현재시간을 요청시간의 형태로 format 후 time 가져오기
			long reqDateTime = reqDate.getTime();
			long curDateTime = curDate.getTime();

			// 초으로 표현
			long total = (reqDateTime - curDateTime) / 1000;
			System.out.println("요청시간 : " + reqDate);
			System.out.println("현재시간 : " + curDate);
			System.out.println(total + "초 차이");

			if (total > 0) {
				long day = total / (24 * 60 * 60);
				total -= day * (24 * 60 * 60);
				result += day + "일 ";

				long hour = total / (60 * 60);
				total -= hour * (60 * 60);
				result += hour + "시간 ";

				long minute = total / 60;
				total -= minute * 60;
				result += minute + "분 ";

				long second = total;
				result += second + "초";
			} else {
				result += "마감";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
