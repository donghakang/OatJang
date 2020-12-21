package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dao.RegisterDAO;
import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class ReregisterService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("reRegister!");
		
		String roadFullAddr = request.getParameter("roadFullAddr");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String roadAddrPart2 = request.getParameter("roadAddrPart2");
		String addrDetail = request.getParameter("addrDetail");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		System.out.println("주소값 들어옴");
//		String addr = request.getParameter("addr1") + ", "
//				+ request.getParameter("addr2");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String phone = request.getParameter("phone");
		int addrId = Integer.parseInt(request.getParameter("addr"));
		
		LoginDTO loginDto = new LoginDTO();
		
		loginDto.setId(request.getParameter("id"));
		loginDto.setPw(request.getParameter("pw"));
		loginDto.setNickname(request.getParameter("nickname"));
		loginDto.setName(request.getParameter("name"));
		loginDto.setAge(Integer.parseInt(request.getParameter("age")));
		loginDto.setPhone(request.getParameter("phone"));
		loginDto.setAddrId(Integer.parseInt(request.getParameter("addr")));
		System.out.println("값 들어옴");
		AddressDTO addressDto = new AddressDTO();
		addressDto.setRoadFullAddr(roadFullAddr);
		addressDto.setRoadAddrPart1(roadAddrPart1);
		addressDto.setRoadAddrPart2(roadAddrPart2);
		addressDto.setAddrDetail(addrDetail);
		addressDto.setLat(lat);
		addressDto.setLng(lng);
		addressDto.setAddrId(addrId);
		
		
		
		
		System.out.println("id:" +loginDto.getId());
		System.out.println("pw:" +loginDto.getPw());
		System.out.println("nickname" +loginDto.getNickname());
		System.out.println("name:" +loginDto.getName());
		System.out.println("age:" +loginDto.getAge());
		System.out.println("phone:" +loginDto.getPhone());
		System.out.println("addrId:" +loginDto.getAddrId());
		
		
		System.out.println(loginDto);
		System.out.println("-----------------------------------------------");
		System.out.println(addressDto);

		RegisterDAO dao = new RegisterDAO();
		
		
		if(dao.mypageUpdate(loginDto, addressDto)) {
			return "index.jsp";
		}else {
			return "login/login.jsp";
		}
		
	}

}
