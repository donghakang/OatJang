package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.ReplyDTO;

import controller.CommandAction;

public class BoardReplyInsertService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int iid = Integer.parseInt(request.getParameter("iid"));
		int reply = Integer.parseInt(request.getParameter("reply"));
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		ReplyDTO dto = new ReplyDTO();
		dto.setIid(iid);
		dto.setRef(ref);
		dto.setNickname(nickname);
		dto.setContent(content);
		BoardDAO dao = new BoardDAO();
		if(ref==0) {
			dao.replyInsert(dto,reply);
		}else {
			dao.subReplyInsert(dto);
		}
		return "boardView.do";
	}
}
