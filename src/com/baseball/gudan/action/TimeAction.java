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

			// ����ð��� ��û�ð��� ���·� format �� time ��������
			long reqDateTime = reqDate.getTime();
			long curDateTime = curDate.getTime();

			// ������ ǥ��
			long total = (reqDateTime - curDateTime) / 1000;
			System.out.println("��û�ð� : " + reqDate);
			System.out.println("����ð� : " + curDate);
			System.out.println(total + "�� ����");

			if (total > 0) {
				long day = total / (24 * 60 * 60);
				total -= day * (24 * 60 * 60);
				result += day + "�� ";

				long hour = total / (60 * 60);
				total -= hour * (60 * 60);
				result += hour + "�ð� ";

				long minute = total / 60;
				total -= minute * 60;
				result += minute + "�� ";

				long second = total;
				result += second + "��";
			} else {
				result += "����";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
