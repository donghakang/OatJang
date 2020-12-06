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
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.getBoard(iid);
		List<ReplyDTO> list = dao.getReplyList(iid);
		
		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		return "board/boardView.jsp";
	}
}
