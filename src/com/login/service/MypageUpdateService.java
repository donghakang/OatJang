package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MypageUpdateService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		String pwd = "";

		System.out.println("mypwd:" + pwd);
		
		System.out.println("mypageUpdate!");
		
		LoginDTO dto = new LoginDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setPhone(request.getParameter("phone"));
		dto.setAddrId(request.getParameter("addr"));
		
		
		
		System.out.println("id:" +dto.getId());
		System.out.println("pw:" +dto.getPw());
		System.out.println("nickname" +dto.getNickname());
		System.out.println("name:" +dto.getName());
		System.out.println("age:" +dto.getAge());
		System.out.println("phone:" +dto.getPhone());
		System.out.println("addr:" +dto.getAddr());
		
		if(request.getParameter("pwd") != ""&&request.getParameter("pwd").equals(dto.getPw())) {
			pwd = request.getParameter("pwd");
			pwd = pwd.toUpperCase();
			
		}else {
			return "login/passConfFail.jsp";
		}
		System.out.println("pwd : "+pwd);
		
		
		
		return "login/mypageReregister.jsp";
	}

}
