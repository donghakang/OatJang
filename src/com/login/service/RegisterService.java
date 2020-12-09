package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.RegisterDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class RegisterService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr1") + ", "
				+ request.getParameter("addr2");

		LoginDTO dto = new LoginDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setNickname(nickname);
		dto.setName(name);
		dto.setAge(age);
		dto.setPhone(phone);
		dto.setAddr(addr);

		System.out.println(dto);

		RegisterDAO dao = new RegisterDAO();

		if (dao.RegisterUser(dto)) {
			// TODO: 회원가입이 완료 되었습니다.
			return "index.jsp";
		} else {
			// TODO: 회원가입 오류, (이미 있는 회원 아이디 등...)
			return "login/login.jsp";
		}
	}
}
