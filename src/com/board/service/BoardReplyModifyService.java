package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.ReplyDTO;

import controller.CommandAction;

public class BoardReplyModifyService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int rid = Integer.parseInt(request.getParameter("rid"));
		int iid = Integer.parseInt(request.getParameter("iid"));
		BoardDAO dao = new BoardDAO();
		ReplyDTO dto = dao.getReply(rid);
		request.setAttribute("dto", dto);
		request.setAttribute("iid", iid);
		
		return "board/replyModify.jsp";
	}
}
