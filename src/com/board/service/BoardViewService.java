package com.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.board.dto.ReplyDTO;

import controller.CommandAction;

public class BoardViewService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.upHit(iid);
		BoardDTO dto = dao.getBoard(iid);
		
		String nickname= dao.getNickname(dto.getUserid());
		request.setAttribute("dto", dto);
		request.setAttribute("nickname", nickname);
		request.setAttribute("pg", pg);
		return "board/boardView.jsp";
	}
}
