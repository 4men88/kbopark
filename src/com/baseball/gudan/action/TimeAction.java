package com.baseball.gudan.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseball.action.Action;
import com.baseball.util.NullCheck;

public class TimeAction implements Action {

	Date curDate;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String result = "";
		int len = NullCheck.nullToZero(request.getParameter("alen"));
		System.out.println(len);
		try {
			curDate = df.parse(df.format(new Date()));
			for (int i = 0; i < len; i++) {
				result += getResTime(request.getParameter("curtime"+i));	//1��1�ð�1��1�� �ѹ� ��ȯ
				if (i < len-1)
					result += ",";
			}
		} catch (ParseException e1) {
			e1.printStackTrace();
		}

		return result;
	}

	private String getResTime(String curtime) throws ParseException {
		Date reqDate = df.parse(curtime);	//�� �����ð� ����Ʈ�κ�ȯ
		String restime = "";
		// ����ð��� ��û�ð��� ���·� format �� time ��������
		long reqDateTime = reqDate.getTime();
		long curDateTime = curDate.getTime();
		// ������ ǥ��
		long total = (reqDateTime - curDateTime) / 1000;

		if (total > 0) {
			long day = total / (24 * 60 * 60);
			total -= day * (24 * 60 * 60);
			restime += day + "�� ";
			long hour = total / (60 * 60);
			total -= hour * (60 * 60);
			restime += hour + "�ð� ";
			long minute = total / 60;
			total -= minute * 60;
			restime += minute + "�� ";
			long second = total;
			restime += second + "��";
		} else {
			restime += "����";
		}
		return restime;
	}
}
