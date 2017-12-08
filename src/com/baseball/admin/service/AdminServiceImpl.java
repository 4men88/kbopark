package com.baseball.admin.service;

import java.util.List;
import java.util.Map;

import com.baseball.admin.dao.AdminDaoImpl;
import com.baseball.member.model.MemberDetailDto;

public class AdminServiceImpl implements AdminService{
	private static AdminService adminService;
	
	static {
		
		adminService = new AdminServiceImpl();
		
	}
	
	private AdminServiceImpl() {}
	
	
	
	public static AdminService getAdminService() {
		return adminService;
	}



	@Override
	public List<MemberDetailDto> getAllUser() {
		return AdminDaoImpl.getAdminDao().getAllUser();
	}

	@Override
	public List<MemberDetailDto> getSelectUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberDetailDto> listmember(Map<String, String> map) {
		return AdminDaoImpl.getAdminDao().listmember(map);
	}



	@Override
	public int writeNotice(Map<String, String> map) {
		return AdminDaoImpl.getAdminDao().writeNotice(map);
	}



	

}
