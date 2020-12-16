package com.map.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dto.BoardDTO;
import com.map.dao.MapDAO;

import controller.CommandAction;

public class MapListService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		MapDAO mapDao = MapDAO.getInstance();

		List<BoardDTO> items = mapDao.getList();

		request.setAttribute("t", "TITLE");
		request.setAttribute("itemList", items);

		System.out
				.println(items.get(0).getLat() + ", " + items.get(0).getLng());
		System.out.println("HELLOWORLD");
		return "map/map.jsp";
	}

}