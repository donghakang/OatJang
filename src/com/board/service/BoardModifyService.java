package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

public class BoardModifyService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.getBoard(iid);
		
		request.setAttribute("dto", dto);
		request.setAttribute("iid", iid);
		request.setAttribute("pg", pg);
<<<<<<< HEAD
=======
		
>>>>>>> f7e0610cc3b2965c86e2a27029a36594e39fc751
		return "board/boardModify.jsp";
	}
}