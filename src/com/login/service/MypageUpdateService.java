package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MypageUpdateService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");

		String pwd = request.getParameter("pwd");

		System.out.println("mypwd:" + pwd);

		System.out.println("mypageUpdate!");

		LoginDTO dto = new LoginDTO();

		dto.setId(request.getParameter("id"));
		System.out.println("id:" + dto.getId());
		dto.setPw(request.getParameter("pw"));
		System.out.println("pw:" + dto.getPw());
		dto.setNickname(request.getParameter("nickname"));
		System.out.println("nickname" + dto.getNickname());
		dto.setName(request.getParameter("name"));
		System.out.println("name:" + dto.getName());
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		System.out.println("age:" + dto.getAge());
		dto.setPhone(request.getParameter("phone"));
		System.out.println("phone:" + dto.getPhone());
		dto.setAddrId(Integer.parseInt(request.getParameter("addr")));

		System.out.println("id:" + dto.getId());
		System.out.println("pw:" + dto.getPw());
		System.out.println("nickname" + dto.getNickname());
		System.out.println("name:" + dto.getName());
		System.out.println("age:" + dto.getAge());
		System.out.println("phone:" + dto.getPhone());
		// System.out.println("addr:" +dto.getAddr());

		if (request.getParameter("pwd") != ""
				&& request.getParameter("pwd").equals(dto.getPw())) {
			pwd = request.getParameter("pwd");
			pwd = pwd.toUpperCase();
			System.out.println("pwd : " + pwd);

			return "login/mypageReregister.jsp";

		} else {
			return "login/passConfFail.jsp";
		}

	}

}
