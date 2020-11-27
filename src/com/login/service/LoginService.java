package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class LoginService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// - TODO: only password returns null.
		System.out.println(id + "      " + pw);
		LoginDAO dao = new LoginDAO();
		LoginDTO entity = dao.getLoginUser(id, pw);

		if (entity != null) {
			// 세션설정
			HttpSession session = request.getSession();
			session.setAttribute("logOK", entity);
			return "login/loginOK.jsp";
		} else {
			return "login/loginFail.jsp";
		}
	}
}
