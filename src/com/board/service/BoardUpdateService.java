package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class BoardUpdateService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		return "oatjang/boardList.do?pg="+pg;
	}
}
